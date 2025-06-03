// import 'package:flutter/material.dart';
// import 'package:matrimony_app/ui/navbar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'register_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//
//   // Future<void> _login() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     String? storedEmail = prefs.getString('registeredEmail');
//   //     String? storedPassword = prefs.getString('registeredPassword');
//   //
//   //     if (_emailController.text.trim() == storedEmail &&
//   //         _passwordController.text.trim() == storedPassword) {
//   //       await prefs.setBool('isLoggedIn', true);
//   //       if (!mounted) return;
//   //       Navigator.pushReplacementNamed(context, '/dashboard');
//   //     } else {
//   //       setState(() {
//   //         _showError("Invalid email or password!");
//   //       });
//   //     }
//   //   }
//   // }
//
//   Future<void> _login() async {
//     if (!_formKey.currentState!.validate()) {
//       return; // Prevent login if form is invalid
//     }
//
//     String input = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? storedEmail = prefs.getString('registeredEmail');
//     String? storedUsername = prefs.getString('username');
//     String? storedPassword = prefs.getString('registeredPassword');
//
//     if ((input == storedEmail || input == storedUsername) && password == storedPassword) {
//       await prefs.setBool('isLoggedIn', true);
//       if (!mounted) return;
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navbar()));
//     } else {
//       _showMessage("Invalid email/username or password");
//     }
//   }
//
//   void _showMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message, style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }
//
//   // void _showError(String message) {
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     SnackBar(content: Text(message, style: TextStyle(color: Colors.white)), backgroundColor: Colors.redAccent),
//   //   );
//   // }
//
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
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Card(
//               elevation: 10,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//               color: Colors.white.withOpacity(0.9),
//               child: Padding(
//                 padding: EdgeInsets.all(25),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "Login",
//                         style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
//                       ),
//                       SizedBox(height: 20),
//                       _buildTextField(_emailController, "Email", Icons.email, "Enter a valid email", isEmail: true),
//                       SizedBox(height: 15),
//                       _buildTextField(_passwordController, "Password", Icons.lock, "Enter a valid password",
//                           obscureText: _obscurePassword, minLength: 6, isPassword: true),
//                       SizedBox(height: 25),
//                       ElevatedButton(
//                         onPressed: _login,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                         ),
//                         child: Text("Login", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
//                       ),
//                       SizedBox(height: 15),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => RegisterScreen()),
//                           );
//                         },
//                         child: Text("Don't have an account? Register",
//                             style: GoogleFonts.poppins(fontSize: 14, color: Colors.redAccent)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(
//       TextEditingController controller,
//       String hint,
//       IconData icon,
//       String validationMessage, {
//         bool obscureText = false,
//         bool isEmail = false,
//         int minLength = 1,
//         bool isPassword = false,
//       }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) return validationMessage;
//         if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) return "Enter a valid email format";
//         if (!isEmail && value.trim().length < minLength) return "Password must be at least $minLength characters";
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: hint,
//         prefixIcon: Icon(icon, color: Colors.redAccent),
//         suffixIcon: isPassword
//             ? IconButton(
//           icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.redAccent),
//           onPressed: () {
//             setState(() {
//               _obscurePassword = !_obscurePassword;
//             });
//           },
//         )
//             : null,
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//           borderSide: BorderSide(color: Colors.redAccent),
//         ),
//       ),
//     );
//   }
// }


//ui changes (22/02/2025)


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:matrimony_app/ui/navbar.dart';
// import 'register_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//
//   Future<void> _login() async {
//     if (!_formKey.currentState!.validate()) return; // Stop login if form is invalid
//
//     String input = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? storedEmail = prefs.getString('registeredEmail');
//     String? storedUsername = prefs.getString('username');
//     String? storedPassword = prefs.getString('registeredPassword');
//
//     if ((input == storedEmail || input == storedUsername) && password == storedPassword) {
//       await prefs.setBool('isLoggedIn', true);
//       if (!mounted) return;
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navbar()));
//     } else {
//       _showMessage("Invalid email/username or password");
//     }
//   }
//
//   void _showMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message, style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }
//
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
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Card(
//               elevation: 10,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//               color: Colors.white.withOpacity(0.95),
//               child: Padding(
//                 padding: EdgeInsets.all(25),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "Login",
//                         style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
//                       ),
//                       SizedBox(height: 20),
//                       _buildTextField(_emailController, "Email or Username", Icons.email, isEmail: true),
//                       SizedBox(height: 15),
//                       _buildPasswordField(),
//                       SizedBox(height: 25),
//                       _buildLoginButton(),
//                       SizedBox(height: 15),
//                       _buildRegisterOption(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller, String hint, IconData icon, {bool isEmail = false}) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
//       decoration: InputDecoration(
//         labelText: hint,
//         prefixIcon: Icon(icon, color: Colors.redAccent),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
//       ),
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) return "Please enter your $hint";
//         if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim()) && value.trim().contains('@'))
//           return "Enter a valid email format";
//         return null;
//       },
//     );
//   }
//
//   Widget _buildPasswordField() {
//     return TextFormField(
//       controller: _passwordController,
//       obscureText: _obscurePassword,
//       decoration: InputDecoration(
//         labelText: "Password",
//         prefixIcon: Icon(Icons.lock, color: Colors.redAccent),
//         suffixIcon: IconButton(
//           icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.redAccent),
//           onPressed: () {
//             setState(() {
//               _obscurePassword = !_obscurePassword;
//             });
//           },
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
//       ),
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) return "Please enter your password";
//         if (value.trim().length < 6) return "Password must be at least 6 characters";
//         return null;
//       },
//     );
//   }
//
//   Widget _buildLoginButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: _login,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.redAccent,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//         ),
//         child: Text("Login", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
//       ),
//     );
//   }
//
//   Widget _buildRegisterOption() {
//     return TextButton(
//       onPressed: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
//       },
//       child: Text("Don't have an account? Register",
//           style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.redAccent)),
//     );
//   }
// }


