// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// import 'user_class.dart';
//
// class EditUserPage extends StatefulWidget {
//   final User user;
//
//   EditUserPage({required this.user});
//
//   @override
//   _EditUserPageState createState() => _EditUserPageState();
// }
//
// class _EditUserPageState extends State<EditUserPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController cityController = TextEditingController(); // Added city controller
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
//
//   // Country, State, and City Data
//   final Map<String, List<String>> countryStateMap = {
//     'USA': ['California', 'Texas', 'New York', 'Florida', 'Illinois'],
//     'India': ['Maharashtra', 'Karnataka', 'Tamil Nadu', 'Delhi', 'Gujarat'],
//     'Canada': ['Ontario', 'Quebec', 'British Columbia', 'Alberta', 'Manitoba'],
//     'UK': ['England', 'Scotland', 'Wales', 'Northern Ireland'],
//     'Australia': ['New South Wales', 'Victoria', 'Queensland', 'Western Australia', 'South Australia'],
//   };
//
//   final Map<String, List<String>> stateCityMap = {
//     'California': ['Los Angeles', 'San Francisco', 'San Diego', 'Sacramento', 'San Jose'],
//     'Texas': ['Houston', 'Dallas', 'Austin', 'San Antonio', 'Fort Worth'],
//     'New York': ['New York City', 'Buffalo', 'Rochester', 'Albany', 'Syracuse'],
//     'Florida': ['Miami', 'Orlando', 'Tampa', 'Jacksonville', 'Fort Lauderdale'],
//     'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik', 'Aurangabad'],
//     'Karnataka': ['Bangalore', 'Mysore', 'Mangalore', 'Hubli', 'Belgaum'],
//     'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai', 'Tiruchirappalli', 'Salem'],
//     'Delhi': ['New Delhi', 'Rohini', 'Dwarka', 'Karol Bagh', 'Pitampura'],
//     'Gujarat': ['Ahmedabad', 'Surat', 'Rajkot', 'Porbandar', 'Junagadh'],
//     'Ontario': ['Toronto', 'Ottawa', 'Mississauga', 'Brampton', 'Hamilton'],
//     'Quebec': ['Montreal', 'Quebec City', 'Laval', 'Gatineau', 'Sherbrooke'],
//     'British Columbia': ['Vancouver', 'Victoria', 'Surrey', 'Burnaby', 'Richmond'],
//     'England': ['London', 'Manchester', 'Birmingham', 'Liverpool', 'Bristol'],
//     'Scotland': ['Edinburgh', 'Glasgow', 'Aberdeen', 'Dundee', 'Inverness'],
//     'Wales': ['Cardiff', 'Swansea', 'Newport', 'Wrexham', 'Bangor'],
//     'Northern Ireland': ['Belfast', 'Derry', 'Lisburn', 'Newtownabbey', 'Bangor'],
//     'New South Wales': ['Sydney', 'Newcastle', 'Wollongong', 'Tamworth', 'Gosford'],
//     'Victoria': ['Melbourne', 'Geelong', 'Ballarat', 'Bendigo', 'Shepparton'],
//     'Queensland': ['Brisbane', 'Gold Coast', 'Cairns', 'Townsville', 'Rockhampton'],
//     'Western Australia': ['Perth', 'Mandurah', 'Bunbury', 'Geraldton', 'Albany'],
//     'South Australia': ['Adelaide', 'Mount Gambier', 'Whyalla', 'Murray Bridge', 'Port Augusta'],
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.user.name ?? '';
//     dobController.text = widget.user.dob ?? '';
//     emailController.text = widget.user.email ?? '';
//     phoneController.text = widget.user.phone ?? '';
//     countryController.text = widget.user.country ?? '';
//     stateController.text = widget.user.state ?? '';
//     religionController.text = widget.user.religion ?? '';
//     casteController.text = widget.user.caste ?? '';
//     subCasteController.text = widget.user.subCaste ?? '';
//     educationController.text = widget.user.education ?? '';
//     occupationController.text = widget.user.occupation ?? '';
//     gender = widget.user.gender;
//     maritalStatus = widget.user.maritalStatus;
//
//     selectedCountry = widget.user.country;
//     selectedState = widget.user.state;
//     selectedCity = widget.user.city;
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime today = DateTime.now();
//     DateTime minDate = today.subtract(Duration(days: 80 * 365)); // 80 years ago
//     DateTime maxDate = today.subtract(Duration(days: 18 * 365)); // 18 years ago
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? maxDate,
//       firstDate: minDate, // Ensure the user can't pick a date older than 80 years ago
//       lastDate: maxDate, // Ensure the user can't pick a date younger than 18 years ago
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit User', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
//         backgroundColor: Colors.redAccent,
//         elevation: 5,
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.red.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Personal Information", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent)),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       labelText: "Name",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     maxLength: 50,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
//                     ],
//                     validator: (value) => value!.isEmpty ? 'Please enter name' : null,
//                   ),
//                   SizedBox(height: 15),
//                   DropdownButtonFormField<String>(
//                     value: gender,
//                     items: ['Male', 'Female', 'Other']
//                         .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         gender = value;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       labelText: "Gender",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     validator: (value) => value == null ? 'Please select gender' : null,
//                   ),
//                   SizedBox(height: 15),
//                   TextFormField(
//                     controller: dobController,
//                     readOnly: true,
//                     onTap: () => _selectDate(context),
//                     decoration: InputDecoration(
//                       labelText: "Date of Birth",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select Date of Birth';
//                       }
//                       DateTime dob = DateFormat('yyyy-MM-dd').parse(value);
//                       DateTime today = DateTime.now();
//                       int age = today.year - dob.year;
//                       if (dob.isAfter(today.subtract(Duration(days: age * 365)))) {
//                         age--;
//                       }
//                       if (age < 18) {
//                         return 'Age must be at least 18 years';
//                       } else if (age > 80) {
//                         return 'Age cannot be more than 80 years';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 15),
//                   DropdownButtonFormField<String>(
//                     value: maritalStatus,
//                     items: ['Single', 'Married', 'Divorced', 'Widowed']
//                         .map((status) => DropdownMenuItem(value: status, child: Text(status)))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         maritalStatus = value;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       labelText: "Marital Status",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     validator: (value) => value == null ? 'Please select marital status' : null,
//                   ),
//                   SizedBox(height: 25),
//                   Text("Contact Information", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent)),
//                   SizedBox(height: 10),
//                   DropdownButtonFormField<String>(
//                     value: selectedCountry,
//                     items: countryStateMap.keys
//                         .map((country) => DropdownMenuItem(value: country, child: Text(country)))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCountry = value;
//                         selectedState = null; // Reset state selection
//                         selectedCity = null;  // Reset city selection
//                       });
//                     },
//                     decoration: InputDecoration(
//                       labelText: "Country",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   if (selectedCountry != null)
//                     DropdownButtonFormField<String>(
//                       value: selectedState,
//                       items: countryStateMap[selectedCountry]!
//                           .map((state) => DropdownMenuItem(value: state, child: Text(state)))
//                           .toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           selectedState = value;
//                           selectedCity = null; // Reset city selection
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: "State",
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                     ),
//                   SizedBox(height: 15),
//                   if (selectedState != null)
//                     DropdownButtonFormField<String>(
//                       value: selectedCity,
//                       items: stateCityMap[selectedState]!
//                           .map((city) => DropdownMenuItem(value: city, child: Text(city)))
//                           .toList(),
//                       onChanged: (value) => setState(() => selectedCity = value),
//                       decoration: InputDecoration(
//                         labelText: "City",
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                     ),
//                   SizedBox(height: 15),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       labelText: "Email",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 15),
//                   TextFormField(
//                     controller: phoneController,
//                     decoration: InputDecoration(
//                       labelText: "Phone",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly, // Allow only numbers
//                     ],
//                     keyboardType: TextInputType.number,
//                     maxLength: 10,
//                     validator: (value) {
//                       if (value == null || value.length != 10 || !RegExp(r"^[0-9]{10}").hasMatch(value)) {
//                         return 'Please enter a valid 10-digit phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 25),
//                   Text("Other Details", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent)),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: religionController,
//                     decoration: InputDecoration(
//                       labelText: "Religion",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     validator: (value) => value!.isEmpty ? 'Please enter religion' : null,
//                   ),
//                   SizedBox(height: 15),
//                   TextFormField(
//                     controller: casteController,
//                     decoration: InputDecoration(
//                       labelText: "Caste",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     validator: (value) => value!.isEmpty ? 'Please enter caste' : null,
//                   ),
//                   SizedBox(height: 15),
//                   TextFormField(
//                     controller: subCasteController,
//                     decoration: InputDecoration(
//                       labelText: "Sub Caste",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     validator: (value) => value!.isEmpty ? 'Please enter sub caste' : null,
//                   ),
//                   SizedBox(height: 15),
//                   TextFormField(
//                     controller: educationController,
//                     decoration: InputDecoration(
//                       labelText: "Higher Education",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     validator: (value) => value!.isEmpty ? 'Please enter education' : null,
//                   ),
//                   SizedBox(height: 15),
//                   TextFormField(
//                     controller: occupationController,
//                     decoration: InputDecoration(
//                       labelText: "Occupation",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                     validator: (value) => value!.isEmpty ? 'Please enter occupation' : null,
//                   ),
//                   SizedBox(height: 32),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Update the user data
//                         widget.user.name = nameController.text;
//                         widget.user.dob = dobController.text;
//                         widget.user.gender = gender;
//                         widget.user.maritalStatus = maritalStatus;
//                         widget.user.country = selectedCountry;
//                         widget.user.state = selectedState;
//                         widget.user.city = selectedCity;
//                         widget.user.religion = religionController.text;
//                         widget.user.caste = casteController.text;
//                         widget.user.subCaste = subCasteController.text;
//                         widget.user.education = educationController.text;
//                         widget.user.occupation = occupationController.text;
//                         widget.user.email = emailController.text;
//                         widget.user.phone = phoneController.text;
//
//                         // Return the updated user to the previous page
//                         Navigator.pop(context, widget.user);
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       backgroundColor: Colors.redAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: Text(
//                       'Save Changes',
//                       style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// import 'database_helper.dart';
// import 'user_class.dart';
//
// class EditUserPage extends StatefulWidget {
//   final User user;
//
//   EditUserPage({required this.user});
//
//   @override
//   _EditUserPageState createState() => _EditUserPageState();
// }
//
// class _EditUserPageState extends State<EditUserPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   late TextEditingController nameController;
//   late TextEditingController dobController;
//   late TextEditingController emailController;
//   late TextEditingController phoneController;
//   late TextEditingController countryController;
//   late TextEditingController stateController;
//   late TextEditingController cityController;
//   late TextEditingController religionController;
//   late TextEditingController casteController;
//   late TextEditingController subCasteController;
//   late TextEditingController educationController;
//   late TextEditingController occupationController;
//
//   String? gender;
//   String? maritalStatus;
//   String? selectedCountry;
//   String? selectedState;
//   String? selectedCity;
//   DateTime? selectedDate;
//
//   final Map<String, List<String>> countryStateMap = {
//     'USA': ['California', 'Texas', 'New York', 'Florida', 'Illinois'],
//     'India': ['Maharashtra', 'Karnataka', 'Tamil Nadu', 'Delhi', 'Gujarat'],
//     'Canada': ['Ontario', 'Quebec', 'British Columbia', 'Alberta', 'Manitoba'],
//     'UK': ['England', 'Scotland', 'Wales', 'Northern Ireland', 'Northern England'], // Added Northern England
//     'Australia': ['New South Wales', 'Victoria', 'Queensland', 'Western Australia', 'South Australia'],
//   };
//
//   final Map<String, List<String>> stateCityMap = {
//     // USA
//     'California': ['Los Angeles', 'San Francisco', 'San Diego', 'Sacramento', 'San Jose'],
//     'Texas': ['Houston', 'Dallas', 'Austin', 'San Antonio', 'Fort Worth'],
//     'New York': ['New York City', 'Buffalo', 'Rochester', 'Albany', 'Syracuse'],
//     'Florida': ['Miami', 'Orlando', 'Tampa', 'Jacksonville', 'Fort Lauderdale'],
//     'Illinois': ['Chicago', 'Springfield', 'Peoria', 'Naperville', 'Rockford'],
//
//     // India
//     'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik', 'Aurangabad'],
//     'Karnataka': ['Bangalore', 'Mysore', 'Mangalore', 'Hubli', 'Belgaum'],
//     'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai', 'Tiruchirappalli', 'Salem'],
//     'Delhi': ['New Delhi', 'Rohini', 'Dwarka', 'Karol Bagh', 'Pitampura'],
//     'Gujarat': ['Ahmedabad', 'Surat', 'Rajkot', 'Porbandar', 'Junagadh'],
//
//     // Canada
//     'Ontario': ['Toronto', 'Ottawa', 'Mississauga', 'Brampton', 'Hamilton'],
//     'Quebec': ['Montreal', 'Quebec City', 'Laval', 'Gatineau', 'Sherbrooke'],
//     'British Columbia': ['Vancouver', 'Victoria', 'Surrey', 'Burnaby', 'Richmond'],
//     'Alberta': ['Calgary', 'Edmonton', 'Red Deer', 'Lethbridge', 'Medicine Hat'],
//     'Manitoba': ['Winnipeg', 'Brandon', 'Steinbach', 'Thompson', 'Portage la Prairie'],
//
//     // UK
//     'England': ['London', 'Manchester', 'Birmingham', 'Liverpool', 'Bristol'],
//     'Scotland': ['Edinburgh', 'Glasgow', 'Aberdeen', 'Dundee', 'Inverness'],
//     'Wales': ['Cardiff', 'Swansea', 'Newport', 'Wrexham', 'Bangor'],
//     'Northern Ireland': ['Belfast', 'Derry', 'Lisburn', 'Newtownabbey', 'Bangor'],
//     'Northern England': ['Leeds', 'Sheffield', 'Newcastle', 'York', 'Durham'], // New State and Cities
//
//     // Australia
//     'New South Wales': ['Sydney', 'Newcastle', 'Wollongong', 'Tamworth', 'Gosford'],
//     'Victoria': ['Melbourne', 'Geelong', 'Ballarat', 'Bendigo', 'Shepparton'],
//     'Queensland': ['Brisbane', 'Gold Coast', 'Cairns', 'Townsville', 'Rockhampton'],
//     'Western Australia': ['Perth', 'Mandurah', 'Bunbury', 'Geraldton', 'Albany'],
//     'South Australia': ['Adelaide', 'Mount Gambier', 'Whyalla', 'Murray Bridge', 'Port Augusta'],
//   };
//
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.user.name);
//     dobController = TextEditingController(text: widget.user.dob);
//     emailController = TextEditingController(text: widget.user.email);
//     phoneController = TextEditingController(text: widget.user.phone);
//     countryController = TextEditingController(text: widget.user.country);
//     stateController = TextEditingController(text: widget.user.state);
//     cityController = TextEditingController(text: widget.user.city);
//     religionController = TextEditingController(text: widget.user.religion);
//     casteController = TextEditingController(text: widget.user.caste);
//     subCasteController = TextEditingController(text: widget.user.subCaste);
//     educationController = TextEditingController(text: widget.user.education);
//     occupationController = TextEditingController(text: widget.user.occupation);
//
//     gender = widget.user.gender;
//     maritalStatus = widget.user.maritalStatus;
//     selectedCountry = widget.user.country;
//     selectedState = widget.user.state;
//     selectedCity = widget.user.city;
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime today = DateTime.now();
//     DateTime minDate = today.subtract(Duration(days: 80 * 365)); // 80 years ago
//     DateTime maxDate = today.subtract(Duration(days: 18 * 365)); // 18 years ago
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? maxDate,
//       firstDate: minDate,
//       lastDate: maxDate,
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit User Profile',
//             style: GoogleFonts.poppins(
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//             )
//         ),
//         backgroundColor: Colors.redAccent.shade400,
//         elevation: 0,
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20)
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildSectionHeader("Personal Information", Icons.person),
//                   _buildInputField(
//                     controller: nameController,
//                     label: "Full Name",
//                     icon: Icons.person_outline,
//                     validator: (value) => value!.isEmpty ? 'Please enter name' : null,
//                     maxLength: 50,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
//                     ],
//                   ),
//                   _buildDropdownField(
//                     value: gender,
//                     items: ['Male', 'Female', 'Other'],
//                     onChanged: (value) => setState(() => gender = value),
//                     label: "Gender",
//                     icon: Icons.wc,
//                   ),
//                   _buildDateField(
//                     controller: dobController,
//                     label: "Date of Birth",
//                     onTap: () => _selectDate(context),
//                   ),
//                   _buildDropdownField(
//                     value: maritalStatus,
//                     items: ['Single', 'Married', 'Divorced', 'Widowed'],
//                     onChanged: (value) => setState(() => maritalStatus = value),
//                     label: "Marital Status",
//                     icon: Icons.favorite,
//                   ),
//
//                   _buildSectionHeader("Contact Information", Icons.contact_mail),
//                   _buildLocationDropdowns(),
//                   _buildInputField(
//                     controller: emailController,
//                     label: "Email Address",
//                     icon: Icons.email_outlined,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty ||
//                           !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   _buildInputField(
//                     controller: phoneController,
//                     label: "Phone Number",
//                     icon: Icons.phone_outlined,
//                     keyboardType: TextInputType.number,
//                     maxLength: 10,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                       LengthLimitingTextInputFormatter(10),
//                     ],
//                     validator: (value) {
//                       if (value == null || value.length != 10 || !RegExp(r"^[0-9]{10}").hasMatch(value)) {
//                         return 'Please enter a valid 10-digit phone number';
//                       }
//                       return null;
//                     },
//                   ),
//
//                   _buildSectionHeader("Other Details", Icons.more_horiz),
//                   _buildInputField(
//                     controller: religionController,
//                     label: "Religion",
//                     icon: Icons.church,
//                     validator: (value) => value!.isEmpty ? 'Please enter religion' : null,
//                   ),
//                   _buildInputField(
//                     controller: casteController,
//                     label: "Caste",
//                     icon: Icons.group,
//                     validator: (value) => value!.isEmpty ? 'Please enter caste' : null,
//                   ),
//                   _buildInputField(
//                     controller: subCasteController,
//                     label: "Sub Caste",
//                     icon: Icons.groups,
//                     validator: (value) => value!.isEmpty ? 'Please enter sub caste' : null,
//                   ),
//                   _buildInputField(
//                     controller: educationController,
//                     label: "Higher Education",
//                     icon: Icons.school_outlined,
//                     validator: (value) => value!.isEmpty ? 'Please enter education' : null,
//                   ),
//                   _buildInputField(
//                     controller: occupationController,
//                     label: "Occupation",
//                     icon: Icons.work_outline,
//                     validator: (value) => value!.isEmpty ? 'Please enter occupation' : null,
//                   ),
//
//                   SizedBox(height: 32),
//                   _buildSubmitButton(),
//                   SizedBox(height: 20),
//                 ],
//               ),
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
//   Widget _buildDropdownField({
//     required String? value,
//     required List<String> items,
//     required Function(String?) onChanged,
//     required String label,
//     required IconData icon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         onChanged: onChanged,
//         items: items.map((item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item, style: GoogleFonts.poppins()),
//           );
//         }).toList(),
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
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               labelText: label,
//               prefixIcon: Icon(Icons.calendar_today, color: Colors.redAccent.shade200),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade200),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade200),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2),
//               ),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             ),
//             style: GoogleFonts.poppins(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           widget.user.name = nameController.text;
//           widget.user.dob = dobController.text;
//           widget.user.gender = gender;
//           widget.user.maritalStatus = maritalStatus;
//           widget.user.country = selectedCountry;
//           widget.user.state = selectedState;
//           widget.user.city = selectedCity;
//           widget.user.religion = religionController.text;
//           widget.user.caste = casteController.text;
//           widget.user.subCaste = subCasteController.text;
//           widget.user.education = educationController.text;
//           widget.user.occupation = occupationController.text;
//           widget.user.email = emailController.text;
//           widget.user.phone = phoneController.text;
//
//           // Return the updated user to the previous page
//           Navigator.pop(context, widget.user);
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.redAccent.shade400,
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//       ),
//       child: Text(
//         'Save Changes',
//         style: GoogleFonts.poppins(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLocationDropdowns() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildDropdownField(
//           value: selectedCountry,
//           items: countryStateMap.keys.toList(),
//           onChanged: (value) {
//             setState(() {
//               selectedCountry = value;
//               selectedState = null;
//               selectedCity = null;
//             });
//           },
//           label: "Country",
//           icon: Icons.location_on,
//         ),
//         if (selectedCountry != null)
//           _buildDropdownField(
//             value: selectedState,
//             items: countryStateMap[selectedCountry] ?? [],
//             onChanged: (value) {
//               setState(() {
//                 selectedState = value;
//                 selectedCity = null;
//               });
//             },
//             label: "State",
//             icon: Icons.location_city,
//           ),
//         if (selectedState != null)
//           _buildDropdownField(
//             value: selectedCity,
//             items: stateCityMap[selectedState] ?? [],
//             onChanged: (value) => setState(() => selectedCity = value),
//             label: "City",
//             icon: Icons.location_pin,
//           ),
//       ],
//     );
//   }
// }


