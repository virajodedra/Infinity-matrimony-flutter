// import 'package:flutter/material.dart';
//
// import 'about_us.dart';
// import 'add_user.dart';
// import 'dashboard.dart';
// import 'favourite_user.dart';
// import 'user_list.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Matrimonial App',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => DashboardScreen(),
//         '/userList': (context) => UserListPage(),
//         '/addUser': (context) => AddUserPage(),
//         '/favourites': (context) => FavoriteUsersPage(),
//         '/aboutUs': (context) => AboutUsScreen(),
//       },
//     );
//   }
// }
//
// class PlaceholderWidget extends StatelessWidget {
//   final String title;
//   PlaceholderWidget(this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(child: Text('$title Page Coming Soon!')),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:matrimony_app/ui/login_screen.dart';
// import 'package:matrimony_app/ui/navbar.dart';
// import 'package:matrimony_app/ui/splash_screen.dart';
//
// import 'cover_page.dart';
// import 'about_us.dart';
// import 'add_user.dart';
// import 'dashboard.dart';
// import 'favourite_user.dart';
// import 'user_list.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SoulMate Connect',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       initialRoute: '/', // Start with CoverPage
//       routes: {
//         '/': (context) => SplashScreen(),
//         '/login': (context) => LoginScreen(),
//         '/dashboard': (context) => Navbar(),
//         '/userList': (context) => UserListPage(),
//         '/addUser': (context) => AddUserPage(),
//         '/favourites': (context) => FavoriteUsersPage(),
//         '/aboutUs': (context) => AboutUsScreen(),
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:matrimony_app/ui/login_screen.dart';
// import 'package:matrimony_app/ui/navbar.dart';
// import 'package:matrimony_app/ui/splash_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'cover_page.dart';
// import 'about_us.dart';
// import 'add_user.dart';
// import 'dashboard.dart';
// import 'favourite_user.dart';
// import 'user_list.dart';
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
//   MyApp({required this.isLoggedIn});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SoulMate Connect',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       initialRoute: isLoggedIn ? '/dashboard' : '/login', // Check login state
//       routes: {
//         '/': (context) => SplashScreen(),
//         '/login': (context) => LoginScreen(),
//         '/dashboard': (context) => Navbar(),
//         '/userList': (context) => UserListPage(),
//         '/addUser': (context) => AddUserPage(),
//         '/favourites': (context) => FavoriteUsersPage(),
//         '/aboutUs': (context) => AboutUsScreen(),
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:matrimony/newmatrimony/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_user.dart';
import 'favorite_screen.dart';
import 'login_screen.dart';
import 'navbar.dart';
import 'user_list.dart';
import 'about_us.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoulMate Connect',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/_login': (context) => LoginScreen(),
        '/dashboard': (context) => Navbar(),
        '/userList': (context) => UserListPage(),
        '/addUser': (context) => AddUserPage(),
        '/favourites': (context) => FavoriteUsersPage(),
        '/aboutUs': (context) => Aboutus(),
      },
    );
  }
}
