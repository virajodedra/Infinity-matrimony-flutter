// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'database_helper.dart';
// import 'edit_user.dart';
// import 'user_class.dart';
// import 'user_data.dart'; // Make sure this file is for managing your DatabaseHelper instance
// import 'user_details.dart';
//
// class FavoriteUsersPage extends StatefulWidget {
//   @override
//   _FavoriteUsersPageState createState() => _FavoriteUsersPageState();
// }
//
// class _FavoriteUsersPageState extends State<FavoriteUsersPage> {
//   TextEditingController searchController = TextEditingController();
//   List<User> allFavoriteUsers = [];
//   List<User> filteredFavoriteUsers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFavoriteUsers(); // Load favorite users from the database
//   }
//
//   void _loadFavoriteUsers() async {
//     allFavoriteUsers = await DatabaseHelper.instance.fetchUsers();
//     filteredFavoriteUsers = allFavoriteUsers.where((user) => user.isFavorite).toList();
//     setState(() {});
//   }
//
//   void _toggleFavorite(User user) async {
//     user.isFavorite = !user.isFavorite;
//     await DatabaseHelper.instance.updateUser(user); // Update the favorite status in the database
//     _loadFavoriteUsers(); // Reload the list of favorite users from the database
//   }
//
//   void _confirmDelete(int index) async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
//           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await DatabaseHelper.instance.deleteUser(allFavoriteUsers[index].id!); // Delete the user from the database
//                 _loadFavoriteUsers(); // Reload the list of favorite users from the database
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Users', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
//         backgroundColor: Colors.redAccent,
//         centerTitle: true,
//         elevation: 5,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.redAccent.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: searchController,
//                 onChanged: (query) {
//                   setState(() {
//                     if (query.isEmpty) {
//                       filteredFavoriteUsers = List.from(allFavoriteUsers.where((user) => user.isFavorite));
//                     } else {
//                       filteredFavoriteUsers = allFavoriteUsers
//                           .where((user) =>
//                       (user.name?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
//                           (user.city?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
//                           (user.email?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
//                           (user.phone?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
//                           (user.age.toString().contains(query))) // Include age in search
//                           .toList();
//                     }
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Search Favorite User',
//                   labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
//                   prefixIcon: Icon(Icons.search, color: Colors.redAccent),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(color: Colors.redAccent),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: filteredFavoriteUsers.isEmpty
//                   ? Center(
//                 child: Text(
//                   "No data found",
//                   style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
//                 ),
//               )
//                   : ListView.builder(
//                 itemCount: filteredFavoriteUsers.length,
//                 itemBuilder: (context, index) {
//                   User user = filteredFavoriteUsers[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 5,
//                     child: ListTile(
//                       contentPadding: EdgeInsets.all(15),
//                       title: Text(user.name!, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500)),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("State: ${user.city}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
//                           Text("Phone: ${user.phone}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
//                           Text("Email: ${user.email}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
//                           Text("DOB: ${user.dob}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
//                           Text("Age: ${user.age}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
//                         ],
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(
//                               user.isFavorite ? Icons.favorite : Icons.favorite_border,
//                               color: user.isFavorite ? Colors.red : Colors.grey,
//                             ),
//                             onPressed: () => _toggleFavorite(user),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () async {
//                               User? updatedUser = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => EditUserPage(user: user),
//                                 ),
//                               );
//                               if (updatedUser != null) {
//                                 await DatabaseHelper.instance.updateUser(updatedUser); // Update user in database
//                                 _loadFavoriteUsers(); // Reload data
//                               }
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => _confirmDelete(index),
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UserDetailsPage(
//                               user: user,
//                               onUpdate: (updatedUser) async {
//                                 await DatabaseHelper.instance.updateUser(updatedUser); // Update user in database
//                                 _loadFavoriteUsers(); // Reload data
//                               },
//                               onDelete: (deletedUser) async {
//                                 await DatabaseHelper.instance.deleteUser(deletedUser.id!); // Delete user
//                                 _loadFavoriteUsers(); // Reload data
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'database_helper.dart';
// import 'edit_user.dart';
// import 'user_class.dart';
// import 'user_data.dart'; // Make sure this file is for managing your DatabaseHelper instance
// import 'user_details.dart';
//
// class FavoriteUsersPage extends StatefulWidget {
//   @override
//   _FavoriteUsersPageState createState() => _FavoriteUsersPageState();
// }
//
// class _FavoriteUsersPageState extends State<FavoriteUsersPage> {
//   TextEditingController searchController = TextEditingController();
//   List<User> allFavoriteUsers = [];
//   List<User> filteredFavoriteUsers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFavoriteUsers(); // Load favorite users from the database
//   }
//
//   void _loadUsers() async {
//     List<User> users = await DatabaseHelper.instance.fetchUsers();
//     setState(() {
//       allFavoriteUsers = users.where((user) => user.isFavorite).toList();
//       filteredFavoriteUsers = List.from(allFavoriteUsers);
//     });
//   }
//
//   void _loadFavoriteUsers() async {
//     allFavoriteUsers = await DatabaseHelper.instance.fetchUsers();
//     filteredFavoriteUsers = allFavoriteUsers.where((user) => user.isFavorite).toList();
//     setState(() {});
//   }
//
//   void _toggleFavorite(User user) async {
//     user.isFavorite = !user.isFavorite;
//     await DatabaseHelper.instance.updateUser(user); // Update the favorite status in the database
//     _loadFavoriteUsers(); // Reload the list of favorite users from the database
//   }
//
//   void _filterFavoriteUsers(String query) async {
//     query = query.toLowerCase().trim();
//
//     List<User> users;
//     if (query.isEmpty) {
//       final db = await DatabaseHelper.instance.database;
//       final result = await db.query(
//         'users',
//         where: 'isFavorite = 1',
//       );
//       users = result.map((json) => User.fromMap(json)).toList();
//     } else {
//       final db = await DatabaseHelper.instance.database;
//       final result = await db.query(
//         'users',
//         where: '''
//         isFavorite = 1 AND (
//           LOWER(name) LIKE ? OR
//           LOWER(city) LIKE ? OR
//           LOWER(email) LIKE ? OR
//           LOWER(phone) LIKE ? OR
//           CAST(age AS TEXT) LIKE ?
//         )
//       ''',
//         whereArgs: List.filled(5, '%$query%'),
//       );
//
//       users = result.map((json) => User.fromMap(json)).toList();
//     }
//
//     setState(() {
//       filteredFavoriteUsers = users; // Updates the UI dynamically
//     });
//   }
//
//
//   void _confirmDelete(int index) async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
//           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await DatabaseHelper.instance.deleteUser(allFavoriteUsers[index].id!); // Delete the user from the database
//                 _loadFavoriteUsers(); // Reload the list of favorite users from the database
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Users', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
//         backgroundColor: Colors.redAccent,
//         centerTitle: true,
//         elevation: 5,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.redAccent.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: TextField(
//                 controller: searchController,
//                 onChanged: (query) => _filterFavoriteUsers(query),
//                 decoration: InputDecoration(
//                   labelText: 'Search Favorite User',
//                   labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
//                   prefixIcon: Icon(Icons.search, color: Colors.redAccent),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide(color: Colors.redAccent),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: filteredFavoriteUsers.isEmpty
//                   ? Center(
//                 child: Text(
//                   "No data found",
//                   style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
//                 ),
//               )
//                   : ListView.builder(
//                 itemCount: filteredFavoriteUsers.length,
//                 itemBuilder: (context, index) {
//                   User user = filteredFavoriteUsers[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     elevation: 6,
//                     child: ListTile(
//                       contentPadding: EdgeInsets.all(16),
//                       title: Text(
//                         user.name!,
//                         overflow: TextOverflow.ellipsis, // Prevent overflow
//                         style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "State: ${user.city}",
//                             overflow: TextOverflow.ellipsis, // Prevent overflow
//                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
//                           ),
//                           Text(
//                             "Phone: ${user.phone}",
//                             overflow: TextOverflow.ellipsis, // Prevent overflow
//                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
//                           ),
//                           Text(
//                             "Email: ${user.email}",
//                             overflow: TextOverflow.ellipsis, // Prevent overflow
//                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
//                           ),
//                           Text(
//                             "DOB: ${user.dob}",
//                             overflow: TextOverflow.ellipsis, // Prevent overflow
//                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
//                           ),
//                           Text(
//                             "Age: ${user.age}",
//                             overflow: TextOverflow.ellipsis, // Prevent overflow
//                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
//                           ),
//                         ],
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(
//                               user.isFavorite ? Icons.favorite : Icons.favorite_border,
//                               color: user.isFavorite ? Colors.red : Colors.grey,
//                             ),
//                             onPressed: () => _toggleFavorite(user),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () async {
//                               User? updatedUser = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => EditUserPage(user: user),
//                                 ),
//                               );
//                               if (updatedUser != null) {
//                                 await DatabaseHelper.instance.updateUser(updatedUser); // Update user in database
//                                 _loadFavoriteUsers(); // Reload data
//                               }
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => _confirmDelete(index),
//                           ),
//                         ],
//                       ),
//                       onTap: () async {
//                         User? updatedUser = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UserDetailsPage(
//                               user: user,
//                               onUpdate: (updatedUser) {
//                                 setState(() {
//                                   _loadUsers(); // Refresh list after update
//                                 });
//                               },
//                               onDelete: (deletedUser) {
//                                 setState(() {
//                                   _loadUsers(); // Refresh list after deletion
//                                 });
//                               },
//                             ),
//                           ),
//                         );
//                         _loadUsers();
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//search btn function

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'database_helper.dart';
// import 'edit_user.dart';
// import 'user_class.dart';
// import 'user_details.dart';
//
// class FavoriteUsersPage extends StatefulWidget {
//   @override
//   _FavoriteUsersPageState createState() => _FavoriteUsersPageState();
// }
//
// class _FavoriteUsersPageState extends State<FavoriteUsersPage> {
//   TextEditingController searchController = TextEditingController();
//   List<User> allFavoriteUsers = [];
//   List<User> filteredFavoriteUsers = [];
//   Timer? _debounce;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFavoriteUsers();
//   }
//
//   /// Load favorite users from the database
//   void _loadFavoriteUsers() async {
//     List<User> users = await DatabaseHelper.instance.fetchUsers();
//     setState(() {
//       allFavoriteUsers = users.where((user) => user.isFavorite).toList();
//       filteredFavoriteUsers = List.from(allFavoriteUsers);
//     });
//   }
//
//   /// Debounced search function for better performance
//   void _onSearchChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(Duration(milliseconds: 300), () {
//       _filterFavoriteUsers(query);
//     });
//   }
//
//   /// Filter users based on search query
//   void _filterFavoriteUsers(String query) {
//     setState(() {
//       if (query.trim().isEmpty) {
//         filteredFavoriteUsers = allFavoriteUsers;
//       } else {
//         query = query.toLowerCase().trim();
//         filteredFavoriteUsers = allFavoriteUsers.where((user) {
//           return (user.name?.toLowerCase().contains(query) ?? false) ||
//               (user.email?.toLowerCase().contains(query) ?? false) ||
//               (user.phone?.toLowerCase().contains(query) ?? false) ||
//               (user.city?.toLowerCase().contains(query) ?? false) ||
//               (user.age.toString().contains(query));
//         }).toList();
//       }
//     });
//   }
//
//   void _toggleFavorite(User user) async {
//     user.isFavorite = !user.isFavorite;
//     await DatabaseHelper.instance.updateUser(user);
//     _loadFavoriteUsers();
//   }
//
//   void _confirmDelete(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
//           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await DatabaseHelper.instance.deleteUser(filteredFavoriteUsers[index].id!);
//                 _loadFavoriteUsers();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Users', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
//         backgroundColor: Colors.redAccent,
//         centerTitle: true,
//         elevation: 5,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.redAccent.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: TextField(
//                 controller: searchController,
//                 onChanged: _onSearchChanged, // Debounced search
//                 decoration: InputDecoration(
//                   labelText: 'Search Favorite User',
//                   labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
//                   prefixIcon: Icon(Icons.search, color: Colors.redAccent),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide(color: Colors.redAccent),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: filteredFavoriteUsers.isEmpty
//                   ? Center(
//                 child: Text(
//                   "No data found",
//                   style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
//                 ),
//               )
//                   : ListView.builder(
//                 itemCount: filteredFavoriteUsers.length,
//                 itemBuilder: (context, index) {
//                   User user = filteredFavoriteUsers[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     elevation: 6,
//                     child: ListTile(
//                       contentPadding: EdgeInsets.all(16),
//                       title: Text(
//                         user.name!,
//                         overflow: TextOverflow.ellipsis, // Prevent overflow
//                         maxLines: 1,
//                         style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildOverflowText("State", user.state),
//                           _buildOverflowText("Phone", user.phone),
//                           _buildOverflowText("Email", user.email),
//                           _buildOverflowText("DOB", user.dob),
//                           _buildOverflowText("Age", user.age.toString()),
//                         ],
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(
//                               user.isFavorite ? Icons.favorite : Icons.favorite_border,
//                               color: user.isFavorite ? Colors.red : Colors.grey,
//                             ),
//                             onPressed: () => _toggleFavorite(user),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () async {
//                               User? updatedUser = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => EditUserPage(user: user),
//                                 ),
//                               );
//                               if (updatedUser != null) {
//                                 await DatabaseHelper.instance.updateUser(updatedUser);
//                                 _loadFavoriteUsers();
//                               }
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => _confirmDelete(index),
//                           ),
//                         ],
//                       ),
//                       onTap: () async {
//                         User? updatedUser = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UserDetailsPage(
//                               user: user,
//                               onUpdate: (_) => _loadFavoriteUsers(),
//                               onDelete: (_) => _loadFavoriteUsers(),
//                             ),
//                           ),
//                         );
//                         _loadFavoriteUsers();
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Helper function to prevent overflow in user details
//   Widget _buildOverflowText(String label, String? value) {
//     return Text(
//       "$label: ${value ?? 'N/A'}",
//       overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
//       maxLines: 1, // Restricts to a single line
//       style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
//     );
//   }
// }

//15/02/2025

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'database_helper.dart';
// import 'edit_user.dart';
// import 'user_class.dart';
// import 'user_details.dart';
//
// class FavoriteUsersPage extends StatefulWidget {
//   @override
//   _FavoriteUsersPageState createState() => _FavoriteUsersPageState();
// }
//
// class _FavoriteUsersPageState extends State<FavoriteUsersPage> {
//   TextEditingController searchController = TextEditingController();
//   List<User> allFavoriteUsers = [];
//   List<User> filteredFavoriteUsers = [];
//   Timer? _debounce;
//   String _sortField = 'name';
//   bool _isAscending = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFavoriteUsers();
//   }
//
//   void _loadFavoriteUsers() async {
//     List<User> users = await DatabaseHelper.instance.fetchUsers();
//     setState(() {
//       allFavoriteUsers = users.where((user) => user.isFavorite).toList();
//       filteredFavoriteUsers = List.from(allFavoriteUsers);
//       _applySorting();
//     });
//   }
//
//   void _onSearchChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(Duration(milliseconds: 300), () {
//       _filterFavoriteUsers(query);
//     });
//   }
//
//   void _filterFavoriteUsers(String query) {
//     setState(() {
//       if (query.trim().isEmpty) {
//         filteredFavoriteUsers = allFavoriteUsers;
//       } else {
//         query = query.toLowerCase().trim();
//         filteredFavoriteUsers = allFavoriteUsers.where((user) {
//           return (user.name?.toLowerCase().contains(query) ?? false) ||
//               (user.email?.toLowerCase().contains(query) ?? false) ||
//               (user.phone?.toLowerCase().contains(query) ?? false) ||
//               (user.city?.toLowerCase().contains(query) ?? false) ||
//               (user.age.toString().contains(query));
//         }).toList();
//       }
//     });
//   }
//
//   void _toggleFavorite(User user) async {
//     user.isFavorite = !user.isFavorite;
//     await DatabaseHelper.instance.updateUser(user);
//     _loadFavoriteUsers();
//   }
//
//   void _editUser(User user) async {
//     User? updatedUser = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditUserPage(user: user),
//       ),
//     );
//
//     if (updatedUser != null) {
//       await DatabaseHelper.instance.updateUser(updatedUser);
//       _loadFavoriteUsers();
//     }
//   }
//
//   void _confirmDelete(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
//           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await DatabaseHelper.instance.deleteUser(filteredFavoriteUsers[index].id!);
//                 _loadFavoriteUsers();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _applySorting() {
//     setState(() {
//       filteredFavoriteUsers = List.from(allFavoriteUsers);
//       filteredFavoriteUsers.sort((a, b) {
//         dynamic aValue = _getFieldValue(a, _sortField);
//         dynamic bValue = _getFieldValue(b, _sortField);
//         if (aValue == null || bValue == null) return 0; // Handling null values
//
//         if (aValue is String && bValue is String) {
//           return _isAscending
//               ? aValue.compareTo(bValue)
//               : bValue.compareTo(aValue);
//         } else if (aValue is num && bValue is num) {
//           return _isAscending
//               ? aValue.compareTo(bValue)
//               : bValue.compareTo(aValue);
//         }
//         return 0;
//       });
//     });
//   }
//
//   dynamic _getFieldValue(User user, String field) {
//     switch (field) {
//       case 'name':
//         return user.name ?? '';
//       case 'email':
//         return user.email ?? '';
//       case 'phone':
//         return user.phone ?? '';
//       case 'city':
//         return user.city ?? '';
//       case 'age':
//         return user.age;
//       default:
//         return '';
//     }
//   }
//
//   void _showSortingDialog() {
//     String tempSortField = _sortField;
//     bool tempIsAscending = _isAscending;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Sort Users', style: GoogleFonts.poppins(fontSize: 16)),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               DropdownButtonFormField<String>(
//                 value: tempSortField,
//                 items: ['name', 'email', 'phone', 'city', 'age'].map((field) {
//                   return DropdownMenuItem(
//                       value: field, child: Text(field.toUpperCase()));
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) tempSortField = value;
//                 },
//                 decoration: InputDecoration(labelText: 'Sort By'),
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<bool>(
//                 value: tempIsAscending,
//                 items: [
//                   DropdownMenuItem(value: true, child: Text('Ascending')),
//                   DropdownMenuItem(value: false, child: Text('Descending')),
//                 ],
//                 onChanged: (value) {
//                   if (value != null) tempIsAscending = value;
//                 },
//                 decoration: InputDecoration(labelText: 'Order'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _sortField = tempSortField;
//                   _isAscending = tempIsAscending;
//                   _applySorting();
//                 });
//                 Navigator.pop(context);
//               },
//               child: Text('Apply'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Users',
//             style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
//         backgroundColor: Colors.redAccent,
//         elevation: 5,
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.redAccent.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: searchController,
//                       onChanged: _onSearchChanged,
//                       decoration: InputDecoration(
//                         labelText: 'Search User',
//                         labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
//                         prefixIcon: Icon(Icons.search, color: Colors.redAccent),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide: BorderSide(color: Colors.redAccent),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.sort, color: Colors.redAccent),
//                     onPressed: _showSortingDialog,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: filteredFavoriteUsers.isEmpty
//                   ? Center(
//                 child: Text(
//                   "No data found",
//                   style: GoogleFonts.poppins(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black54),
//                 ),
//               )
//                   : ListView.builder(
//                 itemCount: filteredFavoriteUsers.length,
//                 itemBuilder: (context, index) {
//                   User user = filteredFavoriteUsers[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Slightly larger margin
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), // More rounded corners
//                     elevation: 10, // More subtle elevation for a floating effect
//                     shadowColor: Colors.black.withOpacity(0.1), // Lighter shadow for more modern look
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.white, Colors.grey[50]!], // Soft gradient background
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(25), // Round corners on container
//                       ),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // More compact padding
//                             title: Text(
//                               user.name!,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 24, // Larger title for more prominence
//                                 fontWeight: FontWeight.w700, // Bolder font weight
//                                 color: Colors.black87, // Darker color for better readability
//                               ),
//                             ),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 _buildIconText(Icons.location_on, user.state, fontSize: 16),
//                                 _buildIconText(Icons.phone, user.phone, fontSize: 16),
//                                 _buildIconText(Icons.email, user.email, fontSize: 16),
//                                 _buildIconText(Icons.calendar_today, user.dob, fontSize: 16),
//                                 _buildIconText(Icons.cake, user.age.toString(), fontSize: 16),
//                                 SizedBox(height: 16), // More space to separate the info section
//                               ],
//                             ),
//                             onTap: () async {
//                               User? updatedUser = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => UserDetailsPage(
//                                     user: user,
//                                     onUpdate: (_) => _loadFavoriteUsers(),
//                                     onDelete: (_) => _loadFavoriteUsers(),
//                                   ),
//                                 ),
//                               );
//                               _loadFavoriteUsers();
//                             },
//                           ),
//                           // Action Buttons at the bottom
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 // Favorite Icon
//                                 IconButton(
//                                   icon: Icon(
//                                     user.isFavorite ? Icons.favorite : Icons.favorite_border,
//                                     color: user.isFavorite ? Colors.red : Colors.grey[500],
//                                     size: 28, // Slightly larger icon
//                                   ),
//                                   onPressed: () => _toggleFavorite(user),
//                                 ),
//                                 // Edit Icon
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.edit,
//                                     color: Colors.blue[600],
//                                     size: 28, // Slightly larger icon
//                                   ),
//                                   onPressed: () => _editUser(user),
//                                 ),
//                                 // Delete Icon
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.delete,
//                                     color: Colors.red[600],
//                                     size: 28, // Slightly larger icon
//                                   ),
//                                   onPressed: () => _confirmDelete(index),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIconText(IconData icon, String? value, {double fontSize = 14}) {
//     return Row(
//       children: [
//         Icon(icon, size: 18, color: Colors.redAccent), // Icon before the text
//         SizedBox(width: 8),
//         Text(
//           value ?? 'N/A',  // Show 'N/A' if value is null
//           overflow: TextOverflow.ellipsis, // Prevents overflow
//           maxLines: 1, // Restrict to a single line
//           style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black54),
//         ),
//       ],
//     );
//   }
// }

// //new card design
// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
//
// import 'edit_user.dart';
// import 'user_class.dart';
// import 'user_details.dart';
//
//
// class FavoriteUsersPage extends StatefulWidget {
//   @override
//   _FavoriteUsersPageState createState() => _FavoriteUsersPageState();
// }
//
// class _FavoriteUsersPageState extends State<FavoriteUsersPage> {
//   TextEditingController searchController = TextEditingController();
//   List<User> allFavoriteUsers = [];
//   List<User> filteredFavoriteUsers = [];
//   final String mockApiUrl = 'https://67b41a5c392f4aa94fa95325.mockapi.io/todo/matrimony';
//   Timer? _debounce;
//   String _sortField = 'name';
//   bool _isAscending = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFavoriteUsers();
//   }
//
//   void _loadFavoriteUsers() async {
//     final response = await http.get(Uri.parse(mockApiUrl));
//     if (response.statusCode == 200) {
//       List<User> users = (json.decode(response.body) as List)
//           .map((data) => User.fromJson(data))
//           .toList();
//       setState(() {
//         allFavoriteUsers = users.where((user) => user.isFavorite).toList();
//         filteredFavoriteUsers = List.from(allFavoriteUsers);
//         _applySorting();
//       });
//     } else {
//       throw Exception('Failed to load users');
//     }
//   }
//
//   void _onSearchChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(Duration(milliseconds: 300), () {
//       _filterFavoriteUsers(query);
//     });
//   }
//
//   void _filterFavoriteUsers(String query) {
//     setState(() {
//       if (query.trim().isEmpty) {
//         filteredFavoriteUsers = allFavoriteUsers;
//       } else {
//         query = query.toLowerCase().trim();
//         filteredFavoriteUsers = allFavoriteUsers.where((user) {
//           return (user.name?.toLowerCase().contains(query) ?? false) ||
//               (user.email?.toLowerCase().contains(query) ?? false) ||
//               (user.phone?.toLowerCase().contains(query) ?? false) ||
//               (user.city?.toLowerCase().contains(query) ?? false) ||
//               (user.age.toString().contains(query));
//         }).toList();
//       }
//     });
//   }
//
//   void _toggleFavorite(User user) async {
//     user.isFavorite = !user.isFavorite;
//     final response = await http.put(
//       Uri.parse('$mockApiUrl/${user.id}'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(user.toJson()),
//     );
//     if (response.statusCode == 200) {
//       _loadFavoriteUsers();
//     } else {
//       throw Exception('Failed to update favorite status');
//     }
//   }
//
//   void _editUser(User user) async {
//     User? updatedUser = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditUserPage(user: user),
//       ),
//     );
//
//     if (updatedUser != null) {
//       final response = await http.put(
//         Uri.parse('$mockApiUrl/${updatedUser.id}'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(updatedUser.toJson()),
//       );
//
//       if (response.statusCode == 200) {
//         _loadFavoriteUsers();
//       } else {
//         throw Exception('Failed to update user');
//       }
//     }
//   }
//
//   void _confirmDelete(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion',
//               style: GoogleFonts.poppins(fontSize: 16)),
//           content: Text('Are you sure you want to delete this user?',
//               style: GoogleFonts.poppins(fontSize: 14)),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//             TextButton(
//               onPressed: () async {
//                 final response = await http.delete(
//                   Uri.parse('$mockApiUrl/${filteredFavoriteUsers[index].id}'),
//                 );
//                 if (response.statusCode == 200) {
//                   _loadFavoriteUsers();
//                   Navigator.of(context).pop();
//                 } else {
//                   throw Exception('Failed to delete user');
//                 }
//               },
//               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _applySorting() {
//     setState(() {
//       filteredFavoriteUsers = List.from(allFavoriteUsers);
//       filteredFavoriteUsers.sort((a, b) {
//         dynamic aValue = _getFieldValue(a, _sortField);
//         dynamic bValue = _getFieldValue(b, _sortField);
//         if (aValue == null || bValue == null) return 0;
//
//         if (aValue is String && bValue is String) {
//           return _isAscending
//               ? aValue.compareTo(bValue)
//               : bValue.compareTo(aValue);
//         } else if (aValue is num && bValue is num) {
//           return _isAscending
//               ? aValue.compareTo(bValue)
//               : bValue.compareTo(aValue);
//         }
//         return 0;
//       });
//     });
//   }
//
//   dynamic _getFieldValue(User user, String field) {
//     switch (field) {
//       case 'name':
//         return user.name ?? '';
//       case 'email':
//         return user.email ?? '';
//       case 'phone':
//         return user.phone ?? '';
//       case 'city':
//         return user.city ?? '';
//       case 'age':
//         return user.age;
//       default:
//         return '';
//     }
//   }
//
//   void _showSortingDialog() {
//     String tempSortField = _sortField;
//     bool tempIsAscending = _isAscending;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Sort Users', style: GoogleFonts.poppins(fontSize: 16)),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               DropdownButtonFormField<String>(
//                 value: tempSortField,
//                 items: ['name', 'email', 'phone', 'city', 'age'].map((field) {
//                   return DropdownMenuItem(
//                       value: field, child: Text(field.toUpperCase()));
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) tempSortField = value;
//                 },
//                 decoration: InputDecoration(labelText: 'Sort By'),
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<bool>(
//                 value: tempIsAscending,
//                 items: [
//                   DropdownMenuItem(value: true, child: Text('Ascending')),
//                   DropdownMenuItem(value: false, child: Text('Descending')),
//                 ],
//                 onChanged: (value) {
//                   if (value != null) tempIsAscending = value;
//                 },
//                 decoration: InputDecoration(labelText: 'Order'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _sortField = tempSortField;
//                   _isAscending = tempIsAscending;
//                   _applySorting();
//                 });
//                 Navigator.pop(context);
//               },
//               child: Text('Apply'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Users',
//             style:
//             GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
//         backgroundColor: Colors.redAccent,
//         elevation: 5,
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.redAccent.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: searchController,
//                       onChanged: _onSearchChanged,
//                       decoration: InputDecoration(
//                         labelText: 'Search User',
//                         labelStyle:
//                         GoogleFonts.poppins(color: Colors.redAccent),
//                         prefixIcon: Icon(Icons.search, color: Colors.redAccent),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide: BorderSide(color: Colors.redAccent),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.sort, color: Colors.redAccent),
//                     onPressed: _showSortingDialog,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: filteredFavoriteUsers.isEmpty
//                   ? Center(
//                 child: Text(
//                   "No data found",
//                   style: GoogleFonts.poppins(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black54),
//                 ),
//               )
//                   : ListView.builder(
//                 itemCount: filteredFavoriteUsers.length,
//                 itemBuilder: (context, index) {
//                   User user = filteredFavoriteUsers[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(
//                         vertical: 12, horizontal: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius:
//                       BorderRadius.circular(20), // More rounded look
//                     ),
//                     elevation: 6,
//                     shadowColor: Colors.black.withOpacity(0.15),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.white,
//                             Colors.grey.shade200
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 10,
//                             spreadRadius: 2,
//                             offset: Offset(
//                                 0, 4), // Lighter shadow at the bottom
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 12),
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.redAccent
//                                   .shade100,
//                               radius: 24,
//                               child: Text(
//                                 user.name != null && user.name!.isNotEmpty
//                                     ? user.name![0]
//                                     .toUpperCase()
//                                     : '?',
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             title: Text(
//                               user.name!,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                             subtitle: Padding(
//                               padding: const EdgeInsets.only(top: 4.0),
//                               child: Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   _buildIconText(Icons.wc, user.gender,
//                                       fontSize: 14),
//                                   _buildIconText(
//                                       Icons.cake, user.age.toString(),
//                                       fontSize: 14),
//                                   _buildIconText(
//                                       Icons.location_city, user.city,
//                                       fontSize: 14),
//                                 ],
//                               ),
//                             ),
//                             onTap: () async {
//                               User? updatedUser = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => UserDetailsPage(
//                                     user: user,
//                                     onUpdate: (_) => _loadFavoriteUsers(),
//                                     onDelete: (_) => _loadFavoriteUsers(),
//                                   ),
//                                 ),
//                               );
//                               _loadFavoriteUsers();
//                             },
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 12.0, horizontal: 16),
//                             child: Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment.spaceAround,
//                               children: [
//                                 _buildActionButton(
//                                   icon: user.isFavorite
//                                       ? Icons.favorite
//                                       : Icons.favorite_border,
//                                   color: user.isFavorite
//                                       ? Colors.red
//                                       : Colors.grey,
//                                   onTap: () => _toggleFavorite(user),
//                                 ),
//                                 _buildActionButton(
//                                   icon: Icons.edit,
//                                   color: Colors.blue.shade600,
//                                   onTap: () => _editUser(user),
//                                 ),
//                                 _buildActionButton(
//                                   icon: Icons.delete,
//                                   color: Colors.red.shade600,
//                                   onTap: () => _confirmDelete(index),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIconText(IconData icon, String? value, {double fontSize = 14}) {
//     return Row(
//       children: [
//         Icon(icon, size: 18, color: Colors.redAccent),
//         SizedBox(width: 8),
//         Text(
//           value ?? 'N/A',
//           overflow: TextOverflow.ellipsis,
//           maxLines: 1,
//           style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black54),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildActionButton(
//       {required IconData icon,
//         required Color color,
//         required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: color.withOpacity(0.15),
//         ),
//         child: Icon(icon, color: color, size: 26),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api/apiservice.dart';
import 'edit_user.dart';
import 'user_class.dart';
import 'user_details.dart';

class FavoriteUsersPage extends StatefulWidget {
  @override
  _FavoriteUsersPageState createState() => _FavoriteUsersPageState();
}

class _FavoriteUsersPageState extends State<FavoriteUsersPage> {
  TextEditingController searchController = TextEditingController();
  List<User> allFavoriteUsers = [];
  List<User> filteredFavoriteUsers = [];
  final ApiService _apiService = ApiService();
  Timer? _debounce;
  String _sortField = 'name';
  bool _isAscending = true;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadFavoriteUsers();
  }

  void _loadFavoriteUsers() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      List<User> users = await _apiService.getUsers();
      setState(() {
        allFavoriteUsers = users.where((user) => user.isFavorite == 1).toList();
        filteredFavoriteUsers = List.from(allFavoriteUsers);
        _applySorting();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 300), () {
      _filterFavoriteUsers(query);
    });
  }

  void _filterFavoriteUsers(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        filteredFavoriteUsers = List.from(allFavoriteUsers);
      } else {
        query = query.toLowerCase().trim();
        filteredFavoriteUsers = allFavoriteUsers.where((user) {
          return (user.name?.toLowerCase().contains(query) ?? false) ||
              (user.email?.toLowerCase().contains(query) ?? false) ||
              (user.phone?.toLowerCase().contains(query) ?? false) ||
              (user.city?.toLowerCase().contains(query) ?? false) ||
              (user.age.toString().contains(query));
        }).toList();
      }
      _applySorting();
    });
  }

  void _toggleFavorite(User user) async {
    user.isFavorite = (user.isFavorite == 1) ? 0 : 1;
    try {
      await _apiService.updateUser(user.id.toString(), user);
      _loadFavoriteUsers();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update favorite: $e')));
    }
  }

  void _editUser(User user) async {
    User? updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUserPage(user: user)),
    );
    if (updatedUser != null) {
      try {
        await _apiService.updateUser(updatedUser.id.toString(), updatedUser);
        _loadFavoriteUsers();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update user: $e')));
      }
    }
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
          content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
          actions: <Widget>[
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14))),
            TextButton(
              onPressed: () async {
                try {
                  await _apiService.deleteUser(filteredFavoriteUsers[index].id.toString());
                  _loadFavoriteUsers();
                  Navigator.of(context).pop();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete user: $e')));
                }
              },
              child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
            ),
          ],
        );
      },
    );
  }

  void _applySorting() {
    setState(() {
      filteredFavoriteUsers.sort((a, b) {
        dynamic aValue = _getFieldValue(a, _sortField);
        dynamic bValue = _getFieldValue(b, _sortField);
        if (aValue == null && bValue == null) return 0;
        if (aValue == null) return _isAscending ? 1 : -1;
        if (bValue == null) return _isAscending ? -1 : 1;

        if (aValue is String && bValue is String) {
          return _isAscending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
        } else if (aValue is num && bValue is num) {
          return _isAscending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
        }
        return 0;
      });
    });
  }

  dynamic _getFieldValue(User user, String field) {
    switch (field) {
      case 'name':
        return user.name;
      case 'email':
        return user.email;
      case 'phone':
        return user.phone;
      case 'city':
        return user.city;
      case 'age':
        return user.age;
      default:
        return null;
    }
  }

  void _showSortingDialog() {
    String tempSortField = _sortField;
    bool tempIsAscending = _isAscending;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sort Users', style: GoogleFonts.poppins(fontSize: 16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: tempSortField,
                items: ['name', 'email', 'phone', 'city', 'age'].map((field) {
                  return DropdownMenuItem(value: field, child: Text(field.toUpperCase()));
                }).toList(),
                onChanged: (value) {
                  if (value != null) tempSortField = value;
                },
                decoration: InputDecoration(labelText: 'Sort By'),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<bool>(
                value: tempIsAscending,
                items: [
                  DropdownMenuItem(value: true, child: Text('Ascending')),
                  DropdownMenuItem(value: false, child: Text('Descending')),
                ],
                onChanged: (value) {
                  if (value != null) tempIsAscending = value;
                },
                decoration: InputDecoration(labelText: 'Order'),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            TextButton(
              onPressed: () {
                setState(() {
                  _sortField = tempSortField;
                  _isAscending = tempIsAscending;
                  _applySorting();
                });
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Users', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.redAccent,
        elevation: 5,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade50, Colors.redAccent.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: _onSearchChanged,
                      decoration: InputDecoration(
                        labelText: 'Search User',
                        labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
                        prefixIcon: Icon(Icons.search, color: Colors.redAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.sort, color: Colors.redAccent),
                    onPressed: _showSortingDialog,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _error != null
                  ? Center(child: Text('Error: $_error', style: GoogleFonts.poppins(fontSize: 18, color: Colors.red)))
                  : filteredFavoriteUsers.isEmpty
                  ? Center(
                child: Text(
                  "No favorite users found",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
                ),
              )
                  : ListView.builder(
                itemCount: filteredFavoriteUsers.length,
                itemBuilder: (context, index) {
                  User user = filteredFavoriteUsers[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 6,
                    shadowColor: Colors.black.withOpacity(0.15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey.shade200],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            leading: CircleAvatar(
                              backgroundColor: Colors.redAccent.shade100,
                              radius: 24,
                              child: Text(
                                user.name != null && user.name!.isNotEmpty ? user.name![0].toUpperCase() : '?',
                                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            title: Text(
                              user.name ?? 'Unknown',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildIconText(Icons.wc, user.gender ?? 'N/A', fontSize: 14),
                                  _buildIconText(Icons.cake, user.age.toString(), fontSize: 14),
                                  _buildIconText(Icons.location_city, user.city ?? 'N/A', fontSize: 14),
                                ],
                              ),
                            ),
                            onTap: () async {
                              User? updatedUser = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsPage(
                                    user: user,
                                    onUpdate: (_) => _loadFavoriteUsers(),
                                    onDelete: (_) => _loadFavoriteUsers(),
                                  ),
                                ),
                              );
                              if (updatedUser != null) {
                                _loadFavoriteUsers();
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildActionButton(
                                  icon: user.isFavorite == 1 ? Icons.favorite : Icons.favorite_border,
                                  color: user.isFavorite == 1 ? Colors.red : Colors.grey,
                                  onTap: () => _toggleFavorite(user),
                                ),
                                _buildActionButton(
                                  icon: Icons.edit,
                                  color: Colors.blue.shade600,
                                  onTap: () => _editUser(user),
                                ),
                                _buildActionButton(
                                  icon: Icons.delete,
                                  color: Colors.red.shade600,
                                  onTap: () => _confirmDelete(index),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, String value, {double fontSize = 14}) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.redAccent),
        SizedBox(width: 8),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildActionButton({required IconData icon, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.15),
        ),
        child: Icon(icon, color: color, size: 26),
      ),
    );
  }
}