//database in edit page


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// import 'database_helper.dart';
// import 'user_class.dart';
//
// class EditUserPage extends StatefulWidget {
//   final User user;
//
//   EditUserPage({required this.user});
//
//   @override
//   _EditUserPageState createState() => _EditUserPageState();
// }
//
// class _EditUserPageState extends State<EditUserPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   late TextEditingController nameController;
//   late TextEditingController dobController;
//   late TextEditingController emailController;
//   late TextEditingController phoneController;
//   late TextEditingController countryController;
//   late TextEditingController stateController;
//   late TextEditingController cityController;
//   late TextEditingController religionController;
//   late TextEditingController casteController;
//   late TextEditingController subCasteController;
//   late TextEditingController educationController;
//   late TextEditingController occupationController;
//
//   String? gender;
//   String? maritalStatus;
//   String? selectedCountry;
//   String? selectedState;
//   String? selectedCity;
//   DateTime? selectedDate;
//
//   final Map<String, List<String>> countryStateMap = {
//     'USA': ['California', 'Texas', 'New York', 'Florida', 'Illinois'],
//     'India': ['Maharashtra', 'Karnataka', 'Tamil Nadu', 'Delhi', 'Gujarat'],
//     'Canada': ['Ontario', 'Quebec', 'British Columbia', 'Alberta', 'Manitoba'],
//     'UK': ['England', 'Scotland', 'Wales', 'Northern Ireland', 'Northern England'], // Added Northern England
//     'Australia': ['New South Wales', 'Victoria', 'Queensland', 'Western Australia', 'South Australia'],
//   };
//
//   final Map<String, List<String>> stateCityMap = {
//     // USA
//     'California': ['Los Angeles', 'San Francisco', 'San Diego', 'Sacramento', 'San Jose'],
//     'Texas': ['Houston', 'Dallas', 'Austin', 'San Antonio', 'Fort Worth'],
//     'New York': ['New York City', 'Buffalo', 'Rochester', 'Albany', 'Syracuse'],
//     'Florida': ['Miami', 'Orlando', 'Tampa', 'Jacksonville', 'Fort Lauderdale'],
//     'Illinois': ['Chicago', 'Springfield', 'Peoria', 'Naperville', 'Rockford'],
//
//     // India
//     'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik', 'Aurangabad'],
//     'Karnataka': ['Bangalore', 'Mysore', 'Mangalore', 'Hubli', 'Belgaum'],
//     'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai', 'Tiruchirappalli', 'Salem'],
//     'Delhi': ['New Delhi', 'Rohini', 'Dwarka', 'Karol Bagh', 'Pitampura'],
//     'Gujarat': ['Ahmedabad', 'Surat', 'Rajkot', 'Porbandar', 'Junagadh'],
//
//     // Canada
//     'Ontario': ['Toronto', 'Ottawa', 'Mississauga', 'Brampton', 'Hamilton'],
//     'Quebec': ['Montreal', 'Quebec City', 'Laval', 'Gatineau', 'Sherbrooke'],
//     'British Columbia': ['Vancouver', 'Victoria', 'Surrey', 'Burnaby', 'Richmond'],
//     'Alberta': ['Calgary', 'Edmonton', 'Red Deer', 'Lethbridge', 'Medicine Hat'],
//     'Manitoba': ['Winnipeg', 'Brandon', 'Steinbach', 'Thompson', 'Portage la Prairie'],
//
//     // UK
//     'England': ['London', 'Manchester', 'Birmingham', 'Liverpool', 'Bristol'],
//     'Scotland': ['Edinburgh', 'Glasgow', 'Aberdeen', 'Dundee', 'Inverness'],
//     'Wales': ['Cardiff', 'Swansea', 'Newport', 'Wrexham', 'Bangor'],
//     'Northern Ireland': ['Belfast', 'Derry', 'Lisburn', 'Newtownabbey', 'Bangor'],
//     'Northern England': ['Leeds', 'Sheffield', 'Newcastle', 'York', 'Durham'], // New State and Cities
//
//     // Australia
//     'New South Wales': ['Sydney', 'Newcastle', 'Wollongong', 'Tamworth', 'Gosford'],
//     'Victoria': ['Melbourne', 'Geelong', 'Ballarat', 'Bendigo', 'Shepparton'],
//     'Queensland': ['Brisbane', 'Gold Coast', 'Cairns', 'Townsville', 'Rockhampton'],
//     'Western Australia': ['Perth', 'Mandurah', 'Bunbury', 'Geraldton', 'Albany'],
//     'South Australia': ['Adelaide', 'Mount Gambier', 'Whyalla', 'Murray Bridge', 'Port Augusta'],
//   };
//
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.user.name);
//     dobController = TextEditingController(text: widget.user.dob);
//     emailController = TextEditingController(text: widget.user.email);
//     phoneController = TextEditingController(text: widget.user.phone);
//     countryController = TextEditingController(text: widget.user.country);
//     stateController = TextEditingController(text: widget.user.state);
//     cityController = TextEditingController(text: widget.user.city);
//     religionController = TextEditingController(text: widget.user.religion);
//     casteController = TextEditingController(text: widget.user.caste);
//     subCasteController = TextEditingController(text: widget.user.subCaste);
//     educationController = TextEditingController(text: widget.user.education);
//     occupationController = TextEditingController(text: widget.user.occupation);
//
//     gender = widget.user.gender;
//     maritalStatus = widget.user.maritalStatus;
//     selectedCountry = widget.user.country;
//     selectedState = widget.user.state;
//     selectedCity = widget.user.city;
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime today = DateTime.now();
//     DateTime minDate = today.subtract(Duration(days: 80 * 365)); // 80 years ago
//     DateTime maxDate = today.subtract(Duration(days: 18 * 365)); // 18 years ago
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? maxDate,
//       firstDate: minDate,
//       lastDate: maxDate,
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit User Profile',
//             style: GoogleFonts.poppins(
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//             )
//         ),
//         backgroundColor: Colors.redAccent.shade400,
//         elevation: 0,
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20)
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildSectionHeader("Personal Information", Icons.person),
//                   _buildInputField(
//                     controller: nameController,
//                     label: "Full Name",
//                     icon: Icons.person_outline,
//                     validator: (value) => value!.isEmpty ? 'Please enter name' : null,
//                     maxLength: 50,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
//                     ],
//                   ),
//                   _buildDropdownField(
//                     value: gender,
//                     items: ['Male', 'Female', 'Other'],
//                     onChanged: (value) => setState(() => gender = value),
//                     label: "Gender",
//                     icon: Icons.wc,
//                   ),
//                   _buildDateField(
//                     controller: dobController,
//                     label: "Date of Birth",
//                     onTap: () => _selectDate(context),
//                   ),
//                   _buildDropdownField(
//                     value: maritalStatus,
//                     items: ['Single', 'Married', 'Divorced', 'Widowed'],
//                     onChanged: (value) => setState(() => maritalStatus = value),
//                     label: "Marital Status",
//                     icon: Icons.favorite,
//                   ),
//
//                   _buildSectionHeader("Contact Information", Icons.contact_mail),
//                   _buildLocationDropdowns(),
//                   _buildInputField(
//                     controller: emailController,
//                     label: "Email Address",
//                     icon: Icons.email_outlined,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty ||
//                           !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   _buildInputField(
//                     controller: phoneController,
//                     label: "Phone Number",
//                     icon: Icons.phone_outlined,
//                     keyboardType: TextInputType.number,
//                     maxLength: 10,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                       LengthLimitingTextInputFormatter(10),
//                     ],
//                     validator: (value) {
//                       if (value == null || value.length != 10 || !RegExp(r"^[0-9]{10}").hasMatch(value)) {
//                         return 'Please enter a valid 10-digit phone number';
//                       }
//                       return null;
//                     },
//                   ),
//
//                   _buildSectionHeader("Other Details", Icons.more_horiz),
//                   _buildInputField(
//                     controller: religionController,
//                     label: "Religion",
//                     icon: Icons.church,
//                     validator: (value) => value!.isEmpty ? 'Please enter religion' : null,
//                   ),
//                   _buildInputField(
//                     controller: casteController,
//                     label: "Caste",
//                     icon: Icons.group,
//                     validator: (value) => value!.isEmpty ? 'Please enter caste' : null,
//                   ),
//                   _buildInputField(
//                     controller: subCasteController,
//                     label: "Sub Caste",
//                     icon: Icons.groups,
//                     validator: (value) => value!.isEmpty ? 'Please enter sub caste' : null,
//                   ),
//                   _buildInputField(
//                     controller: educationController,
//                     label: "Higher Education",
//                     icon: Icons.school_outlined,
//                     validator: (value) => value!.isEmpty ? 'Please enter education' : null,
//                   ),
//                   _buildInputField(
//                     controller: occupationController,
//                     label: "Occupation",
//                     icon: Icons.work_outline,
//                     validator: (value) => value!.isEmpty ? 'Please enter occupation' : null,
//                   ),
//
//                   SizedBox(height: 32),
//                   _buildSubmitButton(),
//                   SizedBox(height: 20),
//                 ],
//               ),
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
//   Widget _buildDropdownField({
//     required String? value,
//     required List<String> items,
//     required Function(String?) onChanged,
//     required String label,
//     required IconData icon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         onChanged: onChanged,
//         items: items.map((item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item, style: GoogleFonts.poppins()),
//           );
//         }).toList(),
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
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               labelText: label,
//               prefixIcon: Icon(Icons.calendar_today, color: Colors.redAccent.shade200),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade200),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade200),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2),
//               ),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             ),
//             style: GoogleFonts.poppins(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: () async {
//         if (_formKey.currentState!.validate()) {
//           // Update the user object with new values
//           widget.user.name = nameController.text;
//           widget.user.dob = dobController.text;
//           widget.user.gender = gender;
//           widget.user.maritalStatus = maritalStatus;
//           widget.user.country = selectedCountry;
//           widget.user.state = selectedState;
//           widget.user.city = selectedCity;
//           widget.user.religion = religionController.text;
//           widget.user.caste = casteController.text;
//           widget.user.subCaste = subCasteController.text;
//           widget.user.education = educationController.text;
//           widget.user.occupation = occupationController.text;
//           widget.user.email = emailController.text;
//           widget.user.phone = phoneController.text;
//
//           // ✅ **Save updated user to database**
//           await DatabaseHelper.instance.updateUser(widget.user);
//
//           // ✅ **Return the updated user to previous screen**
//           Navigator.pop(context, widget.user);
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.redAccent.shade400,
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//       ),
//       child: Text(
//         'Save Changes',
//         style: GoogleFonts.poppins(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildLocationDropdowns() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildDropdownField(
//           value: selectedCountry,
//           items: countryStateMap.keys.toList(),
//           onChanged: (value) {
//             setState(() {
//               selectedCountry = value;
//               selectedState = null;
//               selectedCity = null;
//             });
//           },
//           label: "Country",
//           icon: Icons.location_on,
//         ),
//         if (selectedCountry != null)
//           _buildDropdownField(
//             value: selectedState,
//             items: countryStateMap[selectedCountry] ?? [],
//             onChanged: (value) {
//               setState(() {
//                 selectedState = value;
//                 selectedCity = null;
//               });
//             },
//             label: "State",
//             icon: Icons.location_city,
//           ),
//         if (selectedState != null)
//           _buildDropdownField(
//             value: selectedCity,
//             items: stateCityMap[selectedState] ?? [],
//             onChanged: (value) => setState(() => selectedCity = value),
//             label: "City",
//             icon: Icons.location_pin,
//           ),
//       ],
//     );
//   }
// }

