// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'newmatrimony/home.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//
//   runApp(MyApp(isLoggedIn: isLoggedIn));
// }
//
// class MyApp extends StatelessWidget {
//   final bool isLoggedIn;
//   const MyApp({required this.isLoggedIn, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SoulMate Connect',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         textTheme: const TextTheme(
//           bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//       ),
//       home: Home(isLoggedIn: isLoggedIn),
//     );
//   }
// }
