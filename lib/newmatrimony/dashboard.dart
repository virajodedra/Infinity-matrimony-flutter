// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Matrimonial', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
//         backgroundColor: Colors.redAccent,
//         centerTitle: true,
//         elevation: 5,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.pink.shade50, Colors.redAccent.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 15,
//           mainAxisSpacing: 15,
//           padding: EdgeInsets.all(20),
//           children: [
//             _buildDashboardTile(
//               context,
//               Icons.person_add,
//               "Add User",
//               '/addUser',
//             ),
//             _buildDashboardTile(
//               context,
//               Icons.list,
//               "User List",
//               '/userList',
//             ),
//             _buildDashboardTile(
//               context,
//               Icons.favorite,
//               "Favourite",
//               '/favourites',
//             ),
//             _buildDashboardTile(
//               context,
//               Icons.info,
//               "About Us",
//               '/aboutUs',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDashboardTile(BuildContext context, IconData icon, String title, String route) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       borderRadius: BorderRadius.circular(15),
//       child: Card(
//         elevation: 8,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         shadowColor: Colors.redAccent.withOpacity(0.5),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             gradient: LinearGradient(
//               colors: [Colors.white, Colors.red.shade100],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.redAccent.withOpacity(0.1),
//                 ),
//                 padding: EdgeInsets.all(15),
//                 child: Icon(icon, size: 40, color: Colors.redAccent),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 title,
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'SoulMate Connect',
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//           ),
//         ),
//         backgroundColor: Colors.redAccent,
//         centerTitle: true,
//         elevation: 8,
//         shadowColor: Colors.black26,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.pink.shade50, Colors.redAccent.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//           child: GridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//             children: [
//               _buildDashboardTile(context, Icons.person_add, "Add User", '/addUser'),
//               _buildDashboardTile(context, Icons.list, "User List", '/userList'),
//               _buildDashboardTile(context, Icons.favorite, "Favourites", '/favourites'),
//               _buildDashboardTile(context, Icons.info, "About Us", '/aboutUs'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDashboardTile(BuildContext context, IconData icon, String title, String route) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       borderRadius: BorderRadius.circular(20),
//       child: Card(
//         elevation: 12,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         shadowColor: Colors.black26,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               colors: [Colors.white, Colors.red.shade200],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 8,
//                 spreadRadius: 2,
//                 offset: Offset(2, 4),
//               ),
//             ],
//           ),
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.redAccent.withOpacity(0.2),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 padding: EdgeInsets.all(20),
//                 child: Icon(icon, size: 50, color: Colors.redAccent),
//               ),
//               SizedBox(height: 15),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//new ui from here

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'SoulMate Connect',
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.redAccent,
//         centerTitle: true,
//         elevation: 8,
//         shadowColor: Colors.black26,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.pink.shade100, Colors.red.shade400],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//           child: GridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//             children: [
//               _buildDashboardTile(context, Icons.person_add, "Add User", '/addUser'),
//               _buildDashboardTile(context, Icons.list, "User List", '/userList'),
//               _buildDashboardTile(context, Icons.favorite, "Favourites", '/favourites'),
//               _buildDashboardTile(context, Icons.info, "About Us", '/aboutUs'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDashboardTile(BuildContext context, IconData icon, String title, String route) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       borderRadius: BorderRadius.circular(20),
//       child: Card(
//         elevation: 12,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         shadowColor: Colors.black26,
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 300),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               colors: [Colors.white.withOpacity(0.8), Colors.red.shade200.withOpacity(0.8)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 spreadRadius: 3,
//                 offset: Offset(2, 4),
//               ),
//             ],
//           ),
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.redAccent.withOpacity(0.2),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 padding: EdgeInsets.all(20),
//                 child: Icon(icon, size: 50, color: Colors.redAccent),
//               ),
//               SizedBox(height: 15),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//new ui from here



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SoulMate Connect',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        elevation: 8,
        shadowColor: Colors.black26,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade100, Colors.red.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildDashboardTile(context, Icons.person_add, "Add User", '/addUser'),
              _buildDashboardTile(context, Icons.list, "User List", '/userList'),
              _buildDashboardTile(context, Icons.favorite, "Favourites", '/favourites'),
              _buildDashboardTile(context, Icons.info, "About Us", '/aboutUs'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardTile(BuildContext context, IconData icon, String title, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      borderRadius: BorderRadius.circular(20),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.black26,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.red.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(2, 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: Icon(icon, size: 50, color: Colors.redAccent),
              ),
              SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