//DOB fix

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// import 'database_helper.dart';
// import 'user_class.dart';
//
// class EditUserPage extends StatefulWidget {
//   final User user;
//
//   EditUserPage({required this.user});
//
//   @override
//   _EditUserPageState createState() => _EditUserPageState();
// }
//
// class _EditUserPageState extends State<EditUserPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   late TextEditingController nameController;
//   late TextEditingController dobController;
//   late TextEditingController emailController;
//   late TextEditingController phoneController;
//   late TextEditingController countryController;
//   late TextEditingController stateController;
//   late TextEditingController cityController;
//   late TextEditingController religionController;
//   late TextEditingController casteController;
//   late TextEditingController subCasteController;
//   late TextEditingController educationController;
//   late TextEditingController occupationController;
//
//   String? gender;
//   String? maritalStatus;
//   String? selectedCountry;
//   String? selectedState;
//   String? selectedCity;
//   DateTime? selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.user.name);
//     dobController = TextEditingController(text: widget.user.dob);
//     emailController = TextEditingController(text: widget.user.email);
//     phoneController = TextEditingController(text: widget.user.phone);
//     countryController = TextEditingController(text: widget.user.country);
//     stateController = TextEditingController(text: widget.user.state);
//     cityController = TextEditingController(text: widget.user.city);
//     religionController = TextEditingController(text: widget.user.religion);
//     casteController = TextEditingController(text: widget.user.caste);
//     subCasteController = TextEditingController(text: widget.user.subCaste);
//     educationController = TextEditingController(text: widget.user.education);
//     occupationController = TextEditingController(text: widget.user.occupation);
//
//     gender = widget.user.gender;
//     maritalStatus = widget.user.maritalStatus;
//     selectedCountry = widget.user.country;
//     selectedState = widget.user.state;
//     selectedCity = widget.user.city;
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime today = DateTime.now();
//     // Calculate the minimum allowed date (80 years ago)
//     DateTime minDate = DateTime(today.year - 80, today.month, today.day); // 80 years ago
//
//     // Calculate the maximum allowed date (18 years ago)
//     DateTime maxDate = DateTime(today.year - 18, today.month, today.day); // 18 years ago
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? maxDate,
//       firstDate: minDate,
//       lastDate: maxDate,
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit User Profile',
//             style: GoogleFonts.poppins(
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//             )
//         ),
//         backgroundColor: Colors.redAccent.shade400,
//         elevation: 0,
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20)
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildSectionHeader("Personal Information", Icons.person),
//                   _buildInputField(
//                     controller: nameController,
//                     label: "Full Name",
//                     icon: Icons.person_outline,
//                     validator: (value) => value!.isEmpty ? 'Please enter name' : null,
//                     maxLength: 50,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
//                     ],
//                   ),
//                   _buildDropdownField(
//                     value: gender,
//                     items: ['Male', 'Female', 'Other'],
//                     onChanged: (value) => setState(() => gender = value),
//                     label: "Gender",
//                     icon: Icons.wc,
//                   ),
//                   _buildDateField(
//                     controller: dobController,
//                     label: "Date of Birth",
//                     onTap: () => _selectDate(context),
//                   ),
//                   _buildDropdownField(
//                     value: maritalStatus,
//                     items: ['Single', 'Married', 'Divorced', 'Widowed'],
//                     onChanged: (value) => setState(() => maritalStatus = value),
//                     label: "Marital Status",
//                     icon: Icons.favorite,
//                   ),
//
//                   _buildSectionHeader("Contact Information", Icons.contact_mail),
//                   _buildLocationDropdowns(),
//                   _buildInputField(
//                     controller: emailController,
//                     label: "Email Address",
//                     icon: Icons.email_outlined,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty ||
//                           !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   _buildInputField(
//                     controller: phoneController,
//                     label: "Phone Number",
//                     icon: Icons.phone_outlined,
//                     keyboardType: TextInputType.number,
//                     maxLength: 10,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                       LengthLimitingTextInputFormatter(10),
//                     ],
//                     validator: (value) {
//                       if (value == null || value.length != 10 || !RegExp(r"^[0-9]{10}").hasMatch(value)) {
//                         return 'Please enter a valid 10-digit phone number';
//                       }
//                       return null;
//                     },
//                   ),
//
//                   _buildSectionHeader("Other Details", Icons.more_horiz),
//                   _buildInputField(
//                     controller: religionController,
//                     label: "Religion",
//                     icon: Icons.church,
//                     validator: (value) => value!.isEmpty ? 'Please enter religion' : null,
//                   ),
//                   _buildInputField(
//                     controller: casteController,
//                     label: "Caste",
//                     icon: Icons.group,
//                     validator: (value) => value!.isEmpty ? 'Please enter caste' : null,
//                   ),
//                   _buildInputField(
//                     controller: subCasteController,
//                     label: "Sub Caste",
//                     icon: Icons.groups,
//                     validator: (value) => value!.isEmpty ? 'Please enter sub caste' : null,
//                   ),
//                   _buildInputField(
//                     controller: educationController,
//                     label: "Higher Education",
//                     icon: Icons.school_outlined,
//                     validator: (value) => value!.isEmpty ? 'Please enter education' : null,
//                   ),
//                   _buildInputField(
//                     controller: occupationController,
//                     label: "Occupation",
//                     icon: Icons.work_outline,
//                     validator: (value) => value!.isEmpty ? 'Please enter occupation' : null,
//                   ),
//
//                   SizedBox(height: 32),
//                   _buildSubmitButton(),
//                   SizedBox(height: 20),
//                 ],
//               ),
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
//   Widget _buildDropdownField({
//     required String? value,
//     required List<String> items,
//     required Function(String?) onChanged,
//     required String label,
//     required IconData icon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         onChanged: onChanged,
//         items: items.map((item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item, style: GoogleFonts.poppins()),
//           );
//         }).toList(),
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
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               labelText: label,
//               prefixIcon: Icon(Icons.calendar_today, color: Colors.redAccent.shade200),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade200),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade200),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2),
//               ),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             ),
//             style: GoogleFonts.poppins(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: () async {
//         if (_formKey.currentState!.validate()) {
//           // Update the user object with new values
//           widget.user.name = nameController.text;
//           widget.user.dob = dobController.text;
//           widget.user.gender = gender;
//           widget.user.maritalStatus = maritalStatus;
//           widget.user.country = selectedCountry;
//           widget.user.state = selectedState;
//           widget.user.city = selectedCity;
//           widget.user.religion = religionController.text;
//           widget.user.caste = casteController.text;
//           widget.user.subCaste = subCasteController.text;
//           widget.user.education = educationController.text;
//           widget.user.occupation = occupationController.text;
//           widget.user.email = emailController.text;
//           widget.user.phone = phoneController.text;
//
//           // ✅ **Save updated user to database**
//           await DatabaseHelper.instance.updateUser(widget.user);
//
//           // ✅ **Return the updated user to previous screen**
//           Navigator.pop(context, widget.user);
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.redAccent.shade400,
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//       ),
//       child: Text(
//         'Save Changes',
//         style: GoogleFonts.poppins(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildLocationDropdowns() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildDropdownField(
//           value: selectedCountry,
//           items: countryStateMap.keys.toList(),
//           onChanged: (value) {
//             setState(() {
//               selectedCountry = value;
//               selectedState = null;
//               selectedCity = null;
//             });
//           },
//           label: "Country",
//           icon: Icons.location_on,
//         ),
//         if (selectedCountry != null)
//           _buildDropdownField(
//             value: selectedState,
//             items: countryStateMap[selectedCountry] ?? [],
//             onChanged: (value) {
//               setState(() {
//                 selectedState = value;
//                 selectedCity = null;
//               });
//             },
//             label: "State",
//             icon: Icons.location_city,
//           ),
//         if (selectedState != null)
//           _buildDropdownField(
//             value: selectedCity,
//             items: stateCityMap[selectedState] ?? [],
//             onChanged: (value) => setState(() => selectedCity = value),
//             label: "City",
//             icon: Icons.location_pin,
//           ),
//       ],
//     );
//   }
// }


