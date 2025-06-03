// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//
//   Future<void> _register() async {
//     if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
//       return; // Stop registration if form is invalid
//     }
//
//     String username = _usernameController.text.trim();
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//     String confirmPassword = _confirmPasswordController.text.trim();
//
//     if (password != confirmPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Passwords do not match"), backgroundColor: Colors.red),
//       );
//       return;
//     }
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('username', username);
//     await prefs.setString('registeredEmail', email);
//     await prefs.setString('registeredPassword', password);
//
//     // Show success message
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Registration successful! Redirecting to login..."), backgroundColor: Colors.green),
//     );
//
//     // Delay navigation to ensure Snackbar displays
//     Future.delayed(Duration(seconds: 1), () {
//       if (!mounted) return;
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // ✅ Prevents keyboard overflow
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(), // ✅ Adds smooth scrolling
//           child: Container(
//             height: MediaQuery.of(context).size.height, // ✅ Full height
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.pink.shade100, Colors.red.shade400],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Card(
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   color: Colors.white.withOpacity(0.9),
//                   child: Padding(
//                     padding: EdgeInsets.all(25),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           _buildTitle("Register"),
//                           SizedBox(height: 20),
//                           _buildTextField(_usernameController, "Username", Icons.person),
//                           SizedBox(height: 15),
//                           _buildTextField(_emailController, "Email", Icons.email, isEmail: true),
//                           SizedBox(height: 15),
//                           _buildPasswordField(_passwordController, "Password", _obscurePassword, (newValue) {
//                             setState(() => _obscurePassword = newValue);
//                           }),
//                           SizedBox(height: 15),
//                           _buildPasswordField(_confirmPasswordController, "Confirm Password", _obscureConfirmPassword, (newValue) {
//                             setState(() => _obscureConfirmPassword = newValue);
//                           }, mustMatchController: _passwordController),
//                           SizedBox(height: 25),
//                           _buildRegisterButton(),
//                           SizedBox(height: 15),
//                           _buildLoginText(),
//                         ],
//                       ),
//                     ),
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
//   /// 🛠 **Register Title**
//   Widget _buildTitle(String text) {
//     return Text(
//       text,
//       style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
//     );
//   }
//
//   /// 🛠 **General Input Field (for email, username)**
//   Widget _buildTextField(
//       TextEditingController controller,
//       String label,
//       IconData icon, {
//         bool isEmail = false,
//       }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) return "$label is required";
//         if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) return "Enter a valid email";
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: Colors.redAccent),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//           borderSide: BorderSide(color: Colors.redAccent),
//         ),
//       ),
//     );
//   }
//
//   /// 🛠 **Password Field with Show/Hide Functionality**
//   Widget _buildPasswordField(
//       TextEditingController controller,
//       String label,
//       bool obscureText,
//       Function(bool) toggleObscure, {
//         TextEditingController? mustMatchController,
//       }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) return "Field cannot be empty";
//         if (value.length < 6) return "Password must be at least 6 characters";
//         if (mustMatchController != null && value.trim() != mustMatchController.text.trim()) {
//           return "Passwords do not match";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(Icons.lock, color: Colors.redAccent),
//         suffixIcon: IconButton(
//           icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.redAccent),
//           onPressed: () => toggleObscure(!obscureText),
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//           borderSide: BorderSide(color: Colors.redAccent),
//         ),
//       ),
//     );
//   }
//
//   /// 🛠 **Register Button**
//   Widget _buildRegisterButton() {
//     return ElevatedButton(
//       onPressed: _register,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.redAccent,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//       ),
//       child: Text("Register", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
//     );
//   }
//
//   /// 🛠 **Already Registered? Login Text**
//   Widget _buildLoginText() {
//     return TextButton(
//       onPressed: () {
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//       },
//       child: Text(
//         "Already registered? Login",
//         style: GoogleFonts.poppins(fontSize: 14, color: Colors.redAccent),
//       ),
//     );
//   }
// }


