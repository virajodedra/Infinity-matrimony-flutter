// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'api/apiservice.dart';
// import 'database.dart';
// import 'dropdown.dart'; // Ensure DropdownData is correctly populated
// import 'navbar.dart';
// import 'user_class.dart';
//
// class AddUserPage extends StatefulWidget {
//   @override
//   _AddUserPageState createState() => _AddUserPageState();
// }
//
// class _AddUserPageState extends State<AddUserPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   ApiService apiService = ApiService();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController religionController = TextEditingController();
//   TextEditingController casteController = TextEditingController();
//   TextEditingController subCasteController = TextEditingController();
//   TextEditingController educationController = TextEditingController();
//   TextEditingController occupationController = TextEditingController();
//
//   String? gender;
//   String? maritalStatus;
//   String? selectedCountry;
//   String? selectedState;
//   String? selectedCity;
//   DateTime? selectedDate;
//   bool isFavorite = false; // Adding the favorite flag
//
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime today = DateTime.now();
//     DateTime minDate = DateTime(today.year - 80, today.month, today.day);
//     DateTime maxDate = DateTime(today.year - 18, today.month, today.day);
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? maxDate,
//       firstDate: minDate,
//       lastDate: maxDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         dobController.text = DateFormat('yyyy-MM-dd').format(picked); // Format date correctly
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add User',
//             style: GoogleFonts.poppins(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white)),
//         backgroundColor: Color(0xFFAD1457),
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildSectionHeader("Personal Information", Icons.person),
//                 _buildInputField(
//                   controller: nameController,
//                   label: "Full Name",
//                   icon: Icons.person_outline,
//                   validator: (value) =>
//                   value!.isEmpty ? 'Please enter name' : null,
//                   maxLength: 50,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
//                   ],
//                 ),
//                 _buildDropdownField(
//                   value: gender,
//                   items: DropdownData.genders,
//                   onChanged: (value) => setState(() => gender = value),
//                   label: "Gender",
//                   icon: Icons.wc,
//                 ),
//                 _buildDateField(
//                   controller: dobController,
//                   label: "Date of Birth",
//                   onTap: () => _selectDate(context),
//                 ),
//                 _buildDropdownField(
//                   value: maritalStatus,
//                   items: DropdownData.maritalStatus,
//                   onChanged: (value) => setState(() => maritalStatus = value),
//                   label: "Marital Status",
//                   icon: Icons.favorite,
//                 ),
//                 _buildSectionHeader("Contact Information", Icons.contact_mail),
//                 _buildLocationDropdowns(),
//                 _buildInputField(
//                   controller: emailController,
//                   label: "Email Address",
//                   icon: Icons.email_outlined,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null ||
//                         value.isEmpty ||
//                         !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
//                             .hasMatch(value)) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 _buildInputField(
//                   controller: phoneController,
//                   label: "Phone Number",
//                   icon: Icons.phone_outlined,
//                   keyboardType: TextInputType.number,
//                   maxLength: 10,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(10)
//                   ],
//                   validator: (value) {
//                     if (value == null ||
//                         value.length != 10 ||
//                         !RegExp(r"^[0-9]{10}").hasMatch(value)) {
//                       return 'Please enter a valid 10-digit phone number';
//                     }
//                     return null;
//                   },
//                 ),
//                 _buildSectionHeader("Other Details", Icons.more_horiz),
//                 _buildDropdownField(
//                   value: religionController.text.isEmpty
//                       ? null
//                       : religionController.text,
//                   items: DropdownData.religions.toSet().toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       religionController.text = value!;
//                       casteController.clear(); // Reset caste and sub-caste when religion changes
//                       subCasteController.clear();
//                     });
//                   },
//                   label: "Religion",
//                   icon: Icons.church,
//                 ),
//
//                 // _buildDropdownField(
//                 //   value: casteController.text.isEmpty ? null : casteController.text,
//                 //   items: DropdownData.casteMap[religionController.text]?.toSet().toList() ?? [],
//                 //   onChanged: (value) {
//                 //     setState(() {
//                 //       casteController.text = value!;
//                 //       subCasteController.clear(); // Reset sub-caste when caste changes
//                 //     });
//                 //   },
//                 //   label: "Caste",
//                 //   icon: Icons.group,
//                 // ),
//                 _buildDropdownField(
//                   value: gender,
//                   items: DropdownData.genders,
//                   onChanged: (value) => setState(() => gender = value),
//                   label: "Gender",
//                   icon: Icons.wc,
//                 ),
//
//                 _buildDropdownField(
//                   value: subCasteController.text.isEmpty ? null : subCasteController.text,
//                   items: DropdownData.subCasteMap[casteController.text] ?? [],
//                   onChanged: (value) => setState(() => subCasteController.text = value!),
//                   label: "Sub-Caste",
//                   icon: Icons.people,
//                 ),
//
//                 _buildDropdownField(
//                   value: educationController.text.isEmpty ? null : educationController.text,
//                   items: DropdownData.higherEducation,
//                   onChanged: (value) => setState(() => educationController.text = value!),
//                   label: "Higher Education",
//                   icon: Icons.school,
//                 ),
//
//                 _buildDropdownField(
//                   value: occupationController.text.isEmpty ? null : occupationController.text,
//                   items: DropdownData.occupations,
//                   onChanged: (value) => setState(() => occupationController.text = value!),
//                   label: "Occupation",
//                   icon: Icons.work,
//                 ),
//                 SizedBox(height: 32),
//                 _buildSubmitButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionHeader(String title, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.redAccent.shade400, size: 24),
//           SizedBox(width: 10),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.redAccent.shade400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInputField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//     String? Function(String?)? validator,
//     int? maxLength,
//     VoidCallback? onTap,
//     bool readOnly = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: Colors.redAccent.shade200),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.redAccent.shade200),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.redAccent.shade200),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2),
//           ),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         ),
//         keyboardType: keyboardType,
//         inputFormatters: inputFormatters,
//         validator: validator,
//         maxLength: maxLength,
//         onTap: onTap,
//         readOnly: readOnly,
//         style: GoogleFonts.poppins(),
//       ),
//     );
//   }
//
//   // Widget _buildDropdownField(
//   //     {required String? value,
//   //       required List<String> items,
//   //       required Function(String?) onChanged,
//   //       required String label,
//   //       required IconData icon}) {
//   //   return Padding(
//   //     padding: const EdgeInsets.only(bottom: 16.0),
//   //     child: DropdownButtonFormField<String>(
//   //       value: value,
//   //       onChanged: onChanged,
//   //       decoration: InputDecoration(
//   //           labelText: label,
//   //           prefixIcon: Icon(icon, color: Colors.redAccent.shade200),
//   //           border:
//   //           OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
//   //       items: items
//   //           .map((String value) =>
//   //           DropdownMenuItem<String>(value: value, child: Text(value)))
//   //           .toList(),
//   //     ),
//   //   );
//   // }
//   Widget _buildDropdownField({
//     required String? value,
//     required List<String> items,
//     required Function(String?) onChanged,
//     required String label,
//     required IconData icon,
//     String? Function(String?)? validator, // Add validator parameter
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         onChanged: onChanged,
//         validator: validator ?? (value) => value == null ? 'Please select $label' : null, // Default validator
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: Colors.redAccent.shade200),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//         ),
//         items: items.map((String value) => DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         )).toList(),
//       ),
//     );
//   }
//
//   Widget _buildDateField({
//     required TextEditingController controller,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: GestureDetector(
//         onTap: onTap,
//         child: AbsorbPointer(
//           child: _buildInputField(
//             controller: controller,
//             label: label,
//             icon: Icons.calendar_today_outlined,
//             readOnly: true,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLocationDropdowns() {
//     return Column(
//       children: [
//         _buildDropdownField(
//           value: selectedCountry,
//           items: DropdownData.countries,
//           onChanged: (value) => setState(() {
//             selectedCountry = value;
//             selectedState = null;
//             selectedCity = null;
//           }),
//           label: "Country",
//           icon: Icons.flag,
//         ),
//         _buildDropdownField(
//           value: selectedState,
//           items: DropdownData.countryStateMap[selectedCountry ?? ''] ?? [],
//           onChanged: (value) => setState(() {
//             selectedState = value;
//             selectedCity = null;
//           }),
//           label: "State",
//           icon: Icons.location_on,
//         ),
//         _buildDropdownField(
//           value: selectedCity,
//           items: DropdownData.stateCityMap[selectedState ?? ''] ?? [],
//           onChanged: (value) => setState(() => selectedCity = value),
//           label: "City",
//           icon: Icons.location_city,
//         ),
//       ],
//     );
//   }
//
//   // Widget _buildSubmitButton() {
//   //   return Center(
//   //     child: ElevatedButton(
//   //       onPressed: () async {
//   //         if (_formKey.currentState!.validate()) {
//   //           final newUser = User(
//   //             name: nameController.text,
//   //             gender: gender,
//   //             dob: selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate!) : null, // Fix the stored format
//   //             maritalStatus: maritalStatus,
//   //             country: selectedCountry,
//   //             state: selectedState,
//   //             city: selectedCity,
//   //             email: emailController.text,
//   //             phone: phoneController.text,
//   //             religion: religionController.text,
//   //             caste: casteController.text,
//   //             subCaste: subCasteController.text,
//   //             education: educationController.text,
//   //             occupation: occupationController.text,
//   //             isFavorite: isFavorite,
//   //           );
//   //
//   //           // await DatabaseHelper.instance.insertUser(newUser);
//   //           apiService.createUser(newUser.toJson());
//   //           Navigator.pushReplacement(
//   //             context,
//   //             MaterialPageRoute(
//   //               builder: (context) => Navbar(initialIndex: 1), // Go to User List Tab
//   //             ),
//   //           );
//   //         }
//   //       },
//   //       style: ElevatedButton.styleFrom(
//   //           backgroundColor: Colors.redAccent.shade400),
//   //       child: Text('Add User',
//   //           style: GoogleFonts.poppins(
//   //               fontSize: 18,
//   //               fontWeight: FontWeight.bold,
//   //               color: Colors.white)),
//   //     ),
//   //   );
//   // }
//   Widget _buildSubmitButton() {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           if (_formKey.currentState!.validate()) {
//             final newUser = User(
//               name: nameController.text,
//               gender: gender,
//               dob: selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate!) : null,
//               maritalStatus: maritalStatus,
//               country: selectedCountry,
//               state: selectedState,
//               city: selectedCity,
//               email: emailController.text,
//               phone: phoneController.text,
//               religion: religionController.text,
//               caste: casteController.text,
//               subCaste: subCasteController.text,
//               education: educationController.text,
//               occupation: occupationController.text,
//               isFavorite: isFavorite ? 1 : 0, // Convert bool to int
//             );
//
//             try {
//               // Show loading indicator
//               showDialog(
//                 context: context,
//                 barrierDismissible: false,
//                 builder: (context) => Center(child: CircularProgressIndicator()),
//               );
//
//               await apiService.createUser(newUser); // Await the API call
//               Navigator.pop(context); // Dismiss loading dialog
//
//               // Navigate to User List tab on success
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Navbar(initialIndex: 1),
//                 ),
//               );
//             } catch (e) {
//               Navigator.pop(context); // Dismiss loading dialog on error
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Failed to add user: $e')),
//               );
//             }
//           }
//         },
//         style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent.shade400),
//         child: Text(
//           'Add User',
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'api/apiservice.dart';
import 'dropdown.dart';
import 'navbar.dart';
import 'user_class.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // State variables for dropdowns
  String? gender;
  String? maritalStatus;
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  String? religion;
  String? caste;
  String? subCaste;
  String? education;
  String? occupation;
  DateTime? selectedDate;
  bool isFavorite = false;

  Future<void> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime minDate = DateTime(today.year - 80, today.month, today.day);
    DateTime maxDate = DateTime(today.year - 18, today.month, today.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? maxDate,
      firstDate: minDate,
      lastDate: maxDate,
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
        backgroundColor: Color(0xFFAD1457),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader("Personal Information", Icons.person),
                _buildInputField(
                  controller: nameController,
                  label: "Full Name",
                  icon: Icons.person_outline,
                  validator: (value) => value!.isEmpty ? 'Please enter name' : null,
                  maxLength: 50,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))],
                ),
                _buildDropdownField(
                  value: gender,
                  items: DropdownData.genders,
                  onChanged: (value) => setState(() => gender = value),
                  label: "Gender",
                  icon: Icons.wc,
                ),
                _buildDateField(
                  controller: dobController,
                  label: "Date of Birth",
                  onTap: () => _selectDate(context),
                ),
                _buildDropdownField(
                  value: maritalStatus,
                  items: DropdownData.maritalStatus,
                  onChanged: (value) => setState(() => maritalStatus = value),
                  label: "Marital Status",
                  icon: Icons.favorite,
                ),
                _buildSectionHeader("Contact Information", Icons.contact_mail),
                _buildLocationDropdowns(),
                _buildInputField(
                  controller: emailController,
                  label: "Email Address",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                _buildInputField(
                  controller: phoneController,
                  label: "Phone Number",
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                  validator: (value) {
                    if (value == null || value.length != 10 || !RegExp(r"^[0-9]{10}").hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                _buildSectionHeader("Other Details", Icons.more_horiz),
                _buildDropdownField(
                  value: religion,
                  items: DropdownData.religions.toSet().toList(),
                  onChanged: (value) => setState(() {
                    religion = value;
                    caste = null;
                    subCaste = null;
                  }),
                  label: "Religion",
                  icon: Icons.church,
                ),
                _buildDropdownField(
                  value: caste,
                  items: DropdownData.casteMap[religion ?? '']?.toSet().toList() ?? [],
                  onChanged: (value) => setState(() {
                    caste = value;
                    subCaste = null;
                  }),
                  label: "Caste",
                  icon: Icons.group,
                ),
                _buildDropdownField(
                  value: subCaste,
                  items: DropdownData.subCasteMap[caste ?? ''] ?? [],
                  onChanged: (value) => setState(() => subCaste = value),
                  label: "Sub-Caste",
                  icon: Icons.people,
                ),
                _buildDropdownField(
                  value: education,
                  items: DropdownData.higherEducation,
                  onChanged: (value) => setState(() => education = value),
                  label: "Higher Education",
                  icon: Icons.school,
                ),
                _buildDropdownField(
                  value: occupation,
                  items: DropdownData.occupations,
                  onChanged: (value) => setState(() => occupation = value),
                  label: "Occupation",
                  icon: Icons.work,
                ),
                SizedBox(height: 32),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.redAccent.shade400, size: 24),
          SizedBox(width: 10),
          Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent.shade400)),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    int? maxLength,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.redAccent.shade200),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.redAccent.shade200)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.redAccent.shade200)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        maxLength: maxLength,
        onTap: onTap,
        readOnly: readOnly,
        style: GoogleFonts.poppins(),
      ),
    );
  }

  Widget _buildDropdownField({
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        validator: validator ?? (value) => value == null ? 'Please select $label' : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.redAccent.shade200),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        items: items.map((String value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList(),
      ),
    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: AbsorbPointer(
          child: _buildInputField(
            controller: controller,
            label: label,
            icon: Icons.calendar_today_outlined,
            readOnly: true,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationDropdowns() {
    return Column(
      children: [
        _buildDropdownField(
          value: selectedCountry,
          items: DropdownData.countries,
          onChanged: (value) => setState(() {
            selectedCountry = value;
            selectedState = null;
            selectedCity = null;
          }),
          label: "Country",
          icon: Icons.flag,
        ),
        _buildDropdownField(
          value: selectedState,
          items: DropdownData.countryStateMap[selectedCountry ?? ''] ?? [],
          onChanged: (value) => setState(() {
            selectedState = value;
            selectedCity = null;
          }),
          label: "State",
          icon: Icons.location_on,
        ),
        _buildDropdownField(
          value: selectedCity,
          items: DropdownData.stateCityMap[selectedState ?? ''] ?? [],
          onChanged: (value) => setState(() => selectedCity = value),
          label: "City",
          icon: Icons.location_city,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final newUser = User(
              name: nameController.text,
              gender: gender,
              dob: selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate!) : null,
              maritalStatus: maritalStatus,
              country: selectedCountry,
              state: selectedState,
              city: selectedCity,
              email: emailController.text,
              phone: phoneController.text,
              religion: religion,
              caste: caste,
              subCaste: subCaste,
              education: education,
              occupation: occupation,
              isFavorite: isFavorite ? 1 : 0,
            );

            try {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(child: CircularProgressIndicator()),
              );

              await apiService.createUser(newUser);
              Navigator.pop(context); // Dismiss loading dialog

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Navbar(initialIndex: 1)),
              );
            } catch (e) {
              Navigator.pop(context); // Dismiss loading dialog on error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to add user: $e')),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent.shade400),
        child: Text(
          'Add User',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}