//dropdown fields (15/02/2025)

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:matrimony_app/ui/dropdown.dart';
//
// import 'database_helper.dart';
// import 'user_class.dart';
//
// class EditUserPage extends StatefulWidget {
//   final User user;
//
//   EditUserPage({required this.user});
//
//   @override
//   _EditUserPageState createState() => _EditUserPageState();
// }
//
// class _EditUserPageState extends State<EditUserPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   late TextEditingController nameController;
//   late TextEditingController dobController;
//   late TextEditingController emailController;
//   late TextEditingController phoneController;
//   late TextEditingController religionController;
//   late TextEditingController casteController;
//   late TextEditingController subCasteController;
//   late TextEditingController educationController;
//   late TextEditingController occupationController;
//
//   String? gender;
//   String? maritalStatus;
//   String? selectedCountry;
//   String? selectedState;
//   String? selectedCity;
//   DateTime? selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.user.name);
//     dobController = TextEditingController(text: widget.user.dob);
//     emailController = TextEditingController(text: widget.user.email);
//     phoneController = TextEditingController(text: widget.user.phone);
//     religionController = TextEditingController(text: widget.user.religion);
//     casteController = TextEditingController(text: widget.user.caste);
//     subCasteController = TextEditingController(text: widget.user.subCaste);
//     educationController = TextEditingController(text: widget.user.education);
//     occupationController = TextEditingController(text: widget.user.occupation);
//
//     gender = widget.user.gender;
//     maritalStatus = widget.user.maritalStatus;
//     selectedCountry = widget.user.country;
//     selectedState = widget.user.state;
//     selectedCity = widget.user.city;
//   }
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
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit User Profile',
//             style: GoogleFonts.poppins(
//               fontSize: 22,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//             )
//         ),
//         backgroundColor: Colors.redAccent.shade400,
//         elevation: 0,
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20)
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red.shade50, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildSectionHeader("Personal Information", Icons.person),
//                   _buildInputField(
//                     controller: nameController,
//                     label: "Full Name",
//                     icon: Icons.person_outline,
//                     validator: (value) => value!.isEmpty ? 'Please enter name' : null,
//                     maxLength: 50,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
//                     ],
//                   ),
//                   _buildDropdownField(
//                     value: gender,
//                     items: ['Male', 'Female', 'Other'],
//                     onChanged: (value) => setState(() => gender = value),
//                     label: "Gender",
//                     icon: Icons.wc,
//                   ),
//                   _buildDateField(
//                     controller: dobController,
//                     label: "Date of Birth",
//                     onTap: () => _selectDate(context),
//                   ),
//                   _buildDropdownField(
//                     value: maritalStatus,
//                     items: ['Single', 'Married', 'Divorced', 'Widowed'],
//                     onChanged: (value) => setState(() => maritalStatus = value),
//                     label: "Marital Status",
//                     icon: Icons.favorite,
//                   ),
//
//                   _buildSectionHeader("Contact Information", Icons.contact_mail),
//                   _buildLocationDropdowns(),
//                   _buildInputField(
//                     controller: emailController,
//                     label: "Email Address",
//                     icon: Icons.email_outlined,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty ||
//                           !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   _buildInputField(
//                     controller: phoneController,
//                     label: "Phone Number",
//                     icon: Icons.phone_outlined,
//                     keyboardType: TextInputType.number,
//                     maxLength: 10,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                       LengthLimitingTextInputFormatter(10),
//                     ],
//                     validator: (value) {
//                       if (value == null || value.length != 10 || !RegExp(r"^[0-9]{10}").hasMatch(value)) {
//                         return 'Please enter a valid 10-digit phone number';
//                       }
//                       return null;
//                     },
//                   ),
//
//                   _buildSectionHeader("Other Details", Icons.more_horiz),
//                   _buildInputField(
//                     controller: religionController,
//                     label: "Religion",
//                     icon: Icons.church,
//                     validator: (value) => value!.isEmpty ? 'Please enter religion' : null,
//                   ),
//                   _buildInputField(
//                     controller: casteController,
//                     label: "Caste",
//                     icon: Icons.group,
//                     validator: (value) => value!.isEmpty ? 'Please enter caste' : null,
//                   ),
//                   _buildInputField(
//                     controller: subCasteController,
//                     label: "Sub Caste",
//                     icon: Icons.groups,
//                     validator: (value) => value!.isEmpty ? 'Please enter sub caste' : null,
//                   ),
//                   _buildInputField(
//                     controller: educationController,
//                     label: "Higher Education",
//                     icon: Icons.school_outlined,
//                     validator: (value) => value!.isEmpty ? 'Please enter education' : null,
//                   ),
//                   _buildInputField(
//                     controller: occupationController,
//                     label: "Occupation",
//                     icon: Icons.work_outline,
//                     validator: (value) => value!.isEmpty ? 'Please enter occupation' : null,
//                   ),
//
//                   SizedBox(height: 32),
//                   _buildSubmitButton(),
//                   SizedBox(height: 20),
//                 ],
//               ),
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
//   Widget _buildDropdownField({
//     required String? value,
//     required List<String> items,
//     required Function(String?) onChanged,
//     required String label,
//     required IconData icon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         onChanged: onChanged,
//         items: items.map((item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item, style: GoogleFonts.poppins()),
//           );
//         }).toList(),
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
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               labelText: label,
//               prefixIcon: Icon(Icons.calendar_today, color: Colors.redAccent.shade200),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade200),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade200),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2),
//               ),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             ),
//             style: GoogleFonts.poppins(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: () async {
//         if (_formKey.currentState!.validate()) {
//           // Update the user object with new values
//           widget.user.name = nameController.text;
//           widget.user.dob = dobController.text;
//           widget.user.gender = gender;
//           widget.user.maritalStatus = maritalStatus;
//           widget.user.country = selectedCountry;
//           widget.user.state = selectedState;
//           widget.user.city = selectedCity;
//           widget.user.religion = religionController.text;
//           widget.user.caste = casteController.text;
//           widget.user.subCaste = subCasteController.text;
//           widget.user.education = educationController.text;
//           widget.user.occupation = occupationController.text;
//           widget.user.email = emailController.text;
//           widget.user.phone = phoneController.text;
//
//           // Save updated user to database
//           await DatabaseHelper.instance.updateUser(widget.user);
//
//           // Return updated user to previous screen
//           Navigator.pop(context, widget.user);
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.redAccent.shade400,
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//       ),
//       child: Text(
//         'Save Changes',
//         style: GoogleFonts.poppins(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLocationDropdowns() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildDropdownField(
//           value: selectedCountry,
//           items: DropdownData.countryStateMap.keys.toList(),
//           onChanged: (value) {
//             setState(() {
//               selectedCountry = value;
//               selectedState = null;
//               selectedCity = null;
//             });
//           },
//           label: "Country",
//           icon: Icons.location_on,
//         ),
//         if (selectedCountry != null)
//           _buildDropdownField(
//             value: selectedState,
//             items: DropdownData.countryStateMap[selectedCountry] ?? [],
//             onChanged: (value) {
//               setState(() {
//                 selectedState = value;
//                 selectedCity = null;
//               });
//             },
//             label: "State",
//             icon: Icons.location_city,
//           ),
//         if (selectedState != null)
//           _buildDropdownField(
//             value: selectedCity,
//             items: DropdownData.stateCityMap[selectedState] ?? [],
//             onChanged: (value) => setState(() => selectedCity = value),
//             label: "City",
//             icon: Icons.location_pin,
//           ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'api/apiservice.dart';
import 'dropdown.dart';
import 'user_class.dart';

