// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // //
// // // import 'add_user.dart';
// // // import 'database_helper.dart';
// // // import 'edit_user.dart';
// // // import 'user_class.dart';
// // // import 'user_data.dart';
// // // import 'user_details.dart';
// // //
// // // class UserListPage extends StatefulWidget {
// // //   @override
// // //   _UserListPageState createState() => _UserListPageState();
// // // }
// // //
// // // class _UserListPageState extends State<UserListPage> {
// // //   TextEditingController searchController = TextEditingController();
// // //   List<User> filteredUsers = [];
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUsers();
// // //   }
// // //
// // //   void _loadUsers() async {
// // //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// // //     setState(() {
// // //       filteredUsers = users;
// // //     });
// // //   }
// // //
// // //
// // //   void _filterUsers(String query) {
// // //     setState(() {
// // //       filteredUsers = userList.where((user) {
// // //         String name = user.name?.toLowerCase() ?? '';
// // //         String city = user.city?.toLowerCase() ?? '';
// // //         String email = user.email?.toLowerCase() ?? '';
// // //         String phone = user.phone?.toLowerCase() ?? '';
// // //         String age = user.age?.toString() ?? ''; // Ensure age is a string
// // //
// // //         query = query.toLowerCase(); // Convert query to lowercase
// // //
// // //         return name.contains(query) ||
// // //             city.contains(query) ||
// // //             email.contains(query) ||
// // //             phone.contains(query) ||
// // //             age.contains(query);
// // //       }).toList();
// // //     });
// // //   }
// // //
// // //   void _toggleFavorite(User user) async {
// // //     // Toggle favorite status
// // //     user.isFavorite = !user.isFavorite;
// // //
// // //     // Update the database with the new favorite status
// // //     await DatabaseHelper.instance.updateUser(user);
// // //
// // //     // Reload users to reflect changes
// // //     _loadUsers();
// // //   }
// // //
// // //
// // //   void _editUser(User user) async {
// // //     User? updatedUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => EditUserPage(user: user),
// // //       ),
// // //     );
// // //
// // //     if (updatedUser != null) {
// // //       await DatabaseHelper.instance.updateUser(updatedUser);
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //
// // //   void _confirmDelete(int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 await DatabaseHelper.instance.deleteUser(filteredUsers[index].id!);
// // //                 _loadUsers();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //
// // //   void _addNewUser() async {
// // //     User? newUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => AddUserPage(),
// // //       ),
// // //     );
// // //
// // //     if (newUser != null) {
// // //       _loadUsers(); // Just refresh the list, no need to insert again
// // //     }
// // //   }
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('User List', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
// // //         backgroundColor: Colors.redAccent,
// // //         elevation: 5,
// // //         centerTitle: true,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(10),
// // //               child: TextField(
// // //                 controller: searchController,
// // //                 onChanged: _filterUsers,
// // //                 decoration: InputDecoration(
// // //                   labelText: 'Search User',
// // //                   labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// // //                   prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(12),
// // //                     borderSide: BorderSide(color: Colors.redAccent),
// // //                   ),
// // //                   filled: true,
// // //                   fillColor: Colors.white,
// // //                 ),
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: filteredUsers.isEmpty
// // //                   ? Center(
// // //                 child: Text(
// // //                   "No data found",
// // //                   style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
// // //                 ),
// // //               )
// // //                   : ListView.builder(
// // //                 itemCount: filteredUsers.length,
// // //                 itemBuilder: (context, index) {
// // //                   User user = filteredUsers[index];
// // //                   return Card(
// // //                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// // //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //                     elevation: 5,
// // //                     child: ListTile(
// // //                       contentPadding: EdgeInsets.all(15),
// // //                       title: Text(
// // //                         user.name!,
// // //                         overflow: TextOverflow.ellipsis,
// // //                         style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
// // //                       ),
// // //                       subtitle: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text("State: ${user.city}",
// // //                               style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                           Text("Phone: ${user.phone}",
// // //                               style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                           Text("Email: ${user.email}",
// // //                               overflow: TextOverflow.ellipsis,
// // //                               style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                           Text("DOB: ${user.dob}",
// // //                               style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                           Text("Age: ${user.age}",
// // //                               style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                         ],
// // //                       ),
// // //                       trailing: Row(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           IconButton(
// // //                             icon: Icon(
// // //                               user.isFavorite ? Icons.favorite : Icons.favorite_border,
// // //                               color: user.isFavorite ? Colors.red : Colors.grey,
// // //                             ),
// // //                             onPressed: () => _toggleFavorite(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.edit, color: Colors.blue),
// // //                             onPressed: () => _editUser(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.delete, color: Colors.red),
// // //                             onPressed: () => _confirmDelete(index),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       onTap: () async {
// // //                         User? updatedUser = await Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (context) => UserDetailsPage(
// // //                               user: user,
// // //                               onUpdate: (updatedUser) {
// // //                                 setState(() {
// // //                                   _loadUsers(); // Refresh entire list after update
// // //                                 });
// // //                               },
// // //                               onDelete: (deletedUser) {
// // //                                 setState(() {
// // //                                   _loadUsers(); // Refresh entire list after deletion
// // //                                 });
// // //                               },
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addNewUser,
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Colors.redAccent,
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // //
// // // import 'add_user.dart';
// // // import 'database_helper.dart';
// // // import 'edit_user.dart';
// // // import 'user_class.dart';
// // // import 'user_data.dart';
// // // import 'user_details.dart';
// // //
// // // class UserListPage extends StatefulWidget {
// // //   @override
// // //   _UserListPageState createState() => _UserListPageState();
// // // }
// // //
// // // class _UserListPageState extends State<UserListPage> {
// // //   TextEditingController searchController = TextEditingController();
// // //   List<User> filteredUsers = [];
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUsers();
// // //   }
// // //
// // //   void _loadUsers() async {
// // //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// // //     setState(() {
// // //       filteredUsers = users;
// // //     });
// // //   }
// // //
// // //   void _filterUsers(String query) async {
// // //     query = query.toLowerCase().trim();
// // //
// // //     List<User> users;
// // //     if (query.isEmpty) {
// // //       users = await DatabaseHelper.instance.fetchUsers();
// // //     } else {
// // //       final db = await DatabaseHelper.instance.database;
// // //       final result = await db.query(
// // //         'users',
// // //         where: '''
// // //         LOWER(name) LIKE ? OR
// // //         LOWER(city) LIKE ? OR
// // //         LOWER(email) LIKE ? OR
// // //         LOWER(phone) LIKE ? OR
// // //         CAST(age AS TEXT) LIKE ?
// // //       ''',
// // //         whereArgs: List.filled(5, '%$query%'),
// // //       );
// // //
// // //       users = result.map((json) => User.fromMap(json)).toList();
// // //     }
// // //
// // //     setState(() {
// // //       filteredUsers = users; // Updates the UI dynamically
// // //     });
// // //   }
// // //
// // //   void _toggleFavorite(User user) async {
// // //     user.isFavorite = !user.isFavorite;
// // //     await DatabaseHelper.instance.updateUser(user);
// // //     _loadUsers();
// // //   }
// // //
// // //   void _editUser(User user) async {
// // //     User? updatedUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => EditUserPage(user: user),
// // //       ),
// // //     );
// // //
// // //     if (updatedUser != null) {
// // //       await DatabaseHelper.instance.updateUser(updatedUser);
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _confirmDelete(int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 await DatabaseHelper.instance.deleteUser(filteredUsers[index].id!);
// // //                 _loadUsers();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   void _addNewUser() async {
// // //     User? newUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => AddUserPage(),
// // //       ),
// // //     );
// // //
// // //     if (newUser != null) {
// // //       _loadUsers(); // Refresh the list after adding
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('User List', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
// // //         backgroundColor: Colors.redAccent,
// // //         elevation: 5,
// // //         centerTitle: true,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(16),
// // //               child: TextField(
// // //                 controller: searchController,
// // //                 onChanged: _filterUsers,
// // //                 decoration: InputDecoration(
// // //                   labelText: 'Search User',
// // //                   labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// // //                   prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(25),
// // //                     borderSide: BorderSide(color: Colors.redAccent),
// // //                   ),
// // //                   filled: true,
// // //                   fillColor: Colors.white,
// // //                 ),
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: filteredUsers.isEmpty
// // //                   ? Center(
// // //                 child: Text(
// // //                   "No data found",
// // //                   style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
// // //                 ),
// // //               )
// // //                   : ListView.builder(
// // //                 itemCount: filteredUsers.length,
// // //                 itemBuilder: (context, index) {
// // //                   User user = filteredUsers[index];
// // //                   return Card(
// // //                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// // //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //                     elevation: 6,
// // //                     child: ListTile(
// // //                       contentPadding: EdgeInsets.all(16),
// // //                       title: Text(
// // //                         user.name!,
// // //                         overflow: TextOverflow.ellipsis, // Prevent overflow
// // //                         style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
// // //                       ),
// // //                       subtitle: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text(
// // //                             "State: ${user.state}",
// // //                             overflow: TextOverflow.ellipsis, // Prevent overflow
// // //                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
// // //                           ),
// // //                           Text(
// // //                             "Phone: ${user.phone}",
// // //                             overflow: TextOverflow.ellipsis, // Prevent overflow
// // //                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
// // //                           ),
// // //                           Text(
// // //                             "Email: ${user.email}",
// // //                             overflow: TextOverflow.ellipsis, // Prevent overflow
// // //                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
// // //                           ),
// // //                           Text(
// // //                             "DOB: ${user.dob}",
// // //                             overflow: TextOverflow.ellipsis, // Prevent overflow
// // //                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
// // //                           ),
// // //                           Text(
// // //                             "Age: ${user.age}",
// // //                             overflow: TextOverflow.ellipsis, // Prevent overflow
// // //                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       trailing: Row(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           IconButton(
// // //                             icon: Icon(
// // //                               user.isFavorite ? Icons.favorite : Icons.favorite_border,
// // //                               color: user.isFavorite ? Colors.red : Colors.grey,
// // //                             ),
// // //                             onPressed: () => _toggleFavorite(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.edit, color: Colors.blue),
// // //                             onPressed: () => _editUser(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.delete, color: Colors.red),
// // //                             onPressed: () => _confirmDelete(index),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       onTap: () async {
// // //                         User? updatedUser = await Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (context) => UserDetailsPage(
// // //                               user: user,
// // //                               onUpdate: (updatedUser) {
// // //                                 setState(() {
// // //                                   _loadUsers(); // Refresh list after update
// // //                                 });
// // //                               },
// // //                               onDelete: (deletedUser) {
// // //                                 setState(() {
// // //                                   _loadUsers(); // Refresh list after deletion
// // //                                 });
// // //                               },
// // //                             ),
// // //                           ),
// // //                         );
// // //                         _loadUsers();
// // //                       },
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addNewUser,
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Colors.redAccent,
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // //search btn function
// //
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // //
// // // import 'add_user.dart';
// // // import 'database_helper.dart';
// // // import 'edit_user.dart';
// // // import 'user_class.dart';
// // // import 'user_details.dart';
// // //
// // // class UserListPage extends StatefulWidget {
// // //   @override
// // //   _UserListPageState createState() => _UserListPageState();
// // // }
// // //
// // // class _UserListPageState extends State<UserListPage> {
// // //   TextEditingController searchController = TextEditingController();
// // //   List<User> allUsers = []; // Store all users
// // //   List<User> filteredUsers = []; // Store filtered users
// // //   Timer? _debounce;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUsers();
// // //   }
// // //
// // //   /// Fetch users from the database and update the UI
// // //   void _loadUsers() async {
// // //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// // //     setState(() {
// // //       allUsers = users;
// // //       filteredUsers = users; // Initially show all users
// // //     });
// // //   }
// // //
// // //   /// Debounced search function for better performance
// // //   void _onSearchChanged(String query) {
// // //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// // //     _debounce = Timer(Duration(milliseconds: 300), () {
// // //       _filterUsers(query);
// // //     });
// // //   }
// // //
// // //   /// Filters users based on search query
// // //   void _filterUsers(String query) {
// // //     setState(() {
// // //       if (query.trim().isEmpty) {
// // //         filteredUsers = allUsers; // Show all users if query is empty
// // //       } else {
// // //         query = query.toLowerCase().trim();
// // //         filteredUsers = allUsers.where((user) {
// // //           return (user.name?.toLowerCase().contains(query) ?? false) ||
// // //               (user.email?.toLowerCase().contains(query) ?? false) ||
// // //               (user.phone?.toLowerCase().contains(query) ?? false) ||
// // //               (user.city?.toLowerCase().contains(query) ?? false) ||
// // //               (user.age.toString().contains(query));
// // //         }).toList();
// // //       }
// // //     });
// // //   }
// // //
// // //   void _toggleFavorite(User user) async {
// // //     user.isFavorite = !user.isFavorite;
// // //     await DatabaseHelper.instance.updateUser(user);
// // //     _loadUsers();
// // //   }
// // //
// // //   void _editUser(User user) async {
// // //     User? updatedUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => EditUserPage(user: user),
// // //       ),
// // //     );
// // //
// // //     if (updatedUser != null) {
// // //       await DatabaseHelper.instance.updateUser(updatedUser);
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _confirmDelete(int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () => Navigator.of(context).pop(),
// // //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 await DatabaseHelper.instance.deleteUser(filteredUsers[index].id!);
// // //                 _loadUsers();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   void _addNewUser() async {
// // //     User? newUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => AddUserPage(),
// // //       ),
// // //     );
// // //
// // //     if (newUser != null) {
// // //       _loadUsers(); // Refresh the list after adding
// // //     }
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _debounce?.cancel();
// // //     searchController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('User List', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
// // //         backgroundColor: Colors.redAccent,
// // //         elevation: 5,
// // //         centerTitle: true,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(16),
// // //               child: TextField(
// // //                 controller: searchController,
// // //                 onChanged: _onSearchChanged, // Debounced search
// // //                 decoration: InputDecoration(
// // //                   labelText: 'Search User',
// // //                   labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// // //                   prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(25),
// // //                     borderSide: BorderSide(color: Colors.redAccent),
// // //                   ),
// // //                   filled: true,
// // //                   fillColor: Colors.white,
// // //                 ),
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: filteredUsers.isEmpty
// // //                   ? Center(
// // //                 child: Text(
// // //                   "No data found",
// // //                   style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
// // //                 ),
// // //               )
// // //                   : ListView.builder(
// // //                 itemCount: filteredUsers.length,
// // //                 itemBuilder: (context, index) {
// // //                   User user = filteredUsers[index];
// // //                   return Card(
// // //                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// // //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //                     elevation: 6,
// // //                     child: ListTile(
// // //                       contentPadding: EdgeInsets.all(16),
// // //                       title: Text(
// // //                         user.name!,
// // //                         overflow: TextOverflow.ellipsis,
// // //                         style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
// // //                       ),
// // //                       subtitle: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text("State: ${user.state}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                           Text("Phone: ${user.phone}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                           Text("Email: ${user.email}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                           Text("DOB: ${user.dob}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                           Text("Age: ${user.age}", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
// // //                         ],
// // //                       ),
// // //                       trailing: Row(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           IconButton(
// // //                             icon: Icon(
// // //                               user.isFavorite ? Icons.favorite : Icons.favorite_border,
// // //                               color: user.isFavorite ? Colors.red : Colors.grey,
// // //                             ),
// // //                             onPressed: () => _toggleFavorite(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.edit, color: Colors.blue),
// // //                             onPressed: () => _editUser(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.delete, color: Colors.red),
// // //                             onPressed: () => _confirmDelete(index),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       onTap: () async {
// // //                         User? updatedUser = await Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (context) => UserDetailsPage(
// // //                               user: user,
// // //                               onUpdate: (_) => _loadUsers(),
// // //                               onDelete: (_) => _loadUsers(),
// // //                             ),
// // //                           ),
// // //                         );
// // //                         _loadUsers();
// // //                       },
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addNewUser,
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Colors.redAccent,
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // //
// // // import 'add_user.dart';
// // // import 'database_helper.dart';
// // // import 'edit_user.dart';
// // // import 'user_class.dart';
// // // import 'user_details.dart';
// // //
// // // class UserListPage extends StatefulWidget {
// // //   @override
// // //   _UserListPageState createState() => _UserListPageState();
// // // }
// // //
// // // class _UserListPageState extends State<UserListPage> {
// // //   TextEditingController searchController = TextEditingController();
// // //   List<User> allUsers = []; // Store all users
// // //   List<User> filteredUsers = []; // Store filtered users
// // //   Timer? _debounce;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUsers();
// // //   }
// // //
// // //   void _loadUsers() async {
// // //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// // //     setState(() {
// // //       allUsers = users;
// // //       filteredUsers = users;
// // //     });
// // //   }
// // //
// // //   void _onSearchChanged(String query) {
// // //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// // //     _debounce = Timer(Duration(milliseconds: 300), () {
// // //       _filterUsers(query);
// // //     });
// // //   }
// // //
// // //   void _filterUsers(String query) {
// // //     setState(() {
// // //       if (query.trim().isEmpty) {
// // //         filteredUsers = allUsers;
// // //       } else {
// // //         query = query.toLowerCase().trim();
// // //         filteredUsers = allUsers.where((user) {
// // //           return (user.name?.toLowerCase().contains(query) ?? false) ||
// // //               (user.email?.toLowerCase().contains(query) ?? false) ||
// // //               (user.phone?.toLowerCase().contains(query) ?? false) ||
// // //               (user.city?.toLowerCase().contains(query) ?? false) ||
// // //               (user.age.toString().contains(query));
// // //         }).toList();
// // //       }
// // //     });
// // //   }
// // //
// // //   void _toggleFavorite(User user) async {
// // //     user.isFavorite = !user.isFavorite;
// // //     await DatabaseHelper.instance.updateUser(user);
// // //     _loadUsers();
// // //   }
// // //
// // //   void _editUser(User user) async {
// // //     User? updatedUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => EditUserPage(user: user),
// // //       ),
// // //     );
// // //
// // //     if (updatedUser != null) {
// // //       await DatabaseHelper.instance.updateUser(updatedUser);
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _confirmDelete(int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Confirm Deletion', style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins(fontSize: 14)),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () => Navigator.of(context).pop(),
// // //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 await DatabaseHelper.instance.deleteUser(filteredUsers[index].id!);
// // //                 _loadUsers();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   void _addNewUser() async {
// // //     User? newUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => AddUserPage(),
// // //       ),
// // //     );
// // //
// // //     if (newUser != null) {
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _debounce?.cancel();
// // //     searchController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('User List', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
// // //         backgroundColor: Colors.redAccent,
// // //         elevation: 5,
// // //         centerTitle: true,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(16),
// // //               child: TextField(
// // //                 controller: searchController,
// // //                 onChanged: _onSearchChanged,
// // //                 decoration: InputDecoration(
// // //                   labelText: 'Search User',
// // //                   labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// // //                   prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(25),
// // //                     borderSide: BorderSide(color: Colors.redAccent),
// // //                   ),
// // //                   filled: true,
// // //                   fillColor: Colors.white,
// // //                 ),
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: filteredUsers.isEmpty
// // //                   ? Center(
// // //                 child: Text(
// // //                   "No data found",
// // //                   style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
// // //                 ),
// // //               )
// // //                   : ListView.builder(
// // //                 itemCount: filteredUsers.length,
// // //                 itemBuilder: (context, index) {
// // //                   User user = filteredUsers[index];
// // //                   return Card(
// // //                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// // //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //                     elevation: 6,
// // //                     child: ListTile(
// // //                       contentPadding: EdgeInsets.all(16),
// // //                       title: Text(
// // //                         user.name!,
// // //                         overflow: TextOverflow.ellipsis, // Prevents overflow
// // //                         maxLines: 1, // Restricts to one line
// // //                         style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
// // //                       ),
// // //                       subtitle: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           _buildOverflowText("State", user.state),
// // //                           _buildOverflowText("Phone", user.phone),
// // //                           _buildOverflowText("Email", user.email),
// // //                           _buildOverflowText("DOB", user.dob),
// // //                           _buildOverflowText("Age", user.age.toString()),
// // //                         ],
// // //                       ),
// // //                       trailing: Row(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           IconButton(
// // //                             icon: Icon(
// // //                               user.isFavorite ? Icons.favorite : Icons.favorite_border,
// // //                               color: user.isFavorite ? Colors.red : Colors.grey,
// // //                             ),
// // //                             onPressed: () => _toggleFavorite(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.edit, color: Colors.blue),
// // //                             onPressed: () => _editUser(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.delete, color: Colors.red),
// // //                             onPressed: () => _confirmDelete(index),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       onTap: () async {
// // //                         User? updatedUser = await Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (context) => UserDetailsPage(
// // //                               user: user,
// // //                               onUpdate: (_) => _loadUsers(),
// // //                               onDelete: (_) => _loadUsers(),
// // //                             ),
// // //                           ),
// // //                         );
// // //                         _loadUsers();
// // //                       },
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addNewUser,
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Colors.redAccent,
// // //       ),
// // //     );
// // //   }
// // //
// // //   /// Helper function to prevent overflow in user details
// // //   Widget _buildOverflowText(String label, String? value) {
// // //     return Text(
// // //       "$label: ${value ?? 'N/A'}",
// // //       overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
// // //       maxLines: 1, // Restricts to a single line
// // //       style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
// // //     );
// // //   }
// // // }
// //
// // //15/02/2025
// //
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // //
// // // import 'add_user.dart';
// // // import 'database_helper.dart';
// // // import 'edit_user.dart';
// // // import 'user_class.dart';
// // // import 'user_details.dart';
// // //
// // // class UserListPage extends StatefulWidget {
// // //   @override
// // //   _UserListPageState createState() => _UserListPageState();
// // // }
// // //
// // // class _UserListPageState extends State<UserListPage> {
// // //   TextEditingController searchController = TextEditingController();
// // //   List<User> allUsers = []; // Store all users
// // //   List<User> filteredUsers = []; // Store filtered users
// // //   Timer? _debounce;
// // //   String _sortField = 'name';
// // //   bool _isAscending = true;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUsers();
// // //   }
// // //
// // //   void _loadUsers() async {
// // //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// // //     setState(() {
// // //       allUsers = users;
// // //       filteredUsers = users;
// // //       _applySorting();
// // //     });
// // //   }
// // //
// // //   void _onSearchChanged(String query) {
// // //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// // //     _debounce = Timer(Duration(milliseconds: 300), () {
// // //       _filterUsers(query);
// // //     });
// // //   }
// // //
// // //   void _filterUsers(String query) {
// // //     setState(() {
// // //       if (query.trim().isEmpty) {
// // //         filteredUsers = allUsers;
// // //       } else {
// // //         query = query.toLowerCase().trim();
// // //         filteredUsers = allUsers.where((user) {
// // //           return (user.name?.toLowerCase().contains(query) ?? false) ||
// // //               (user.email?.toLowerCase().contains(query) ?? false) ||
// // //               (user.phone?.toLowerCase().contains(query) ?? false) ||
// // //               (user.city?.toLowerCase().contains(query) ?? false) ||
// // //               (user.age.toString().contains(query));
// // //         }).toList();
// // //       }
// // //     });
// // //   }
// // //
// // //   void _toggleFavorite(User user) async {
// // //     user.isFavorite = !user.isFavorite;
// // //     await DatabaseHelper.instance.updateUser(user);
// // //     _loadUsers();
// // //   }
// // //
// // //   void _editUser(User user) async {
// // //     User? updatedUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => EditUserPage(user: user),
// // //       ),
// // //     );
// // //
// // //     if (updatedUser != null) {
// // //       await DatabaseHelper.instance.updateUser(updatedUser);
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _confirmDelete(int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Confirm Deletion',
// // //               style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Text('Are you sure you want to delete this user?',
// // //               style: GoogleFonts.poppins(fontSize: 14)),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () => Navigator.of(context).pop(),
// // //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 await DatabaseHelper.instance
// // //                     .deleteUser(filteredUsers[index].id!);
// // //                 _loadUsers();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   void _addNewUser() async {
// // //     User? newUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => AddUserPage(),
// // //       ),
// // //     );
// // //
// // //     if (newUser != null) {
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _applySorting() {
// // //     setState(() {
// // //       filteredUsers = List.from(allUsers);
// // //       filteredUsers.sort((a, b) {
// // //         dynamic aValue = _getFieldValue(a, _sortField);
// // //         dynamic bValue = _getFieldValue(b, _sortField);
// // //         if (aValue is String && bValue is String) {
// // //           return _isAscending
// // //               ? aValue.compareTo(bValue)
// // //               : bValue.compareTo(aValue);
// // //         } else if (aValue is num && bValue is num) {
// // //           return _isAscending
// // //               ? aValue.compareTo(bValue)
// // //               : bValue.compareTo(aValue);
// // //         }
// // //         return 0;
// // //       });
// // //     });
// // //   }
// // //
// // //   dynamic _getFieldValue(User user, String field) {
// // //     switch (field) {
// // //       case 'name':
// // //         return user.name ?? '';
// // //       case 'email':
// // //         return user.email ?? '';
// // //       case 'phone':
// // //         return user.phone ?? '';
// // //       case 'city':
// // //         return user.city ?? '';
// // //       case 'age':
// // //         return user.age;
// // //       default:
// // //         return '';
// // //     }
// // //   }
// // //
// // //   void _showSortingDialog() {
// // //     String tempSortField = _sortField;
// // //     bool tempIsAscending = _isAscending;
// // //
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) {
// // //         return AlertDialog(
// // //           title: Text('Sort Users', style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               DropdownButtonFormField<String>(
// // //                 value: tempSortField,
// // //                 items: ['name', 'email', 'phone', 'city', 'age'].map((field) {
// // //                   return DropdownMenuItem(
// // //                       value: field, child: Text(field.toUpperCase()));
// // //                 }).toList(),
// // //                 onChanged: (value) {
// // //                   if (value != null) tempSortField = value;
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Sort By'),
// // //               ),
// // //               SizedBox(height: 10),
// // //               DropdownButtonFormField<bool>(
// // //                 value: tempIsAscending,
// // //                 items: [
// // //                   DropdownMenuItem(value: true, child: Text('Ascending')),
// // //                   DropdownMenuItem(value: false, child: Text('Descending')),
// // //                 ],
// // //                 onChanged: (value) {
// // //                   if (value != null) tempIsAscending = value;
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Order'),
// // //               ),
// // //             ],
// // //           ),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () => Navigator.pop(context),
// // //               child: Text('Cancel'),
// // //             ),
// // //             TextButton(
// // //               onPressed: () {
// // //                 setState(() {
// // //                   _sortField = tempSortField;
// // //                   _isAscending = tempIsAscending;
// // //                   _applySorting();
// // //                 });
// // //                 Navigator.pop(context);
// // //               },
// // //               child: Text('Apply'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _debounce?.cancel();
// // //     searchController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('User List',
// // //             style:
// // //                 GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
// // //         backgroundColor: Colors.redAccent,
// // //         elevation: 5,
// // //         centerTitle: true,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(16),
// // //               child: Row(
// // //                 children: [
// // //                   Expanded(
// // //                     child: TextField(
// // //                       controller: searchController,
// // //                       onChanged: _onSearchChanged,
// // //                       decoration: InputDecoration(
// // //                         labelText: 'Search User',
// // //                         labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// // //                         prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// // //                         border: OutlineInputBorder(
// // //                           borderRadius: BorderRadius.circular(25),
// // //                           borderSide: BorderSide(color: Colors.redAccent),
// // //                         ),
// // //                         filled: true,
// // //                         fillColor: Colors.white,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   IconButton(
// // //                     icon: Icon(Icons.sort, color: Colors.redAccent),
// // //                     onPressed: _showSortingDialog,
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: filteredUsers.isEmpty
// // //                   ? Center(
// // //                       child: Text(
// // //                         "No data found",
// // //                         style: GoogleFonts.poppins(
// // //                             fontSize: 18,
// // //                             fontWeight: FontWeight.w500,
// // //                             color: Colors.black54),
// // //                       ),
// // //                     )
// // //                   : ListView.builder(
// // //                       itemCount: filteredUsers.length,
// // //                       itemBuilder: (context, index) {
// // //                         User user = filteredUsers[index];
// // //                         return Card(
// // //                           margin:
// // //                               EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// // //                           shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(20)),
// // //                           elevation: 6,
// // //                           child: ListTile(
// // //                             contentPadding: EdgeInsets.all(16),
// // //                             title: Text(
// // //                               user.name!,
// // //                               overflow:
// // //                                   TextOverflow.ellipsis, // Prevents overflow
// // //                               maxLines: 1, // Restricts to one line
// // //                               style: GoogleFonts.poppins(
// // //                                   fontSize: 18, fontWeight: FontWeight.w600),
// // //                             ),
// // //                             subtitle: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 _buildOverflowText("State", user.state),
// // //                                 _buildOverflowText("Phone", user.phone),
// // //                                 _buildOverflowText("Email", user.email),
// // //                                 _buildOverflowText("DOB", user.dob),
// // //                                 _buildOverflowText("Age", user.age.toString()),
// // //                               ],
// // //                             ),
// // //                             trailing: Row(
// // //                               mainAxisSize: MainAxisSize.min,
// // //                               children: [
// // //                                 IconButton(
// // //                                   icon: Icon(
// // //                                     user.isFavorite
// // //                                         ? Icons.favorite
// // //                                         : Icons.favorite_border,
// // //                                     color: user.isFavorite
// // //                                         ? Colors.red
// // //                                         : Colors.grey,
// // //                                   ),
// // //                                   onPressed: () => _toggleFavorite(user),
// // //                                 ),
// // //                                 IconButton(
// // //                                   icon: Icon(Icons.edit, color: Colors.blue),
// // //                                   onPressed: () => _editUser(user),
// // //                                 ),
// // //                                 IconButton(
// // //                                   icon: Icon(Icons.delete, color: Colors.red),
// // //                                   onPressed: () => _confirmDelete(index),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                             onTap: () async {
// // //                               User? updatedUser = await Navigator.push(
// // //                                 context,
// // //                                 MaterialPageRoute(
// // //                                   builder: (context) => UserDetailsPage(
// // //                                     user: user,
// // //                                     onUpdate: (_) => _loadUsers(),
// // //                                     onDelete: (_) => _loadUsers(),
// // //                                   ),
// // //                                 ),
// // //                               );
// // //                               _loadUsers();
// // //                             },
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addNewUser,
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Colors.redAccent,
// // //       ),
// // //     );
// // //   }
// // //
// // //   /// Helper function to prevent overflow in user details
// // //   Widget _buildOverflowText(String label, String? value) {
// // //     return Text(
// // //       "$label: ${value ?? 'N/A'}",
// // //       overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
// // //       maxLines: 1, // Restricts to a single line
// // //       style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
// // //     );
// // //   }
// // // }
// //
// //
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // //
// // // import 'add_user.dart';
// // // import 'database_helper.dart';
// // // import 'edit_user.dart';
// // // import 'user_class.dart';
// // // import 'user_details.dart';
// // //
// // // class UserListPage extends StatefulWidget {
// // //   @override
// // //   _UserListPageState createState() => _UserListPageState();
// // // }
// // //
// // // class _UserListPageState extends State<UserListPage> {
// // //   TextEditingController searchController = TextEditingController();
// // //   List<User> allUsers = []; // Store all users
// // //   List<User> filteredUsers = []; // Store filtered users
// // //   Timer? _debounce;
// // //   String _sortField = 'name';
// // //   bool _isAscending = true;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUsers();
// // //   }
// // //
// // //   void _loadUsers() async {
// // //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// // //     setState(() {
// // //       allUsers = users;
// // //       filteredUsers = users;
// // //       _applySorting();
// // //     });
// // //   }
// // //
// // //   void _onSearchChanged(String query) {
// // //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// // //     _debounce = Timer(Duration(milliseconds: 300), () {
// // //       _filterUsers(query);
// // //     });
// // //   }
// // //
// // //   void _filterUsers(String query) {
// // //     setState(() {
// // //       if (query.trim().isEmpty) {
// // //         filteredUsers = allUsers;
// // //       } else {
// // //         query = query.toLowerCase().trim();
// // //         filteredUsers = allUsers.where((user) {
// // //           return (user.name?.toLowerCase().contains(query) ?? false) ||
// // //               (user.email?.toLowerCase().contains(query) ?? false) ||
// // //               (user.phone?.toLowerCase().contains(query) ?? false) ||
// // //               (user.city?.toLowerCase().contains(query) ?? false) ||
// // //               (user.age.toString().contains(query));
// // //         }).toList();
// // //       }
// // //     });
// // //   }
// // //
// // //   void _toggleFavorite(User user) async {
// // //     user.isFavorite = !user.isFavorite;
// // //     await DatabaseHelper.instance.updateUser(user);
// // //     _loadUsers();
// // //   }
// // //
// // //   void _editUser(User user) async {
// // //     User? updatedUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => EditUserPage(user: user),
// // //       ),
// // //     );
// // //
// // //     if (updatedUser != null) {
// // //       await DatabaseHelper.instance.updateUser(updatedUser);
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _confirmDelete(int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Confirm Deletion',
// // //               style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Text('Are you sure you want to delete this user?',
// // //               style: GoogleFonts.poppins(fontSize: 14)),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () => Navigator.of(context).pop(),
// // //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 await DatabaseHelper.instance
// // //                     .deleteUser(filteredUsers[index].id!);
// // //                 _loadUsers();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   void _addNewUser() async {
// // //     User? newUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => AddUserPage(),
// // //       ),
// // //     );
// // //
// // //     if (newUser != null) {
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _applySorting() {
// // //     setState(() {
// // //       filteredUsers = List.from(allUsers);
// // //       filteredUsers.sort((a, b) {
// // //         dynamic aValue = _getFieldValue(a, _sortField);
// // //         dynamic bValue = _getFieldValue(b, _sortField);
// // //         if (aValue is String && bValue is String) {
// // //           return _isAscending
// // //               ? aValue.compareTo(bValue)
// // //               : bValue.compareTo(aValue);
// // //         } else if (aValue is num && bValue is num) {
// // //           return _isAscending
// // //               ? aValue.compareTo(bValue)
// // //               : bValue.compareTo(aValue);
// // //         }
// // //         return 0;
// // //       });
// // //     });
// // //   }
// // //
// // //   dynamic _getFieldValue(User user, String field) {
// // //     switch (field) {
// // //       case 'name':
// // //         return user.name ?? '';
// // //       case 'email':
// // //         return user.email ?? '';
// // //       case 'phone':
// // //         return user.phone ?? '';
// // //       case 'city':
// // //         return user.city ?? '';
// // //       case 'age':
// // //         return user.age;
// // //       default:
// // //         return '';
// // //     }
// // //   }
// // //
// // //   void _showSortingDialog() {
// // //     String tempSortField = _sortField;
// // //     bool tempIsAscending = _isAscending;
// // //
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) {
// // //         return AlertDialog(
// // //           title: Text('Sort Users', style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               DropdownButtonFormField<String>(
// // //                 value: tempSortField,
// // //                 items: ['name', 'email', 'phone', 'city', 'age'].map((field) {
// // //                   return DropdownMenuItem(
// // //                       value: field, child: Text(field.toUpperCase()));
// // //                 }).toList(),
// // //                 onChanged: (value) {
// // //                   if (value != null) tempSortField = value;
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Sort By'),
// // //               ),
// // //               SizedBox(height: 10),
// // //               DropdownButtonFormField<bool>(
// // //                 value: tempIsAscending,
// // //                 items: [
// // //                   DropdownMenuItem(value: true, child: Text('Ascending')),
// // //                   DropdownMenuItem(value: false, child: Text('Descending')),
// // //                 ],
// // //                 onChanged: (value) {
// // //                   if (value != null) tempIsAscending = value;
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Order'),
// // //               ),
// // //             ],
// // //           ),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () => Navigator.pop(context),
// // //               child: Text('Cancel'),
// // //             ),
// // //             TextButton(
// // //               onPressed: () {
// // //                 setState(() {
// // //                   _sortField = tempSortField;
// // //                   _isAscending = tempIsAscending;
// // //                   _applySorting();
// // //                 });
// // //                 Navigator.pop(context);
// // //               },
// // //               child: Text('Apply'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _debounce?.cancel();
// // //     searchController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('User List',
// // //             style:
// // //             GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
// // //         backgroundColor: Colors.redAccent,
// // //         elevation: 5,
// // //         centerTitle: true,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(16),
// // //               child: Row(
// // //                 children: [
// // //                   Expanded(
// // //                     child: TextField(
// // //                       controller: searchController,
// // //                       onChanged: _onSearchChanged,
// // //                       decoration: InputDecoration(
// // //                         labelText: 'Search User',
// // //                         labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// // //                         prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// // //                         border: OutlineInputBorder(
// // //                           borderRadius: BorderRadius.circular(25),
// // //                           borderSide: BorderSide(color: Colors.redAccent),
// // //                         ),
// // //                         filled: true,
// // //                         fillColor: Colors.white,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   IconButton(
// // //                     icon: Icon(Icons.sort, color: Colors.redAccent),
// // //                     onPressed: _showSortingDialog,
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: filteredUsers.isEmpty
// // //                   ? Center(
// // //                 child: Text(
// // //                   "No data found",
// // //                   style: GoogleFonts.poppins(
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.w500,
// // //                       color: Colors.black54),
// // //                 ),
// // //               )
// // //                   : ListView.builder(
// // //                 itemCount: filteredUsers.length,
// // //                 itemBuilder: (context, index) {
// // //                   User user = filteredUsers[index];
// // //                   return Card(
// // //                     margin:
// // //                     EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// // //                     shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(20)),
// // //                     elevation: 6,
// // //                     child: ListTile(
// // //                       contentPadding: EdgeInsets.all(16),
// // //                       title: Text(
// // //                         user.name!,
// // //                         overflow:
// // //                         TextOverflow.ellipsis, // Prevents overflow
// // //                         maxLines: 1, // Restricts to one line
// // //                         style: GoogleFonts.poppins(
// // //                             fontSize: 18, fontWeight: FontWeight.w600),
// // //                       ),
// // //                       subtitle: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           _buildOverflowText("State", user.state),
// // //                           _buildOverflowText("Phone", user.phone),
// // //                           _buildOverflowText("Email", user.email),
// // //                           _buildOverflowText("DOB", user.dob),
// // //                           _buildOverflowText("Age", user.age.toString()),
// // //                         ],
// // //                       ),
// // //                       trailing: Row(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           IconButton(
// // //                             icon: Icon(
// // //                               user.isFavorite
// // //                                   ? Icons.favorite
// // //                                   : Icons.favorite_border,
// // //                               color: user.isFavorite
// // //                                   ? Colors.red
// // //                                   : Colors.grey,
// // //                             ),
// // //                             onPressed: () => _toggleFavorite(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.edit, color: Colors.blue),
// // //                             onPressed: () => _editUser(user),
// // //                           ),
// // //                           IconButton(
// // //                             icon: Icon(Icons.delete, color: Colors.red),
// // //                             onPressed: () => _confirmDelete(index),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       onTap: () async {
// // //                         User? updatedUser = await Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (context) => UserDetailsPage(
// // //                               user: user,
// // //                               onUpdate: (_) => _loadUsers(),
// // //                               onDelete: (_) => _loadUsers(),
// // //                             ),
// // //                           ),
// // //                         );
// // //                         _loadUsers();
// // //                       },
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addNewUser,
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Colors.redAccent,
// // //       ),
// // //     );
// // //   }
// // //
// // //   /// Helper function to prevent overflow in user details
// // //   Widget _buildOverflowText(String label, String? value) {
// // //     return Text(
// // //       "$label: ${value ?? 'N/A'}",
// // //       overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
// // //       maxLines: 1, // Restricts to a single line
// // //       style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
// // //     );
// // //   }
// // // }
// //
// //
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // //
// // // import 'add_user.dart';
// // // import 'database_helper.dart';
// // // import 'edit_user.dart';
// // // import 'user_class.dart';
// // // import 'user_details.dart';
// // //
// // // class UserListPage extends StatefulWidget {
// // //   @override
// // //   _UserListPageState createState() => _UserListPageState();
// // // }
// // //
// // // class _UserListPageState extends State<UserListPage> {
// // //   TextEditingController searchController = TextEditingController();
// // //   List<User> allUsers = []; // Store all users
// // //   List<User> filteredUsers = []; // Store filtered users
// // //   Timer? _debounce;
// // //   String _sortField = 'name';
// // //   bool _isAscending = true;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUsers();
// // //   }
// // //
// // //   void _loadUsers() async {
// // //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// // //     setState(() {
// // //       allUsers = users;
// // //       filteredUsers = users;
// // //       _applySorting();
// // //     });
// // //   }
// // //
// // //   void _onSearchChanged(String query) {
// // //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// // //     _debounce = Timer(Duration(milliseconds: 300), () {
// // //       _filterUsers(query);
// // //     });
// // //   }
// // //
// // //   void _filterUsers(String query) {
// // //     setState(() {
// // //       if (query.trim().isEmpty) {
// // //         filteredUsers = allUsers;
// // //       } else {
// // //         query = query.toLowerCase().trim();
// // //         filteredUsers = allUsers.where((user) {
// // //           return (user.name?.toLowerCase().contains(query) ?? false) ||
// // //               (user.email?.toLowerCase().contains(query) ?? false) ||
// // //               (user.phone?.toLowerCase().contains(query) ?? false) ||
// // //               (user.city?.toLowerCase().contains(query) ?? false) ||
// // //               (user.age.toString().contains(query));
// // //         }).toList();
// // //       }
// // //     });
// // //   }
// // //
// // //   void _toggleFavorite(User user) async {
// // //     user.isFavorite = !user.isFavorite;
// // //     await DatabaseHelper.instance.updateUser(user);
// // //     _loadUsers();
// // //   }
// // //
// // //   void _editUser(User user) async {
// // //     User? updatedUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => EditUserPage(user: user),
// // //       ),
// // //     );
// // //
// // //     if (updatedUser != null) {
// // //       await DatabaseHelper.instance.updateUser(updatedUser);
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _confirmDelete(int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Confirm Deletion',
// // //               style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Text('Are you sure you want to delete this user?',
// // //               style: GoogleFonts.poppins(fontSize: 14)),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () => Navigator.of(context).pop(),
// // //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 await DatabaseHelper.instance
// // //                     .deleteUser(filteredUsers[index].id!);
// // //                 _loadUsers();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   void _addNewUser() async {
// // //     User? newUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => AddUserPage(),
// // //       ),
// // //     );
// // //
// // //     if (newUser != null) {
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _applySorting() {
// // //     setState(() {
// // //       filteredUsers = List.from(allUsers);
// // //       filteredUsers.sort((a, b) {
// // //         dynamic aValue = _getFieldValue(a, _sortField);
// // //         dynamic bValue = _getFieldValue(b, _sortField);
// // //         if (aValue is String && bValue is String) {
// // //           return _isAscending
// // //               ? aValue.compareTo(bValue)
// // //               : bValue.compareTo(aValue);
// // //         } else if (aValue is num && bValue is num) {
// // //           return _isAscending
// // //               ? aValue.compareTo(bValue)
// // //               : bValue.compareTo(aValue);
// // //         }
// // //         return 0;
// // //       });
// // //     });
// // //   }
// // //
// // //   dynamic _getFieldValue(User user, String field) {
// // //     switch (field) {
// // //       case 'name':
// // //         return user.name ?? '';
// // //       case 'email':
// // //         return user.email ?? '';
// // //       case 'phone':
// // //         return user.phone ?? '';
// // //       case 'city':
// // //         return user.city ?? '';
// // //       case 'age':
// // //         return user.age;
// // //       default:
// // //         return '';
// // //     }
// // //   }
// // //
// // //   void _showSortingDialog() {
// // //     String tempSortField = _sortField;
// // //     bool tempIsAscending = _isAscending;
// // //
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) {
// // //         return AlertDialog(
// // //           title: Text('Sort Users', style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               DropdownButtonFormField<String>(
// // //                 value: tempSortField,
// // //                 items: ['name', 'email', 'phone', 'city', 'age'].map((field) {
// // //                   return DropdownMenuItem(
// // //                       value: field, child: Text(field.toUpperCase()));
// // //                 }).toList(),
// // //                 onChanged: (value) {
// // //                   if (value != null) tempSortField = value;
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Sort By'),
// // //               ),
// // //               SizedBox(height: 10),
// // //               DropdownButtonFormField<bool>(
// // //                 value: tempIsAscending,
// // //                 items: [
// // //                   DropdownMenuItem(value: true, child: Text('Ascending')),
// // //                   DropdownMenuItem(value: false, child: Text('Descending')),
// // //                 ],
// // //                 onChanged: (value) {
// // //                   if (value != null) tempIsAscending = value;
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Order'),
// // //               ),
// // //             ],
// // //           ),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () => Navigator.pop(context),
// // //               child: Text('Cancel'),
// // //             ),
// // //             TextButton(
// // //               onPressed: () {
// // //                 setState(() {
// // //                   _sortField = tempSortField;
// // //                   _isAscending = tempIsAscending;
// // //                   _applySorting();
// // //                 });
// // //                 Navigator.pop(context);
// // //               },
// // //               child: Text('Apply'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _debounce?.cancel();
// // //     searchController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('User List',
// // //             style:
// // //             GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
// // //         backgroundColor: Colors.redAccent,
// // //         elevation: 5,
// // //         centerTitle: true,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(16),
// // //               child: Row(
// // //                 children: [
// // //                   Expanded(
// // //                     child: TextField(
// // //                       controller: searchController,
// // //                       onChanged: _onSearchChanged,
// // //                       decoration: InputDecoration(
// // //                         labelText: 'Search User',
// // //                         labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// // //                         prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// // //                         border: OutlineInputBorder(
// // //                           borderRadius: BorderRadius.circular(25),
// // //                           borderSide: BorderSide(color: Colors.redAccent),
// // //                         ),
// // //                         filled: true,
// // //                         fillColor: Colors.white,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   IconButton(
// // //                     icon: Icon(Icons.sort, color: Colors.redAccent),
// // //                     onPressed: _showSortingDialog,
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: filteredUsers.isEmpty
// // //                   ? Center(
// // //                 child: Text(
// // //                   "No data found",
// // //                   style: GoogleFonts.poppins(
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.w500,
// // //                       color: Colors.black54),
// // //                 ),
// // //               )
// // //                   : ListView.builder(
// // //                 itemCount: filteredUsers.length,
// // //                 itemBuilder: (context, index) {
// // //                   User user = filteredUsers[index];
// // //                   return Card(
// // //                     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Slightly larger margin
// // //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), // More rounded corners
// // //                     elevation: 10, // More subtle elevation for a floating effect
// // //                     shadowColor: Colors.black.withOpacity(0.1), // Lighter shadow for more modern look
// // //                     child: Container(
// // //                       decoration: BoxDecoration(
// // //                         gradient: LinearGradient(
// // //                           colors: [Colors.white, Colors.grey[50]!], // Soft gradient background
// // //                           begin: Alignment.topLeft,
// // //                           end: Alignment.bottomRight,
// // //                         ),
// // //                         borderRadius: BorderRadius.circular(25), // Round corners on container
// // //                       ),
// // //                       child: Column(
// // //                         children: [
// // //                           ListTile(
// // //                             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // More compact padding
// // //                             title: Text(
// // //                               user.name!,
// // //                               overflow: TextOverflow.ellipsis,
// // //                               maxLines: 1,
// // //                               style: GoogleFonts.poppins(
// // //                                 fontSize: 24, // Larger title for more prominence
// // //                                 fontWeight: FontWeight.w700, // Bolder font weight
// // //                                 color: Colors.black87, // Darker color for better readability
// // //                               ),
// // //                             ),
// // //                             subtitle: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 _buildIconText(Icons.location_on, user.state, fontSize: 16),
// // //                                 _buildIconText(Icons.phone, user.phone, fontSize: 16),
// // //                                 _buildIconText(Icons.email, user.email, fontSize: 16),
// // //                                 _buildIconText(Icons.calendar_today, user.dob, fontSize: 16),
// // //                                 _buildIconText(Icons.cake, user.age.toString(), fontSize: 16),
// // //                                 SizedBox(height: 16), // More space to separate the info section
// // //                               ],
// // //                             ),
// // //                             onTap: () async {
// // //                               User? updatedUser = await Navigator.push(
// // //                                 context,
// // //                                 MaterialPageRoute(
// // //                                   builder: (context) => UserDetailsPage(
// // //                                     user: user,
// // //                                     onUpdate: (_) => _loadUsers(),
// // //                                     onDelete: (_) => _loadUsers(),
// // //                                   ),
// // //                                 ),
// // //                               );
// // //                               _loadUsers();
// // //                             },
// // //                           ),
// // //                           // Action Buttons at the bottom
// // //                           Padding(
// // //                             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
// // //                             child: Row(
// // //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                               children: [
// // //                                 // Favorite Icon
// // //                                 IconButton(
// // //                                   icon: Icon(
// // //                                     user.isFavorite ? Icons.favorite : Icons.favorite_border,
// // //                                     color: user.isFavorite ? Colors.red : Colors.grey[500],
// // //                                     size: 28, // Slightly larger icon
// // //                                   ),
// // //                                   onPressed: () => _toggleFavorite(user),
// // //                                 ),
// // //                                 // Edit Icon
// // //                                 IconButton(
// // //                                   icon: Icon(
// // //                                     Icons.edit,
// // //                                     color: Colors.blue[600],
// // //                                     size: 28, // Slightly larger icon
// // //                                   ),
// // //                                   onPressed: () => _editUser(user),
// // //                                 ),
// // //                                 // Delete Icon
// // //                                 IconButton(
// // //                                   icon: Icon(
// // //                                     Icons.delete,
// // //                                     color: Colors.red[600],
// // //                                     size: 28, // Slightly larger icon
// // //                                   ),
// // //                                   onPressed: () => _confirmDelete(index),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addNewUser,
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Colors.redAccent,
// // //       ),
// // //     );
// // //   }
// // //
// // //   // Helper function to prevent overflow in user details
// // //   Widget _buildIconText(IconData icon, String? value, {double fontSize = 14}) {
// // //     return Row(
// // //       children: [
// // //         Icon(icon, size: 18, color: Colors.redAccent), // Icon before the text
// // //         SizedBox(width: 8),
// // //         Text(
// // //           value ?? 'N/A',  // Show 'N/A' if value is null
// // //           overflow: TextOverflow.ellipsis, // Prevents overflow
// // //           maxLines: 1, // Restrict to a single line
// // //           style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black54),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// //
// //
// // //logout btn
// //
// //
// //
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'package:matrimony_app/ui/login_screen.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // //
// // // import 'add_user.dart';
// // // import 'database_helper.dart';
// // // import 'edit_user.dart';
// // // import 'user_class.dart';
// // // import 'user_details.dart';
// // //
// // // class UserListPage extends StatefulWidget {
// // //   @override
// // //   _UserListPageState createState() => _UserListPageState();
// // // }
// // //
// // // class _UserListPageState extends State<UserListPage> {
// // //   TextEditingController searchController = TextEditingController();
// // //   List<User> allUsers = []; // Store all users
// // //   List<User> filteredUsers = []; // Store filtered users
// // //   Timer? _debounce;
// // //   String _sortField = 'name';
// // //   bool _isAscending = true;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUsers();
// // //   }
// // //
// // //   void _logout(BuildContext context) async {
// // //     try {
// // //       final prefs = await SharedPreferences.getInstance();
// // //       await prefs.clear();
// // //
// // //       await Future.delayed(Duration(milliseconds: 200)); // Small delay to ensure logout
// // //
// // //       if (!mounted) return;
// // //       Navigator.of(context).pushReplacementNamed('/login');
// // //     } catch (e) {
// // //       print("Logout error: $e");
// // //     }
// // //   }
// // //
// // //   void _loadUsers() async {
// // //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// // //     setState(() {
// // //       allUsers = users;
// // //       filteredUsers = users;
// // //       _applySorting();
// // //     });
// // //   }
// // //
// // //   void _onSearchChanged(String query) {
// // //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// // //     _debounce = Timer(Duration(milliseconds: 300), () {
// // //       _filterUsers(query);
// // //     });
// // //   }
// // //
// // //   void _filterUsers(String query) {
// // //     setState(() {
// // //       if (query.trim().isEmpty) {
// // //         filteredUsers = allUsers;
// // //       } else {
// // //         query = query.toLowerCase().trim();
// // //         filteredUsers = allUsers.where((user) {
// // //           return (user.name?.toLowerCase().contains(query) ?? false) ||
// // //               (user.email?.toLowerCase().contains(query) ?? false) ||
// // //               (user.phone?.toLowerCase().contains(query) ?? false) ||
// // //               (user.city?.toLowerCase().contains(query) ?? false) ||
// // //               (user.age.toString().contains(query));
// // //         }).toList();
// // //       }
// // //     });
// // //   }
// // //
// // //   void _toggleFavorite(User user) async {
// // //     user.isFavorite = !user.isFavorite;
// // //     await DatabaseHelper.instance.updateUser(user);
// // //     _loadUsers();
// // //   }
// // //
// // //   void _editUser(User user) async {
// // //     User? updatedUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => EditUserPage(user: user),
// // //       ),
// // //     );
// // //
// // //     if (updatedUser != null) {
// // //       await DatabaseHelper.instance.updateUser(updatedUser);
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _confirmDelete(int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text('Confirm Deletion',
// // //               style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Text('Are you sure you want to delete this user?',
// // //               style: GoogleFonts.poppins(fontSize: 14)),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               onPressed: () => Navigator.of(context).pop(),
// // //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 await DatabaseHelper.instance
// // //                     .deleteUser(filteredUsers[index].id!);
// // //                 _loadUsers();
// // //                 Navigator.of(context).pop();
// // //               },
// // //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   void _addNewUser() async {
// // //     User? newUser = await Navigator.push(
// // //       context,
// // //       MaterialPageRoute(
// // //         builder: (context) => AddUserPage(),
// // //       ),
// // //     );
// // //
// // //     if (newUser != null) {
// // //       _loadUsers();
// // //     }
// // //   }
// // //
// // //   void _applySorting() {
// // //     setState(() {
// // //       filteredUsers = List.from(allUsers);
// // //       filteredUsers.sort((a, b) {
// // //         dynamic aValue = _getFieldValue(a, _sortField);
// // //         dynamic bValue = _getFieldValue(b, _sortField);
// // //         if (aValue is String && bValue is String) {
// // //           return _isAscending
// // //               ? aValue.compareTo(bValue)
// // //               : bValue.compareTo(aValue);
// // //         } else if (aValue is num && bValue is num) {
// // //           return _isAscending
// // //               ? aValue.compareTo(bValue)
// // //               : bValue.compareTo(aValue);
// // //         }
// // //         return 0;
// // //       });
// // //     });
// // //   }
// // //
// // //   dynamic _getFieldValue(User user, String field) {
// // //     switch (field) {
// // //       case 'name':
// // //         return user.name ?? '';
// // //       case 'email':
// // //         return user.email ?? '';
// // //       case 'phone':
// // //         return user.phone ?? '';
// // //       case 'city':
// // //         return user.city ?? '';
// // //       case 'age':
// // //         return user.age;
// // //       default:
// // //         return '';
// // //     }
// // //   }
// // //
// // //   void _showSortingDialog() {
// // //     String tempSortField = _sortField;
// // //     bool tempIsAscending = _isAscending;
// // //
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) {
// // //         return AlertDialog(
// // //           title: Text('Sort Users', style: GoogleFonts.poppins(fontSize: 16)),
// // //           content: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               DropdownButtonFormField<String>(
// // //                 value: tempSortField,
// // //                 items: ['name', 'email', 'phone', 'city', 'age'].map((field) {
// // //                   return DropdownMenuItem(
// // //                       value: field, child: Text(field.toUpperCase()));
// // //                 }).toList(),
// // //                 onChanged: (value) {
// // //                   if (value != null) tempSortField = value;
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Sort By'),
// // //               ),
// // //               SizedBox(height: 10),
// // //               DropdownButtonFormField<bool>(
// // //                 value: tempIsAscending,
// // //                 items: [
// // //                   DropdownMenuItem(value: true, child: Text('Ascending')),
// // //                   DropdownMenuItem(value: false, child: Text('Descending')),
// // //                 ],
// // //                 onChanged: (value) {
// // //                   if (value != null) tempIsAscending = value;
// // //                 },
// // //                 decoration: InputDecoration(labelText: 'Order'),
// // //               ),
// // //             ],
// // //           ),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () => Navigator.pop(context),
// // //               child: Text('Cancel'),
// // //             ),
// // //             TextButton(
// // //               onPressed: () {
// // //                 setState(() {
// // //                   _sortField = tempSortField;
// // //                   _isAscending = tempIsAscending;
// // //                   _applySorting();
// // //                 });
// // //                 Navigator.pop(context);
// // //               },
// // //               child: Text('Apply'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _debounce?.cancel();
// // //     searchController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(
// // //           'User List',
// // //           style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
// // //         ),
// // //         backgroundColor: Colors.redAccent,
// // //         elevation: 5,
// // //         centerTitle: true,
// // //         actions: [
// // //           IconButton(
// // //             icon: Icon(Icons.logout, color: Colors.white),
// // //             onPressed: () => _logout(context),
// // //           ),
// // //         ],
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: EdgeInsets.all(16),
// // //               child: Row(
// // //                 children: [
// // //                   Expanded(
// // //                     child: TextField(
// // //                       controller: searchController,
// // //                       onChanged: _onSearchChanged,
// // //                       decoration: InputDecoration(
// // //                         labelText: 'Search User',
// // //                         labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// // //                         prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// // //                         border: OutlineInputBorder(
// // //                           borderRadius: BorderRadius.circular(25),
// // //                           borderSide: BorderSide(color: Colors.redAccent),
// // //                         ),
// // //                         filled: true,
// // //                         fillColor: Colors.white,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   IconButton(
// // //                     icon: Icon(Icons.sort, color: Colors.redAccent),
// // //                     onPressed: _showSortingDialog,
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: filteredUsers.isEmpty
// // //                   ? Center(
// // //                 child: Text(
// // //                   "No data found",
// // //                   style: GoogleFonts.poppins(
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.w500,
// // //                       color: Colors.black54),
// // //                 ),
// // //               )
// // //                   : ListView.builder(
// // //                 itemCount: filteredUsers.length,
// // //                 itemBuilder: (context, index) {
// // //                   User user = filteredUsers[index];
// // //                   return Card(
// // //                     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Slightly larger margin
// // //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), // More rounded corners
// // //                     elevation: 10, // More subtle elevation for a floating effect
// // //                     shadowColor: Colors.black.withOpacity(0.1), // Lighter shadow for more modern look
// // //                     child: Container(
// // //                       decoration: BoxDecoration(
// // //                         gradient: LinearGradient(
// // //                           colors: [Colors.white, Colors.grey[50]!], // Soft gradient background
// // //                           begin: Alignment.topLeft,
// // //                           end: Alignment.bottomRight,
// // //                         ),
// // //                         borderRadius: BorderRadius.circular(25), // Round corners on container
// // //                       ),
// // //                       child: Column(
// // //                         children: [
// // //                           ListTile(
// // //                             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // More compact padding
// // //                             title: Text(
// // //                               user.name!,
// // //                               overflow: TextOverflow.ellipsis,
// // //                               maxLines: 1,
// // //                               style: GoogleFonts.poppins(
// // //                                 fontSize: 24, // Larger title for more prominence
// // //                                 fontWeight: FontWeight.w700, // Bolder font weight
// // //                                 color: Colors.black87, // Darker color for better readability
// // //                               ),
// // //                             ),
// // //                             subtitle: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 _buildIconText(Icons.location_on, user.state, fontSize: 16),
// // //                                 _buildIconText(Icons.phone, user.phone, fontSize: 16),
// // //                                 _buildIconText(Icons.email, user.email, fontSize: 16),
// // //                                 _buildIconText(Icons.calendar_today, user.dob, fontSize: 16),
// // //                                 _buildIconText(Icons.cake, user.age.toString(), fontSize: 16),
// // //                                 SizedBox(height: 16), // More space to separate the info section
// // //                               ],
// // //                             ),
// // //                             onTap: () async {
// // //                               User? updatedUser = await Navigator.push(
// // //                                 context,
// // //                                 MaterialPageRoute(
// // //                                   builder: (context) => UserDetailsPage(
// // //                                     user: user,
// // //                                     onUpdate: (_) => _loadUsers(),
// // //                                     onDelete: (_) => _loadUsers(),
// // //                                   ),
// // //                                 ),
// // //                               );
// // //                               _loadUsers();
// // //                             },
// // //                           ),
// // //                           // Action Buttons at the bottom
// // //                           Padding(
// // //                             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
// // //                             child: Row(
// // //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                               children: [
// // //                                 // Favorite Icon
// // //                                 IconButton(
// // //                                   icon: Icon(
// // //                                     user.isFavorite ? Icons.favorite : Icons.favorite_border,
// // //                                     color: user.isFavorite ? Colors.red : Colors.grey[500],
// // //                                     size: 28, // Slightly larger icon
// // //                                   ),
// // //                                   onPressed: () => _toggleFavorite(user),
// // //                                 ),
// // //                                 // Edit Icon
// // //                                 IconButton(
// // //                                   icon: Icon(
// // //                                     Icons.edit,
// // //                                     color: Colors.blue[600],
// // //                                     size: 28, // Slightly larger icon
// // //                                   ),
// // //                                   onPressed: () => _editUser(user),
// // //                                 ),
// // //                                 // Delete Icon
// // //                                 IconButton(
// // //                                   icon: Icon(
// // //                                     Icons.delete,
// // //                                     color: Colors.red[600],
// // //                                     size: 28, // Slightly larger icon
// // //                                   ),
// // //                                   onPressed: () => _confirmDelete(index),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addNewUser,
// // //         child: Icon(Icons.add),
// // //         backgroundColor: Colors.redAccent,
// // //       ),
// // //     );
// // //   }
// // //
// // //   // Helper function to prevent overflow in user details
// // //   Widget _buildIconText(IconData icon, String? value, {double fontSize = 14}) {
// // //     return Row(
// // //       children: [
// // //         Icon(icon, size: 18, color: Colors.redAccent), // Icon before the text
// // //         SizedBox(width: 8),
// // //         Text(
// // //           value ?? 'N/A',  // Show 'N/A' if value is null
// // //           overflow: TextOverflow.ellipsis, // Prevents overflow
// // //           maxLines: 1, // Restrict to a single line
// // //           style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black54),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// //
// // //new card design
// //
// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'add_user.dart';
// // import 'api/apiservice.dart';
// // import 'database.dart';
// // import 'edit_user.dart';
// // import 'user_class.dart';
// // import 'user_details.dart';
// //
// // class UserListPage extends StatefulWidget {
// //   @override
// //   _UserListPageState createState() => _UserListPageState();
// // }
// //
// // class _UserListPageState extends State<UserListPage> {
// //   TextEditingController searchController = TextEditingController();
// //   List<User> allUsers = []; // Store all users
// //   List<User> filteredUsers = []; // Store filtered users
// //   Timer? _debounce;
// //   String _sortField = 'name';
// //   bool _isAscending = true;
// //   ApiService apiService = ApiService();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadUsers();
// //   }
// //
// //   void _logout(BuildContext context) async {
// //     try {
// //       final prefs = await SharedPreferences.getInstance();
// //       await prefs.clear();
// //
// //       await Future.delayed(Duration(milliseconds: 200)); // Small delay to ensure logout
// //
// //       if (!mounted) return;
// //       Navigator.of(context).pushReplacementNamed('/_login');
// //     } catch (e) {
// //       print("Logout error: $e");
// //     }
// //   }
// //
// //   void _loadUsers() async {
// //     List<User> users = await DatabaseHelper.instance.fetchUsers();
// //     setState(() {
// //       allUsers = users;
// //       filteredUsers = users;
// //       _applySorting();
// //     });
// //   }
// //
// //   void _onSearchChanged(String query) {
// //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// //     _debounce = Timer(Duration(milliseconds: 300), () {
// //       _filterUsers(query);
// //     });
// //   }
// //
// //   void _filterUsers(String query) {
// //     setState(() {
// //       if (query.trim().isEmpty) {
// //         filteredUsers = allUsers;
// //       } else {
// //         query = query.toLowerCase().trim();
// //         filteredUsers = allUsers.where((user) {
// //           return (user.name?.toLowerCase().contains(query) ?? false) ||
// //               (user.email?.toLowerCase().contains(query) ?? false) ||
// //               (user.phone?.toLowerCase().contains(query) ?? false) ||
// //               (user.city?.toLowerCase().contains(query) ?? false) ||
// //               (user.age.toString().contains(query));
// //         }).toList();
// //       }
// //     });
// //   }
// //
// //   void _toggleFavorite(User user) async {
// //     user.isFavorite = !user.isFavorite;
// //     await DatabaseHelper.instance.updateUser(user);
// //     _loadUsers();
// //   }
// //
// //   void _editUser(User user) async {
// //     User? updatedUser = await Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => EditUserPage(user: user),
// //       ),
// //     );
// //
// //     if (updatedUser != null) {
// //       await DatabaseHelper.instance.updateUser(updatedUser);
// //       _loadUsers();
// //     }
// //   }
// //
// //   void _confirmDelete(int index) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text('Confirm Deletion',
// //               style: GoogleFonts.poppins(fontSize: 16)),
// //           content: Text('Are you sure you want to delete this user?',
// //               style: GoogleFonts.poppins(fontSize: 14)),
// //           actions: <Widget>[
// //             TextButton(
// //               onPressed: () => Navigator.of(context).pop(),
// //               child: Text('Cancel', style: GoogleFonts.poppins(fontSize: 14)),
// //             ),
// //             TextButton(
// //               onPressed: () async {
// //                 await DatabaseHelper.instance
// //                     .deleteUser(filteredUsers[index].id!);
// //                 _loadUsers();
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('Delete', style: GoogleFonts.poppins(fontSize: 14)),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   void _addNewUser() async {
// //     User? newUser = await Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => AddUserPage(),
// //       ),
// //     );
// //
// //     if (newUser != null) {
// //       _loadUsers();
// //     }
// //   }
// //
// //   void _applySorting() {
// //     setState(() {
// //       filteredUsers = List.from(allUsers);
// //       filteredUsers.sort((a, b) {
// //         dynamic aValue = _getFieldValue(a, _sortField);
// //         dynamic bValue = _getFieldValue(b, _sortField);
// //         if (aValue is String && bValue is String) {
// //           return _isAscending
// //               ? aValue.compareTo(bValue)
// //               : bValue.compareTo(aValue);
// //         } else if (aValue is num && bValue is num) {
// //           return _isAscending
// //               ? aValue.compareTo(bValue)
// //               : bValue.compareTo(aValue);
// //         }
// //         return 0;
// //       });
// //     });
// //   }
// //
// //   dynamic _getFieldValue(User user, String field) {
// //     switch (field) {
// //       case 'name':
// //         return user.name ?? '';
// //       case 'email':
// //         return user.email ?? '';
// //       case 'phone':
// //         return user.phone ?? '';
// //       case 'city':
// //         return user.city ?? '';
// //       case 'age':
// //         return user.age;
// //       default:
// //         return '';
// //     }
// //   }
// //
// //   void _showSortingDialog() {
// //     String tempSortField = _sortField;
// //     bool tempIsAscending = _isAscending;
// //
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text('Sort Users', style: GoogleFonts.poppins(fontSize: 16)),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               DropdownButtonFormField<String>(
// //                 value: tempSortField,
// //                 items: ['name', 'email', 'phone', 'city', 'age'].map((field) {
// //                   return DropdownMenuItem(
// //                       value: field, child: Text(field.toUpperCase()));
// //                 }).toList(),
// //                 onChanged: (value) {
// //                   if (value != null) tempSortField = value;
// //                 },
// //                 decoration: InputDecoration(labelText: 'Sort By'),
// //               ),
// //               SizedBox(height: 10),
// //               DropdownButtonFormField<bool>(
// //                 value: tempIsAscending,
// //                 items: [
// //                   DropdownMenuItem(value: true, child: Text('Ascending')),
// //                   DropdownMenuItem(value: false, child: Text('Descending')),
// //                 ],
// //                 onChanged: (value) {
// //                   if (value != null) tempIsAscending = value;
// //                 },
// //                 decoration: InputDecoration(labelText: 'Order'),
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: Text('Cancel'),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   _sortField = tempSortField;
// //                   _isAscending = tempIsAscending;
// //                   _applySorting();
// //                 });
// //                 Navigator.pop(context);
// //               },
// //               child: Text('Apply'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _debounce?.cancel();
// //     searchController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'User List',
// //           style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
// //         ),
// //         backgroundColor: Colors.redAccent,
// //         elevation: 5,
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.logout, color: Colors.white),
// //             onPressed: () => _logout(context),
// //           ),
// //         ],
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Colors.red.shade50, Colors.redAccent.shade100],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: EdgeInsets.all(16),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     child: TextField(
// //                       controller: searchController,
// //                       onChanged: _onSearchChanged,
// //                       decoration: InputDecoration(
// //                         labelText: 'Search User',
// //                         labelStyle: GoogleFonts.poppins(color: Colors.redAccent),
// //                         prefixIcon: Icon(Icons.search, color: Colors.redAccent),
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(25),
// //                           borderSide: BorderSide(color: Colors.redAccent),
// //                         ),
// //                         filled: true,
// //                         fillColor: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                   IconButton(
// //                     icon: Icon(Icons.sort, color: Colors.redAccent),
// //                     onPressed: _showSortingDialog,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Expanded(
// //               child: filteredUsers.isEmpty
// //                   ? Center(
// //                 child: Text(
// //                   "No data found",
// //                   style: GoogleFonts.poppins(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.w500,
// //                       color: Colors.black54),
// //                 ),
// //               )
// //                   : ListView.builder(
// //                 itemCount: filteredUsers.length,
// //                 itemBuilder: (context, index) {
// //                   User user = filteredUsers[index];
// //                   return Card(
// //                     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(20), // More rounded look
// //                     ),
// //                     elevation: 6, // Subtle shadow for a floating effect
// //                     shadowColor: Colors.black.withOpacity(0.15), // Soft shadow
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(20),
// //                         gradient: LinearGradient(
// //                           colors: [Colors.white, Colors.grey.shade200], // Softer gradient
// //                           begin: Alignment.topLeft,
// //                           end: Alignment.bottomRight,
// //                         ),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.black.withOpacity(0.05),
// //                             blurRadius: 10,
// //                             spreadRadius: 2,
// //                             offset: Offset(0, 4), // Lighter shadow at the bottom
// //                           ),
// //                         ],
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           ListTile(
// //                             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //                             leading: CircleAvatar(
// //                               backgroundColor: Colors.redAccent.shade100, // Light Red Background
// //                               radius: 24, // Bigger Avatar
// //                               child: Text(
// //                                 user.name != null && user.name!.isNotEmpty
// //                                     ? user.name![0].toUpperCase() // First letter in uppercase
// //                                     : '?', // Default if name is empty
// //                                 style: GoogleFonts.poppins(
// //                                   fontSize: 20,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Colors.white,
// //                                 ),
// //                               ),
// //                             ),
// //                             title: Text(
// //                               user.name!,
// //                               overflow: TextOverflow.ellipsis,
// //                               maxLines: 1,
// //                               style: GoogleFonts.poppins(
// //                                 fontSize: 20,
// //                                 fontWeight: FontWeight.w600,
// //                                 color: Colors.black87,
// //                               ),
// //                             ),
// //                             subtitle: Padding(
// //                               padding: const EdgeInsets.only(top: 4.0),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   _buildIconText(Icons.wc, user.gender, fontSize: 14), // Gender
// //                                   _buildIconText(Icons.cake, user.age.toString(), fontSize: 14), // Age
// //                                   _buildIconText(Icons.location_city, user.city, fontSize: 14), // City
// //                                 ],
// //                               ),
// //                             ),
// //                             onTap: () async {
// //                               User? updatedUser = await Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => UserDetailsPage(
// //                                     user: user,
// //                                     onUpdate: (_) => _loadUsers(),
// //                                     onDelete: (_) => _loadUsers(),
// //                                   ),
// //                                 ),
// //                               );
// //                               _loadUsers();
// //                             },
// //                           ),
// //                           // Action Buttons at the bottom
// //                           Padding(
// //                             padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                               children: [
// //                                 _buildActionButton(
// //                                   icon: user.isFavorite ? Icons.favorite : Icons.favorite_border,
// //                                   color: user.isFavorite ? Colors.red : Colors.grey,
// //                                   onTap: () => _toggleFavorite(user),
// //                                 ),
// //                                 _buildActionButton(
// //                                   icon: Icons.edit,
// //                                   color: Colors.blue.shade600,
// //                                   onTap: () => _editUser(user),
// //                                 ),
// //                                 _buildActionButton(
// //                                   icon: Icons.delete,
// //                                   color: Colors.red.shade600,
// //                                   onTap: () => _confirmDelete(index),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _addNewUser,
// //         child: Icon(Icons.add),
// //         backgroundColor: Colors.redAccent,
// //       ),
// //     );
// //   }
// //
// //   // Helper function to prevent overflow in user details
// //   Widget _buildIconText(IconData icon, String? value, {double fontSize = 14}) {
// //     return Row(
// //       children: [
// //         Icon(icon, size: 18, color: Colors.redAccent), // Icon before the text
// //         SizedBox(width: 8),
// //         Text(
// //           value ?? 'N/A',  // Show 'N/A' if value is null
// //           overflow: TextOverflow.ellipsis, // Prevents overflow
// //           maxLines: 1, // Restrict to a single line
// //           style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black54),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   /// 🛠 **Reusable Action Button with Background**
// //   Widget _buildActionButton({required IconData icon, required Color color, required VoidCallback onTap}) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: EdgeInsets.all(10),
// //         decoration: BoxDecoration(
// //           shape: BoxShape.circle,
// //           color: color.withOpacity(0.15), // Soft background color
// //         ),
// //         child: Icon(icon, color: color, size: 26),
// //       ),
// //     );
// //   }
// // }
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'add_user.dart';
// import 'api/apiservice.dart';
// import 'database.dart';
// import 'edit_user.dart';
// import 'user_class.dart';
// import 'user_details.dart';
//
// class UserListPage extends StatefulWidget {
//   @override
//   _UserListPageState createState() => _UserListPageState();
// }
//
// class _UserListPageState extends State<UserListPage> {
//   TextEditingController searchController = TextEditingController();
//   List<User> allUsers = []; // Store all users
//   List<User> filteredUsers = []; // Store filtered users
//   Timer? _debounce;
//   String _sortField = 'name';
//   bool _isAscending = true;
//   ApiService apiService = ApiService();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUsers();
//   }
//
//   // Method to calculate age based on dob
//   int _calculateAge(String dob) {
//     DateTime birthDate = DateTime.parse(dob);  // Parse the date
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
//   void _logout(BuildContext context) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.clear();
//
//       await Future.delayed(Duration(milliseconds: 200)); // Small delay to ensure logout
//
//       if (!mounted) return;
//       Navigator.of(context).pushReplacementNamed('/_login');
//     } catch (e) {
//       print("Logout error: $e");
//     }
//   }
//
//   void _loadUsers() async {
//     List<User> users = await DatabaseHelper.instance.fetchUsers();
//     setState(() {
//       allUsers = users;
//       filteredUsers = users;
//       _applySorting();
//     });
//   }
//
//   void _onSearchChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(Duration(milliseconds: 300), () {
//       _filterUsers(query);
//     });
//   }
//
//   void _filterUsers(String query) {
//     setState(() {
//       if (query.trim().isEmpty) {
//         filteredUsers = allUsers;
//       } else {
//         query = query.toLowerCase().trim();
//         filteredUsers = allUsers.where((user) {
//           return (user.name?.toLowerCase().contains(query) ?? false) ||
//               (user.email?.toLowerCase().contains(query) ?? false) ||
//               (user.phone?.toLowerCase().contains(query) ?? false) ||
//               (user.city?.toLowerCase().contains(query) ?? false) ||
//               (_calculateAge(user.dob).toString().contains(query)); // Use _calculateAge
//         }).toList();
//       }
//     });
//   }
//
//   void _toggleFavorite(User user) async {
//     user.isFavorite = !user.isFavorite;
//     await DatabaseHelper.instance.updateUser(user);
//     _loadUsers();
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
//       _loadUsers();
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
//                 await DatabaseHelper.instance
//                     .deleteUser(filteredUsers[index].id!);
//                 _loadUsers();
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
//   void _addNewUser() async {
//     User? newUser = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AddUserPage(),
//       ),
//     );
//
//     if (newUser != null) {
//       _loadUsers();
//     }
//   }
//
//   void _applySorting() {
//     setState(() {
//       filteredUsers = List.from(allUsers);
//       filteredUsers.sort((a, b) {
//         dynamic aValue = _getFieldValue(a, _sortField);
//         dynamic bValue = _getFieldValue(b, _sortField);
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
//         return _calculateAge(user.dob.toString());  // Get age using _calculateAge
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
//         title: Text(
//           'User List',
//           style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.redAccent,
//         elevation: 5,
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout, color: Colors.white),
//             onPressed: () => _logout(context),
//           ),
//         ],
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
//               child: filteredUsers.isEmpty
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
//                 itemCount: filteredUsers.length,
//                 itemBuilder: (context, index) {
//                   User user = filteredUsers[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     elevation: 6,
//                     shadowColor: Colors.black.withOpacity(0.15),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: LinearGradient(
//                           colors: [Colors.white, Colors.grey.shade200],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             spreadRadius: 1,
//                             blurRadius: 8,
//                           ),
//                         ],
//                       ),
//                       child: ListTile(
//                         onTap: () async {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => UserDetailsPage(user: user),
//                             ),
//                           );
//                         },
//                         leading: CircleAvatar(
//                           radius: 30,
//                           backgroundImage: NetworkImage(user.profilePic ?? ''),
//                         ),
//                         title: Text(
//                           user.name ?? 'No Name',
//                           style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 16,
//                               color: Colors.black87),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(user.email ?? 'No Email'),
//                             Text(user.phone ?? 'No Phone'),
//                             Text(user.city ?? 'No City'),
//                             Text('Age: ${_calculateAge(user.dob)}'), // Display the age here
//                           ],
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.edit),
//                               onPressed: () => _editUser(user),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.delete),
//                               onPressed: () => _confirmDelete(index),
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                   user.isFavorite ? Icons.star : Icons.star_border),
//                               onPressed: () => _toggleFavorite(user),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.redAccent,
//         onPressed: _addNewUser,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'add_user.dart';
// import 'api/apiservice.dart';
// import 'edit_user.dart';
// import 'user_class.dart';
// import 'user_details.dart';
//
// class UserListPage extends StatefulWidget {
//   @override
//   _UserListPageState createState() => _UserListPageState();
// }
//
// class _UserListPageState extends State<UserListPage> {
//   TextEditingController searchController = TextEditingController();
//   List<User> allUsers = []; // Store all users
//   List<User> filteredUsers = []; // Store filtered users
//   Timer? _debounce;
//   String _sortField = 'name';
//   bool _isAscending = true;
//   ApiService apiService = ApiService();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUsers();
//   }
//
//   void _logout(BuildContext context) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.clear();
//
//       await Future.delayed(Duration(milliseconds: 200)); // Small delay to ensure logout
//
//       if (!mounted) return;
//       Navigator.of(context).pushReplacementNamed('/_login');
//     } catch (e) {
//       print("Logout error: $e");
//     }
//   }
//   void _editUser(User user) async {
//     User? updatedUser = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => EditUserPage(user: user)),
//     );
//
//     if (updatedUser != null) {
//       await ApiService().updateUser(updatedUser.id!.toString(), updatedUser.toMap());
//       _loadUsers();
//     }
//   }
//
//   void _loadUsers() async {
//     try {
//       List<Map<String, dynamic>> usersData = await ApiService().getUsers();
//       setState(() {
//         allUsers = usersData.map((data) => User.fromMap(data)).toList();
//         filteredUsers = allUsers;
//       });
//     } catch (e) {
//       print("Error loading users: $e");
//     }
//   }
//
//
//   void _onSearchChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(Duration(milliseconds: 300), () {
//       _filterUsers(query);
//     });
//   }
//
//   void _filterUsers(String query) {
//     setState(() {
//       if (query.trim().isEmpty) {
//         filteredUsers = allUsers;
//       } else {
//         query = query.toLowerCase().trim();
//         filteredUsers = allUsers.where((user) {
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
//     await ApiService().updateUser(user.id!.toString(), user.toMap());
//     _loadUsers();
//   }
//
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
//       await apiService.updateUser(updatedUser.toJson()); // Update the user through mock API
//       _loadUsers();
//     }
//   }
//
//   void _confirmDelete(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion'),
//           content: Text('Are you sure you want to delete this user?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await ApiService().deleteUser(filteredUsers[index].id!);
//                 _loadUsers();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   void _addNewUser() async {
//     User? newUser = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddUserPage()),
//     );
//
//     if (newUser != null) {
//       await ApiService().createUser(newUser.toMap());
//       _loadUsers(); // Refresh list
//     }
//   }
//
//
//   void _applySorting() {
//     setState(() {
//       filteredUsers = List.from(allUsers);
//       filteredUsers.sort((a, b) {
//         dynamic aValue = _getFieldValue(a, _sortField);
//         dynamic bValue = _getFieldValue(b, _sortField);
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
//         title: Text(
//           'User List',
//           style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.redAccent,
//         elevation: 5,
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout, color: Colors.white),
//             onPressed: () => _logout(context),
//           ),
//         ],
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
//               child: filteredUsers.isEmpty
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
//                 itemCount: filteredUsers.length,
//                 itemBuilder: (context, index) {
//                   User user = filteredUsers[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20), // More rounded look
//                     ),
//                     elevation: 6, // Subtle shadow for a floating effect
//                     shadowColor: Colors.black.withOpacity(0.15), // Soft shadow
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: LinearGradient(
//                           colors: [Colors.white, Colors.grey.shade200], // Softer gradient
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 10,
//                             spreadRadius: 2,
//                             offset: Offset(0, 4), // Lighter shadow at the bottom
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.redAccent.shade100, // Light Red Background
//                               radius: 24, // Bigger Avatar
//                               child: Text(
//                                 user.name != null && user.name!.isNotEmpty
//                                     ? user.name![0].toUpperCase() // First letter in uppercase
//                                     : '?', // Default if name is empty
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
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   _buildIconText(Icons.wc, user.gender, fontSize: 14), // Gender
//                                   _buildIconText(Icons.cake, user.age.toString(), fontSize: 14), // Age
//                                   _buildIconText(Icons.location_city, user.city, fontSize: 14), // City
//                                 ],
//                               ),
//                             ),
//                             onTap: () async {
//                               User? updatedUser = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => UserDetailsPage(
//                                     user: user,
//                                     onUpdate: (_) => _loadUsers(),
//                                     onDelete: (_) => _loadUsers(),
//                                   ),
//                                 ),
//                               );
//                               _loadUsers();
//                             },
//                           ),
//                           // Action Buttons at the bottom
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 _buildActionButton(
//                                   icon: user.isFavorite ? Icons.favorite : Icons.favorite_border,
//                                   color: user.isFavorite ? Colors.red : Colors.grey,
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
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addNewUser,
//         child: Icon(Icons.add),
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }
//
//   // Helper function to prevent overflow in user details
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
//
//   /// 🛠 **Reusable Action Button with Background**
//   Widget _buildActionButton({required IconData icon, required Color color, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: color.withOpacity(0.15), // Soft background color
//         ),
//         child: Icon(icon, color: color, size: 26),
//       ),
//     );
//   }
// // }
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'add_user.dart';
// import 'api/apiservice.dart';
// import 'edit_user.dart';
// import 'user_class.dart';
// import 'user_details.dart';
//
// class UserListPage extends StatefulWidget {
//   @override
//   _UserListPageState createState() => _UserListPageState();
// }
//
// class _UserListPageState extends State<UserListPage> {
//   TextEditingController searchController = TextEditingController();
//   List<User> allUsers = []; // Store all users
//   List<User> filteredUsers = []; // Store filtered users
//   Timer? _debounce;
//   String _sortField = 'name';
//   bool _isAscending = true;
//   ApiService apiService = ApiService();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUsers();
//   }
//
//   // Handle user logout
//   void _logout(BuildContext context) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.clear();
//
//       await Future.delayed(Duration(milliseconds: 200)); // Small delay to ensure logout
//
//       if (!mounted) return;
//       Navigator.of(context).pushReplacementNamed('/_login');
//     } catch (e) {
//       print("Logout error: $e");
//     }
//   }
//
//   // Edit user details
//   void _editUser(User user) async {
//     User? updatedUser = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => EditUserPage(user: user)),
//     );
//
//     if (updatedUser != null) {
//       await ApiService().updateUser(updatedUser.id!.toString(), updatedUser.toMap());
//       _loadUsers();
//     }
//   }
//
//   // Load users from API
//   void _loadUsers() async {
//     try {
//       List<Map<String, dynamic>> usersData = await ApiService().getUsers();
//       setState(() {
//         allUsers = usersData.map((data) => User.fromMap(data)).toList();
//         filteredUsers = allUsers;
//       });
//     } catch (e) {
//       print("Error loading users: $e");
//     }
//   }
//
//   // Debounce search functionality
//   void _onSearchChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(Duration(milliseconds: 300), () {
//       _filterUsers(query);
//     });
//   }
//
//   // Filter users based on the search query
//   void _filterUsers(String query) {
//     setState(() {
//       if (query.trim().isEmpty) {
//         filteredUsers = allUsers;
//       } else {
//         query = query.toLowerCase().trim();
//         filteredUsers = allUsers.where((user) {
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
//   // Toggle favorite status of the user
//   void _toggleFavorite(User user) async {
//     user.isFavorite = !user.isFavorite;
//     await ApiService().updateUser(user.id!.toString(), user.toMap());
//     _loadUsers();
//   }
//
//   // Confirm and delete a user
//   void _confirmDelete(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion'),
//           content: Text('Are you sure you want to delete this user?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await ApiService().deleteUser(filteredUsers[index].id!);
//                 _loadUsers();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Add a new user
//   void _addNewUser() async {
//     User? newUser = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddUserPage()),
//     );
//
//     if (newUser != null) {
//       await ApiService().createUser(newUser.toMap());
//       _loadUsers(); // Refresh list
//     }
//   }
//
//   // Apply sorting based on selected field and order
//   void _applySorting() {
//     setState(() {
//       filteredUsers = List.from(allUsers);
//       filteredUsers.sort((a, b) {
//         dynamic aValue = _getFieldValue(a, _sortField);
//         dynamic bValue = _getFieldValue(b, _sortField);
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
//   // Helper function to get field value based on sort field
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
//   // Show sorting dialog
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
//         title: Text(
//           'User List',
//           style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.redAccent,
//         elevation: 5,
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout, color: Colors.white),
//             onPressed: () => _logout(context),
//           ),
//         ],
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
//               child: filteredUsers.isEmpty
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
//                 itemCount: filteredUsers.length,
//                 itemBuilder: (context, index) {
//                   User user = filteredUsers[index];
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20), // More rounded look
//                     ),
//                     elevation: 6, // Subtle shadow for a floating effect
//                     shadowColor: Colors.black.withOpacity(0.15), // Soft shadow
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: LinearGradient(
//                           colors: [Colors.white, Colors.grey.shade200], // Softer gradient
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 10,
//                             spreadRadius: 2,
//                             offset: Offset(0, 4), // Lighter shadow at the bottom
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.redAccent.shade100, // Light Red Background
//                               radius: 24, // Bigger Avatar
//                               child: Text(
//                                 user.name != null && user.name!.isNotEmpty
//                                     ? user.name![0].toUpperCase() // First letter in uppercase
//                                     : '?', // Default if name is empty
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
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   _buildIconText(Icons.wc, user.gender, fontSize: 14), // Gender
//                                   _buildIconText(Icons.cake, user.age.toString(), fontSize: 14), // Age
//                                   _buildIconText(Icons.location_city, user.city, fontSize: 14), // City
//                                 ],
//                               ),
//                             ),
//                             onTap: () async {
//                               await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => UserDetailsPage(
//                                     user: user,
//                                     onUpdate: (_) => _loadUsers(),
//                                     onDelete: (_) => _loadUsers(),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                           // Action Buttons at the bottom
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 _buildActionButton(
//                                   icon: user.isFavorite ? Icons.favorite : Icons.favorite_border,
//                                   color: user.isFavorite ? Colors.red : Colors.grey,
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
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addNewUser,
//         child: Icon(Icons.add),
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }
//
//   // Helper function to prevent overflow in user details
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
//
//   // Reusable Action Button with Background
//   Widget _buildActionButton({required IconData icon, required Color color, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: color.withOpacity(0.15), // Soft background color
//         ),
//         child: Icon(icon, color: color, size: 26),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_user.dart';
import 'api/apiservice.dart';
import 'edit_user.dart';
import 'user_class.dart';
import 'user_details.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  TextEditingController searchController = TextEditingController();
  List<User> allUsers = [];
  List<User> filteredUsers = [];
  Timer? _debounce;
  String _sortField = 'name';
  bool _isAscending = true;
  bool _isLoading = true;
  String? _error;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _logout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      print("Logout error: $e");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to logout: $e')));
    }
  }

  void _loadUsers() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      List<User> users = await apiService.getUsers();
      setState(() {
        allUsers = users;
        filteredUsers = List.from(allUsers);
        _applySorting();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = "Failed to load users: $e";
        _isLoading = false;
      });
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 300), () {
      _filterUsers(query);
    });
  }

  void _filterUsers(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        filteredUsers = List.from(allUsers);
      } else {
        query = query.toLowerCase().trim();
        filteredUsers = allUsers.where((user) {
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
    setState(() => _isLoading = true);
    user.isFavorite = (user.isFavorite == 1) ? 0 : 1;
    try {
      await apiService.updateUser(user.id!.toString(), user);
      _loadUsers();
    } catch (e) {
      setState(() {
        user.isFavorite = (user.isFavorite == 1) ? 0 : 1; // Revert on failure
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to toggle favorite: $e')));
    }
  }

  void _editUser(User user) async {
    User? updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUserPage(user: user)),
    );
    if (updatedUser != null) {
      setState(() => _isLoading = true);
      try {
        await apiService.updateUser(updatedUser.id!.toString(), updatedUser);
        _loadUsers();
      } catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update user: $e')));
      }
    }
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion', style: GoogleFonts.poppins()),
          content: Text('Are you sure you want to delete this user?', style: GoogleFonts.poppins()),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel', style: GoogleFonts.poppins())),
            TextButton(
              onPressed: () async {
                setState(() => _isLoading = true);
                try {
                  await apiService.deleteUser(filteredUsers[index].id!.toString());
                  _loadUsers();
                  Navigator.pop(context);
                } catch (e) {
                  setState(() => _isLoading = false);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete user: $e')));
                }
              },
              child: Text('Delete', style: GoogleFonts.poppins(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }

  void _addNewUser() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserPage()));
    _loadUsers();
  }

  void _applySorting() {
    filteredUsers.sort((a, b) {
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
                onChanged: (value) => tempSortField = value!,
                decoration: InputDecoration(labelText: 'Sort By'),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<bool>(
                value: tempIsAscending,
                items: [
                  DropdownMenuItem(value: true, child: Text('Ascending')),
                  DropdownMenuItem(value: false, child: Text('Descending')),
                ],
                onChanged: (value) => tempIsAscending = value!,
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
        title: Text('User List', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
        backgroundColor: Colors.redAccent,
        elevation: 5,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadUsers,
            tooltip: 'Refresh',
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
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
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.redAccent, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.sort, color: Colors.redAccent),
                    onPressed: _showSortingDialog,
                    tooltip: 'Sort',
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator(color: Colors.redAccent))
                  : _error != null
                  ? Center(child: Text(_error!, style: GoogleFonts.poppins(fontSize: 18, color: Colors.red)))
                  : filteredUsers.isEmpty
                  ? Center(
                child: Text(
                  "No users found",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
                ),
              )
                  : ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  User user = filteredUsers[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.red.shade50],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
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
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsPage(
                                    user: user,
                                    onUpdate: (_) => _loadUsers(),
                                    onDelete: (_) => _loadUsers(),
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewUser,
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.redAccent,
        tooltip: 'Add User',
      ),
    );
  }

  Widget _buildIconText(IconData icon, String value, {double fontSize = 14}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.redAccent),
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
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(0.15)),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }
}