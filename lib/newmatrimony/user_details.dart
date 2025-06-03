// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'api/apiservice.dart';
// import 'edit_user.dart';
// import 'user_class.dart';
//
// class UserDetailsPage extends StatefulWidget {
//   final User user;
//   final Function(User) onUpdate;
//   final Function(User) onDelete;
//
//   UserDetailsPage({
//     required this.user,
//     required this.onUpdate,
//     required this.onDelete,
//   });
//
//   @override
//   _UserDetailsPageState createState() => _UserDetailsPageState();
// }
//
// class _UserDetailsPageState extends State<UserDetailsPage> {
//   late User currentUser;
//   bool isFavorite = false;
//   final ApiService apiService = ApiService(); // Create an instance of ApiService
//
//   @override
//   void initState() {
//     super.initState();
//     currentUser = widget.user;
//     isFavorite = currentUser.isFavorite;
//   }
//   int _calculateAge(String dob) {
//     DateTime birthDate = DateFormat("yyyy-MM-dd").parse(dob);  // Parse the date
//     DateTime today = DateTime.now();
//     int age = today.year - birthDate.year;
//
//     // Adjust age if the birthday hasn't occurred yet this year
//     if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
//       age--;
//     }
//
//     return age;
//   }
//
//   // Update user via API
//   void _updateUser(User updatedUser) async {
//     bool success = await apiService.updateUser(updatedUser.id!.toString(), updatedUser.toJson());  // Update via API
//     if (success) {
//       setState(() {
//         currentUser = updatedUser;
//       });
//       widget.onUpdate(updatedUser);
//     } else {
//       _showErrorDialog("Failed to update user");
//     }
//   }
//   void _showDeleteConfirmationDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext dialogContext) {
//         return AlertDialog(
//           title: Text('Delete User', style: GoogleFonts.poppins()),
//           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins()),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(dialogContext);
//               },
//               child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.grey)),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await apiService.deleteUser(widget.user.id!.toString());  // Call the delete API
//                 Navigator.pop(dialogContext);
//                 widget.onDelete(widget.user);
//                 Navigator.pop(context);
//               },
//               child: Text('Delete', style: GoogleFonts.poppins(color: Colors.redAccent)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   // Show an error dialog
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Error', style: GoogleFonts.poppins()),
//         content: Text(message, style: GoogleFonts.poppins()),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('OK', style: GoogleFonts.poppins(color: Colors.redAccent)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           currentUser.name!,
//           style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.redAccent,
//         elevation: 5,
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(
//               currentUser.isFavorite ? Icons.favorite : Icons.favorite_border,
//               color: currentUser.isFavorite ? Colors.red : Colors.white,
//             ),
//             onPressed: () async {
//               setState(() {
//                 currentUser.isFavorite = !currentUser.isFavorite;
//               });
//
//               bool success = await apiService.updateUser(currentUser.id!.toString(), currentUser.toJson());  // Update via API
//               if (!success) {
//                 _showErrorDialog("Failed to update favorite status");
//               }
//
//               widget.onUpdate(currentUser);
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.red.shade100],  // Red gradient
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildSectionTitle("About"),
//                 _buildDetailRow("Name", currentUser.name!),
//                 _buildDetailRow("Gender", currentUser.gender ?? 'Not specified'),
//                 _buildDetailRow("Date of Birth", currentUser.dob ?? 'Not specified'),
//                 _buildDetailRow("Age", currentUser.dob != null ? _calculateAge(currentUser.dob!).toString() : 'Not specified'),
//                 _buildDetailRow("Marital Status", currentUser.maritalStatus ?? 'Not specified'),
//                 _buildSectionTitle("Religious Background"),
//                 _buildDetailRow("Country", currentUser.country ?? 'Not specified'),
//                 _buildDetailRow("State", currentUser.state ?? 'Not specified'),
//                 _buildDetailRow("City", currentUser.city ?? 'Not specified'),
//                 _buildDetailRow("Religion", currentUser.religion ?? 'Not specified'),
//                 _buildDetailRow("Caste", currentUser.caste ?? 'Not specified'),
//                 _buildDetailRow("Sub Caste", currentUser.subCaste ?? 'Not specified'),
//                 _buildSectionTitle("Professional Details"),
//                 _buildDetailRow("Higher Education", currentUser.education ?? 'Not specified'),
//                 _buildDetailRow("Occupation", currentUser.occupation ?? 'Not specified'),
//                 _buildSectionTitle("Contact Details"),
//                 _buildDetailRow("Email", currentUser.email ?? 'Not specified'),
//                 _buildDetailRow("Phone", currentUser.phone ?? 'Not specified'),
//                 SizedBox(height: 32),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () async {
//                         User? updatedUser = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditUserPage(user: currentUser),
//                           ),
//                         );
//                         if (updatedUser != null) {
//                           _updateUser(updatedUser);
//                         }
//                       },
//                       icon: Icon(Icons.edit, color: Colors.white),
//                       label: Text("Edit", style: GoogleFonts.poppins()),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blueAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                       ),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () => _showDeleteConfirmationDialog(),
//                       icon: Icon(Icons.delete, color: Colors.white),
//                       label: Text("Delete", style: GoogleFonts.poppins()),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.redAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                       ),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () => Navigator.pop(context),
//                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                       label: Text("Back", style: GoogleFonts.poppins()),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12.0),
//       child: Text(
//         title,
//         style: GoogleFonts.poppins(
//           fontSize: 18.0,
//           fontWeight: FontWeight.bold,
//           color: Colors.redAccent,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 2,
//             child: Text(
//               "$title:",
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16.0,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(
//               value,
//               style: GoogleFonts.poppins(
//                 fontSize: 16.0,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api/apiservice.dart';
import 'edit_user.dart';
import 'user_class.dart';

class UserDetailsPage extends StatefulWidget {
  final User user;
  final Function(User) onUpdate;
  final Function(User) onDelete;

  UserDetailsPage({
    required this.user,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late User currentUser;
  final ApiService apiService = ApiService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    currentUser = widget.user;
  }

  void _updateUser(User updatedUser) async {
    setState(() => _isLoading = true);
    try {
      User result = await apiService.updateUser(updatedUser.id!.toString(), updatedUser);
      setState(() {
        currentUser = result;
        _isLoading = false;
      });
      widget.onUpdate(result);
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorDialog("Failed to update user: $e");
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Delete User', style: GoogleFonts.poppins()),
          content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () async {
                setState(() => _isLoading = true);
                try {
                  await apiService.deleteUser(widget.user.id!.toString());
                  Navigator.pop(dialogContext);
                  widget.onDelete(widget.user);
                  Navigator.pop(context);
                } catch (e) {
                  setState(() => _isLoading = false);
                  Navigator.pop(dialogContext);
                  _showErrorDialog("Failed to delete user: $e");
                }
              },
              child: Text('Delete', style: GoogleFonts.poppins(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error', style: GoogleFonts.poppins()),
        content: Text(message, style: GoogleFonts.poppins()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: GoogleFonts.poppins(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentUser.name ?? 'Unknown',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 5,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              currentUser.isFavorite == 1 ? Icons.favorite : Icons.favorite_border,
              color: currentUser.isFavorite == 1 ? Colors.red : Colors.white,
            ),
            onPressed: () async {
              setState(() {
                currentUser.isFavorite = (currentUser.isFavorite == 1) ? 0 : 1;
                _isLoading = true;
              });
              try {
                await apiService.updateUser(currentUser.id!.toString(), currentUser);
                widget.onUpdate(currentUser);
                setState(() => _isLoading = false);
              } catch (e) {
                setState(() {
                  currentUser.isFavorite = (currentUser.isFavorite == 1) ? 0 : 1; // Revert
                  _isLoading = false;
                });
                _showErrorDialog("Failed to update favorite status: $e");
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red.shade50, Colors.redAccent.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.redAccent.shade100,
                            child: Text(
                              currentUser.name != null && currentUser.name!.isNotEmpty
                                  ? currentUser.name![0].toUpperCase()
                                  : '?',
                              style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentUser.name ?? 'Unknown',
                                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${currentUser.age} years • ${currentUser.gender ?? 'N/A'}",
                                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700]),
                              ),
                              Text(
                                currentUser.city ?? 'N/A',
                                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // About Section
                  _buildSectionCard("About", [
                    _buildDetailRow("Name", currentUser.name ?? 'Not specified'),
                    _buildDetailRow("Gender", currentUser.gender ?? 'Not specified'),
                    _buildDetailRow("Date of Birth", currentUser.dob ?? 'Not specified'),
                    _buildDetailRow("Age", currentUser.age.toString()),
                    _buildDetailRow("Marital Status", currentUser.maritalStatus ?? 'Not specified'),
                  ]),
                  // Religious Background Section
                  _buildSectionCard("Religious Background", [
                    _buildDetailRow("Country", currentUser.country ?? 'Not specified'),
                    _buildDetailRow("State", currentUser.state ?? 'Not specified'),
                    _buildDetailRow("City", currentUser.city ?? 'Not specified'),
                    _buildDetailRow("Religion", currentUser.religion ?? 'Not specified'),
                    _buildDetailRow("Caste", currentUser.caste ?? 'Not specified'),
                    _buildDetailRow("Sub Caste", currentUser.subCaste ?? 'Not specified'),
                  ]),
                  // Professional Details Section
                  _buildSectionCard("Professional Details", [
                    _buildDetailRow("Higher Education", currentUser.education ?? 'Not specified'),
                    _buildDetailRow("Occupation", currentUser.occupation ?? 'Not specified'),
                  ]),
                  // Contact Details Section
                  _buildSectionCard("Contact Details", [
                    _buildDetailRow("Email", currentUser.email ?? 'Not specified'),
                    _buildDetailRow("Phone", currentUser.phone ?? 'Not specified'),
                  ]),
                  SizedBox(height: 80), // Space for FABs
                ],
              ),
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(color: Colors.redAccent),
            ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              User? updatedUser = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditUserPage(user: currentUser)),
              );
              if (updatedUser != null) {
                _updateUser(updatedUser);
              }
            },
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.edit),
            tooltip: 'Edit',
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _showDeleteConfirmationDialog,
            backgroundColor: Colors.redAccent,
            child: Icon(Icons.delete),
            tooltip: 'Delete',
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            backgroundColor: Colors.green,
            child: Icon(Icons.arrow_back),
            tooltip: 'Back',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
            SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$title:",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[700]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}