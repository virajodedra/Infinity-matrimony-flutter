// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'dart:ui';
// import 'dashboard.dart';
//
// class CoverPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.pink.shade100, Colors.red.shade400],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Spacer(),
//             Text(
//               'SoulMate Connect',
//               style: GoogleFonts.poppins(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 letterSpacing: 1.5,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 '"Where Souls Meet, Connections Grow"',
//                 style: GoogleFonts.poppins(
//                   fontSize: 22,
//                   fontStyle: FontStyle.italic,
//                   color: Colors.white70,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(height: 40),
//
//             // Glassmorphic Container Fix
//             GlassmorphicContainer(
//               width: 260,
//               height: 260,
//               borderRadius: 20,
//               blur: 10,
//               alignment: Alignment.center,
//               border: 0.5,
//               linearGradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Colors.white.withOpacity(0.2),
//                   Colors.white.withOpacity(0.1),
//                 ],
//               ),
//               borderGradient: LinearGradient(
//                 colors: [
//                   Colors.white.withOpacity(0.5),
//                   Colors.white.withOpacity(0.1),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image.asset(
//                   'assets/images/matrimony_app_logo.jpeg',
//                   width: 250,
//                   height: 250,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//             Spacer(),
//
//             SizedBox(
//               width: 220,
//               height: 55,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => DashboardScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 8,
//                   shadowColor: Colors.white54,
//                 ),
//                 child: Text(
//                   'Get Started',
//                   style: GoogleFonts.poppins(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.redAccent,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 60),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'dashboard.dart';
// // //
// // // class CoverPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.pink.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             Spacer(),
// // //             Text(
// // //               'SoulMate Connect',
// // //               style: GoogleFonts.poppins(
// // //                 fontSize: 32,
// // //                 fontWeight: FontWeight.bold,
// // //                 color: Colors.redAccent,
// // //               ),
// // //               textAlign: TextAlign.center,
// // //             ),
// // //             SizedBox(height: 10),
// // //             Text(
// // //               '"Bringing hearts together, one match at a time"',
// // //               style: GoogleFonts.poppins(
// // //                 fontSize: 18,
// // //                 fontStyle: FontStyle.italic,
// // //                 color: Colors.black54,
// // //               ),
// // //               textAlign: TextAlign.center,
// // //             ),
// // //             SizedBox(height: 30),
// // //             Image.asset(
// // //               'assets/images/matrimony_app_logo.jpeg',
// // //               width: 200,
// // //               height: 200,
// // //             ),
// // //             Spacer(),
// // //             SizedBox(
// // //               width: 200,
// // //               height: 50,
// // //               child: ElevatedButton(
// // //                 onPressed: () {
// // //                   Navigator.pushReplacement(
// // //                     context,
// // //                     MaterialPageRoute(builder: (context) => DashboardScreen()),
// // //                   );
// // //                 },
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: Colors.redAccent,
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(25),
// // //                   ),
// // //                 ),
// // //                 child: Text(
// // //                   'Get Started',
// // //                   style: GoogleFonts.poppins(
// // //                     fontSize: 18,
// // //                     fontWeight: FontWeight.w600,
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             SizedBox(height: 50),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'dashboard.dart';
// // //
// // // class CoverPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.pink.shade50, Colors.redAccent.shade100],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             Spacer(),
// // //             Text(
// // //               'SoulMate Connect',
// // //               style: GoogleFonts.poppins(
// // //                 fontSize: 36,
// // //                 fontWeight: FontWeight.bold,
// // //                 color: Colors.redAccent,
// // //                 letterSpacing: 1.5,
// // //               ),
// // //               textAlign: TextAlign.center,
// // //             ),
// // //             SizedBox(height: 15),
// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // //               child: Text(
// // //                 '"Where Souls Meet, Connections Grow"',
// // //                 style: GoogleFonts.poppins(
// // //                   fontSize: 20,
// // //                   fontStyle: FontStyle.italic,
// // //                   color: Colors.black87,
// // //                 ),
// // //                 textAlign: TextAlign.center,
// // //               ),
// // //             ),
// // //             SizedBox(height: 40),
// // //             Container(
// // //               decoration: BoxDecoration(
// // //                 boxShadow: [
// // //                   BoxShadow(
// // //                     color: Colors.black26,
// // //                     blurRadius: 10,
// // //                     spreadRadius: 2,
// // //                     offset: Offset(0, 5),
// // //                   ),
// // //                 ],
// // //                 borderRadius: BorderRadius.circular(20),
// // //               ),
// // //               child: ClipRRect(
// // //                 borderRadius: BorderRadius.circular(20),
// // //                 child: Image.asset(
// // //                   'assets/images/matrimony_app_logo.jpeg',
// // //                   width: 250,
// // //                   height: 250,
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //               ),
// // //             ),
// // //             Spacer(),
// // //             SizedBox(
// // //               width: 220,
// // //               height: 55,
// // //               child: ElevatedButton(
// // //                 onPressed: () {
// // //                   Navigator.pushReplacement(
// // //                     context,
// // //                     MaterialPageRoute(builder: (context) => DashboardScreen()),
// // //                   );
// // //                 },
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: Colors.redAccent,
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(30),
// // //                   ),
// // //                   elevation: 8,
// // //                   shadowColor: Colors.redAccent.withOpacity(0.5),
// // //                 ),
// // //                 child: Text(
// // //                   'Get Started',
// // //                   style: GoogleFonts.poppins(
// // //                     fontSize: 20,
// // //                     fontWeight: FontWeight.bold,
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             SizedBox(height: 60),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// // //New ui from here
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'dashboard.dart';
// //
// // class CoverPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Colors.pink.shade100, Colors.red.shade400],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Spacer(),
// //             Text(
// //               'SoulMate Connect',
// //               style: GoogleFonts.poppins(
// //                 fontSize: 40,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.white,
// //                 letterSpacing: 1.5,
// //               ),
// //               textAlign: TextAlign.center,
// //             ),
// //             SizedBox(height: 15),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20),
// //               child: Text(
// //                 '"Where Souls Meet, Connections Grow"',
// //                 style: GoogleFonts.poppins(
// //                   fontSize: 22,
// //                   fontStyle: FontStyle.italic,
// //                   color: Colors.white70,
// //                 ),
// //                 textAlign: TextAlign.center,
// //               ),
// //             ),
// //             SizedBox(height: 40),
// //             GlassmorphicContainer(
// //               width: 260,
// //               height: 260,
// //               borderRadius: 20,
// //               blur: 10,
// //               alignment: Alignment.center,
// //               border: 0.5,
// //               linearGradient: LinearGradient(
// //                 colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.1)],
// //               ),
// //               borderGradient: LinearGradient(
// //                 colors: [Colors.white.withOpacity(0.5), Colors.white.withOpacity(0.1)],
// //               ),
// //               child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(20),
// //                 child: Image.asset(
// //                   'assets/images/matrimony_app_logo.jpeg',
// //                   width: 250,
// //                   height: 250,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             Spacer(),
// //             SizedBox(
// //               width: 220,
// //               height: 55,
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   Navigator.pushReplacement(
// //                     context,
// //                     MaterialPageRoute(builder: (context) => DashboardScreen()),
// //                   );
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.white,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(30),
// //                   ),
// //                   elevation: 8,
// //                   shadowColor: Colors.white54,
// //                 ),
// //                 child: Text(
// //                   'Get Started',
// //                   style: GoogleFonts.poppins(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.redAccent,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 60),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // // class DashboardScreen extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(
// // //           'SoulMate Connect',
// // //           style: GoogleFonts.poppins(
// // //             fontSize: 24,
// // //             fontWeight: FontWeight.bold,
// // //             letterSpacing: 1.2,
// // //           ),
// // //         ),
// // //         backgroundColor: Colors.redAccent,
// // //         centerTitle: true,
// // //         elevation: 8,
// // //         shadowColor: Colors.black26,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Colors.pink.shade100, Colors.red.shade400],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Padding(
// // //           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
// // //           child: GridView.count(
// // //             crossAxisCount: 2,
// // //             crossAxisSpacing: 20,
// // //             mainAxisSpacing: 20,
// // //             children: [
// // //               _buildDashboardTile(context, Icons.person_add, "Add User", '/addUser'),
// // //               _buildDashboardTile(context, Icons.list, "User List", '/userList'),
// // //               _buildDashboardTile(context, Icons.favorite, "Favourites", '/favourites'),
// // //               _buildDashboardTile(context, Icons.info, "About Us", '/aboutUs'),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildDashboardTile(BuildContext context, IconData icon, String title, String route) {
// // //     return InkWell(
// // //       onTap: () {
// // //         Navigator.pushNamed(context, route);
// // //       },
// // //       borderRadius: BorderRadius.circular(20),
// // //       child: Card(
// // //         elevation: 12,
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //         shadowColor: Colors.black26,
// // //         child: AnimatedContainer(
// // //           duration: Duration(milliseconds: 300),
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(20),
// // //             gradient: LinearGradient(
// // //               colors: [Colors.white, Colors.red.shade200],
// // //               begin: Alignment.topLeft,
// // //               end: Alignment.bottomRight,
// // //             ),
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: Colors.black12,
// // //                 blurRadius: 8,
// // //                 spreadRadius: 2,
// // //                 offset: Offset(2, 4),
// // //               ),
// // //             ],
// // //           ),
// // //           padding: EdgeInsets.all(16),
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             crossAxisAlignment: CrossAxisAlignment.center,
// // //             children: [
// // //               Container(
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   color: Colors.redAccent.withOpacity(0.2),
// // //                   boxShadow: [
// // //                     BoxShadow(
// // //                       color: Colors.black12,
// // //                       blurRadius: 10,
// // //                       spreadRadius: 2,
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 padding: EdgeInsets.all(20),
// // //                 child: Icon(icon, size: 50, color: Colors.redAccent),
// // //               ),
// // //               SizedBox(height: 15),
// // //               Text(
// // //                 title,
// // //                 textAlign: TextAlign.center,
// // //                 style: GoogleFonts.poppins(
// // //                   fontSize: 18,
// // //                   fontWeight: FontWeight.w600,
// // //                   color: Colors.black87,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