class EditUserPage extends StatefulWidget {
  final User user;

  EditUserPage({required this.user});

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final _formKey = GlobalKey<FormState>();
  ApiService apiService = ApiService();

  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController religionController;
  late TextEditingController casteController;
  late TextEditingController subCasteController;
  late TextEditingController educationController;
  late TextEditingController occupationController;

  String? gender;
  String? maritalStatus;
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    dobController = TextEditingController(text: widget.user.dob);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);
    religionController = TextEditingController(text: widget.user.religion);
    casteController = TextEditingController(text: widget.user.caste);
    subCasteController = TextEditingController(text: widget.user.subCaste);
    educationController = TextEditingController(text: widget.user.education);
    occupationController = TextEditingController(text: widget.user.occupation);

    gender = widget.user.gender;
    maritalStatus = widget.user.maritalStatus;
    selectedCountry = widget.user.country;
    selectedState = widget.user.state;
    selectedCity = widget.user.city;
  }

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
        dobController.text = DateFormat('yyyy-MM-dd').format(picked); // Format date correctly
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit User Profile',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent.shade400,
        elevation: 0,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20)
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                    validator: (value) =>
                    value!.isEmpty ? 'Please enter name' : null,
                    maxLength: 50,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
                    ],
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
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
                              .hasMatch(value)) {
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    validator: (value) {
                      if (value == null ||
                          value.length != 10 ||
                          !RegExp(r"^[0-9]{10}").hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),
                  _buildSectionHeader("Other Details", Icons.more_horiz),
                  _buildDropdownField(
                    value: religionController.text.isEmpty
                        ? null
                        : religionController.text,
                    items: DropdownData.religions.toSet().toList(),
                    onChanged: (value) {
                      setState(() {
                        religionController.text = value!;
                        casteController.clear(); // Reset caste and sub-caste when religion changes
                        subCasteController.clear();
                      });
                    },
                    label: "Religion",
                    icon: Icons.church,
                  ),

                  _buildDropdownField(
                    value: casteController.text.isEmpty ? null : casteController.text,
                    items: DropdownData.casteMap[religionController.text]?.toSet().toList() ?? [],
                    onChanged: (value) {
                      setState(() {
                        casteController.text = value!;
                        subCasteController.clear(); // Reset sub-caste when caste changes
                      });
                    },
                    label: "Caste",
                    icon: Icons.group,
                  ),

                  _buildDropdownField(
                    value: subCasteController.text.isEmpty ? null : subCasteController.text,
                    items: DropdownData.subCasteMap[casteController.text] ?? [],
                    onChanged: (value) => setState(() => subCasteController.text = value!),
                    label: "Sub-Caste",
                    icon: Icons.people,
                  ),

                  _buildDropdownField(
                    value: educationController.text.isEmpty ? null : educationController.text,
                    items: DropdownData.higherEducation,
                    onChanged: (value) => setState(() => educationController.text = value!),
                    label: "Higher Education",
                    icon: Icons.school,
                  ),

                  _buildDropdownField(
                    value: occupationController.text.isEmpty ? null : occupationController.text,
                    items: DropdownData.occupations,
                    onChanged: (value) => setState(() => occupationController.text = value!),
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
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent.shade400,
            ),
          ),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.redAccent.shade200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.redAccent.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2),
          ),
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
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: GoogleFonts.poppins()),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.redAccent.shade200),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.redAccent.shade200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.redAccent.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
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
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(Icons.calendar_today, color: Colors.redAccent.shade200),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.redAccent.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.redAccent.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.redAccent.shade400, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            style: GoogleFonts.poppins(),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          // Update the user object with new values
          widget.user.name = nameController.text;
          widget.user.dob = dobController.text;
          widget.user.gender = gender;
          widget.user.maritalStatus = maritalStatus;
          widget.user.country = selectedCountry;
          widget.user.state = selectedState;
          widget.user.city = selectedCity;
          widget.user.religion = religionController.text;
          widget.user.caste = casteController.text;
          widget.user.subCaste = subCasteController.text;
          widget.user.education = educationController.text;
          widget.user.occupation = occupationController.text;
          widget.user.email = emailController.text;
          widget.user.phone = phoneController.text;

          // Save updated user to database
          // await DatabaseHelper.instance.updateUser(widget.user);
          print(':: ID OF THE EDIT FIELD IS :::${widget.user.id.toString()}');
          apiService.updateUser(widget.user.id.toString(), widget.user);

          // Return updated user to previous screenc
          Navigator.pop(context, widget.user);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent.shade400,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        'Save Changes',
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildLocationDropdowns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDropdownField(
          value: selectedCountry,
          items: DropdownData.countryStateMap.keys.toList(),
          onChanged: (value) {
            setState(() {
              selectedCountry = value;
              selectedState = null;
              selectedCity = null;
            });
          },
          label: "Country",
          icon: Icons.location_on,
        ),
        if (selectedCountry != null)
          _buildDropdownField(
            value: selectedState,
            items: DropdownData.countryStateMap[selectedCountry] ?? [],
            onChanged: (value) {
              setState(() {
                selectedState = value;
                selectedCity = null;
              });
            },
            label: "State",
            icon: Icons.location_city,
          ),
        if (selectedState != null)
          _buildDropdownField(
            value: selectedCity,
            items: DropdownData.stateCityMap[selectedState] ?? [],
            onChanged: (value) => setState(() => selectedCity = value),
            label: "City",
            icon: Icons.location_pin,
          ),
      ],
    );
  }
}