//ui changes (22/02/2025)


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_screen.dart';
//
// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//
//   Future<void> _register() async {
//     if (!_formKey.currentState!.validate()) return; // Stop registration if form is invalid
//
//     String username = _usernameController.text.trim();
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // Prevent duplicate registrations
//     String? existingEmail = prefs.getString('registeredEmail');
//     if (existingEmail != null && existingEmail == email) {
//       _showMessage("Email is already registered!", Colors.red);
//       return;
//     }
//
//     await prefs.setString('username', username);
//     await prefs.setString('registeredEmail', email);
//     await prefs.setString('registeredPassword', password);
//
//     _showMessage("Registration successful! Redirecting to login...", Colors.green);
//
//     Future.delayed(Duration(seconds: 1), () {
//       if (!mounted) return;
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//     });
//   }
//
//   void _showMessage(String message, Color color) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message, style: TextStyle(color: Colors.white)),
//         backgroundColor: color,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // ✅ Prevents keyboard overflow
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.pink.shade100, Colors.red.shade400],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Card(
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   color: Colors.white.withOpacity(0.95),
//                   child: Padding(
//                     padding: EdgeInsets.all(25),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           _buildTitle("Register"),
//                           SizedBox(height: 20),
//                           _buildTextField(_usernameController, "Username", Icons.person),
//                           SizedBox(height: 15),
//                           _buildTextField(_emailController, "Email", Icons.email, isEmail: true),
//                           SizedBox(height: 15),
//                           _buildPasswordField(_passwordController, "Password", _obscurePassword, () {
//                             setState(() => _obscurePassword = !_obscurePassword);
//                           }),
//                           SizedBox(height: 15),
//                           _buildPasswordField(_confirmPasswordController, "Confirm Password", _obscureConfirmPassword, () {
//                             setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
//                           }, mustMatchController: _passwordController),
//                           SizedBox(height: 25),
//                           _buildRegisterButton(),
//                           SizedBox(height: 15),
//                           _buildLoginOption(),
//                         ],
//                       ),
//                     ),
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
//   // **🔹 Register Title**
//   Widget _buildTitle(String text) {
//     return Text(
//       text,
//       style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
//     );
//   }
//
//   // **🔹 Input Field for Username & Email**
//   Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isEmail = false}) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: Colors.redAccent),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
//       ),
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) return "$label is required";
//         if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) return "Enter a valid email";
//         return null;
//       },
//     );
//   }
//
//   // **🔹 Password & Confirm Password Field with Visibility Toggle**
//   Widget _buildPasswordField(
//       TextEditingController controller, String label, bool obscureText, VoidCallback toggleVisibility,
//       {TextEditingController? mustMatchController}) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(Icons.lock, color: Colors.redAccent),
//         suffixIcon: IconButton(
//           icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.redAccent),
//           onPressed: toggleVisibility,
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
//       ),
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) return "$label cannot be empty";
//         if (value.length < 6) return "Password must be at least 6 characters";
//         if (mustMatchController != null && value.trim() != mustMatchController.text.trim()) return "Passwords do not match";
//         return null;
//       },
//     );
//   }
//
//   // **🔹 Register Button**
//   Widget _buildRegisterButton() {
//     return ElevatedButton(
//       onPressed: _register,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.redAccent,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//       ),
//       child: Text("Register", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
//     );
//   }
//
//   // **🔹 Already Have an Account?**
//   Widget _buildLoginOption() {
//     return TextButton(
//       onPressed: () {
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//       },
//       child: Text(
//         "Already registered? Login",
//         style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.redAccent),
//       ),
//     );
//   }
// }


//ui changes (25/02/2025)


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Prevent duplicate registrations
    String? existingEmail = prefs.getString('registeredEmail');
    if (existingEmail != null && existingEmail == email) {
      _showMessage("Email is already registered!", Colors.red);
      return;
    }

    await prefs.setString('username', username);
    await prefs.setString('registeredEmail', email);
    await prefs.setString('registeredPassword', password);

    _showMessage("Registration successful! Redirecting to login...", Colors.green);

    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                          _buildTitle("Register"),
                          SizedBox(height: 20),
                          _buildTextField(_usernameController, "Username", Icons.person),
                          SizedBox(height: 15),
                          _buildTextField(_emailController, "Email", Icons.email, isEmail: true),
                          SizedBox(height: 15),
                          _buildPasswordField(_passwordController, "Password", _obscurePassword, () {
                            setState(() => _obscurePassword = !_obscurePassword);
                          }),
                          SizedBox(height: 15),
                          _buildPasswordField(_confirmPasswordController, "Confirm Password", _obscureConfirmPassword, () {
                            setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                          }, mustMatchController: _passwordController),
                          SizedBox(height: 25),
                          _buildRegisterButton(),
                          SizedBox(height: 15),
                          _buildLoginOption(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // **🔹 Register Title**
  Widget _buildTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFAD1457)),
    );
  }

  // **🔹 Input Field for Username & Email**
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isEmail = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
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
        if (value == null || value.trim().isEmpty) return "$label is required";
        if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) return "Enter a valid email";
        return null;
      },
    );
  }

  // **🔹 Password & Confirm Password Field with Visibility Toggle**
  Widget _buildPasswordField(
      TextEditingController controller, String label, bool obscureText, VoidCallback toggleVisibility,
      {TextEditingController? mustMatchController}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black87),
        prefixIcon: Icon(Icons.lock, color: Color(0xFFAD1457)),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Color(0xFFAD1457)),
          onPressed: toggleVisibility,
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
        if (value == null || value.trim().isEmpty) return "$label cannot be empty";
        if (value.length < 6) return "Password must be at least 6 characters";
        if (mustMatchController != null && value.trim() != mustMatchController.text.trim()) return "Passwords do not match";
        return null;
      },
    );
  }

  // **🔹 Register Button**
  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _register,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFAD1457), // 🔥 Updated Button Color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: Text("Register", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
    );
  }

  // **🔹 Already Have an Account?**
  Widget _buildLoginOption() {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Text(
        "Already registered? Login",
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFAD1457)),
      ),
    );
  }
}