//ui changes (25/02/2025)

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony/newmatrimony/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    String input = _emailController.text.trim();
    String password = _passwordController.text.trim();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('registeredEmail');
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('registeredPassword');

    if ((input == storedEmail || input == storedUsername) && password == storedPassword) {
      await prefs.setBool('isLoggedIn', true);
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navbar()));
    } else {
      _showMessage("Invalid email/username or password");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD1457), Color(0xFFF06292)], // 🔥 Updated Gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.white.withOpacity(0.95),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFAD1457)),
                      ),
                      SizedBox(height: 20),
                      _buildTextField(_emailController, "Email or Username", Icons.email, isEmail: true),
                      SizedBox(height: 15),
                      _buildPasswordField(),
                      SizedBox(height: 25),
                      _buildLoginButton(),
                      SizedBox(height: 15),
                      _buildRegisterOption(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon, {bool isEmail = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: TextStyle(color: Colors.black87),
        prefixIcon: Icon(icon, color: Color(0xFFAD1457)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Color(0xFFAD1457), width: 1.5), // 🔥 Updated Border Color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Color(0xFFAD1457), width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) return "Please enter your $hint";
        if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim()) && value.trim().contains('@'))
          return "Enter a valid email format";
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.black87),
        prefixIcon: Icon(Icons.lock, color: Color(0xFFAD1457)),
        suffixIcon: IconButton(
          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Color(0xFFAD1457)),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Color(0xFFAD1457), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Color(0xFFAD1457), width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) return "Please enter your password";
        if (value.trim().length < 6) return "Password must be at least 6 characters";
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFAD1457), // 🔥 Updated Button Color
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        child: Text("Login", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  Widget _buildRegisterOption() {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
      },
      child: Text(
        "Don't have an account? Register",
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFAD1457)),
      ),
    );
  }
}
