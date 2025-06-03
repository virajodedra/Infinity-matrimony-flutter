import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Duration of animation
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward(); // Start animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Adjust the height if needed
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            title: const Text('About Us', style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.red, // Red theme
            elevation: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(  // Allows scrolling at both ends
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section with Animated Heart Icon and Infinity Text
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _scaleAnimation.value,
                            child: AnimatedOpacity(
                              opacity: _opacityAnimation.value,
                              duration: Duration(seconds: 2),
                              child: Icon(
                                Icons.favorite, // Heart icon
                                size: 100,
                                color: Colors.redAccent, // Red accent color for heart
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _scaleAnimation.value,
                            child: AnimatedOpacity(
                              opacity: _opacityAnimation.value,
                              duration: Duration(seconds: 2),
                              child: Text(
                                'Infinity', // Text below the heart
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[800],
                                  letterSpacing: 1.2,
                                  fontFamily: 'Arial', // Optional custom font
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Meet Our Team Section
              _buildSectionCard(
                'Meet Our Team',
                Column(
                  children: [
                    buildKeyValueRow('Developed by', 'Viraj Odedra (23010101178)'),
                    buildKeyValueRow('Mentored by', 'Prof. Mehul Bhundiya\nComputer Engineering Department'),
                    buildKeyValueRow('Explored by', 'ASWDC, School Of Computer Science'),
                    buildKeyValueRow('Eulogized by', 'Darshan University, Rajkot, Gujarat - INDIA'),
                  ],
                ),
              ),

              // About ASWDC Section
              _buildSectionCard(
                'About ASWDC',
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset('assets/aboutusimages/darshanUniversity.jpg'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset('assets/aboutusimages/aswdc.jpg'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoText(),
                  ],
                ),
              ),

              // Contact Section
              _buildSectionCard(
                'Contact Us',
                Column(
                  children: [
                    buildContactRow(Icons.email, 'aswdc@darshan.ac.in'),
                    buildContactRow(Icons.phone, '+91-9727747317'),
                    buildContactRow(Icons.language, 'www.darshan.ac.in'),
                  ],
                ),
              ),

              // Quick Links
              _buildSectionCard(
                'Quick Links',
                Column(
                  children: [
                    _buildActionButton(Icons.share, 'Share App'),
                    _buildActionButton(Icons.apps, 'More Apps'),
                    _buildActionButton(Icons.star, 'Rate Us'),
                    _buildActionButton(Icons.thumb_up, 'Like us on Facebook'),
                    _buildActionButton(Icons.update, 'Check For Update'),
                  ],
                ),
              ),

              // Footer
              const SizedBox(height: 24),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, Widget content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
                letterSpacing: 0.5,
              ),
            ),
            const Divider(color: Colors.red, thickness: 1.5, height: 24),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Icon(icon, color: Colors.red[600], size: 22),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText() {
    return Text(
      'ASWDC is Application, Software and Website Development Center @ Darshan University...',
      style: TextStyle(
        fontSize: 15,
        height: 1.5,
        color: Colors.blueGrey[800], // Different color for the description
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.5),
          children: [
            const TextSpan(text: '© 2025 Darshan University\n'),
            const TextSpan(text: 'All Rights Reserved - Privacy Policy\n'),
            const TextSpan(text: 'Made with '),
            WidgetSpan(
              child: Icon(Icons.favorite, color: Colors.red, size: 14),
            ),
            const TextSpan(text: ' in India'),
          ],
        ),
      ),
    );
  }

  Widget buildKeyValueRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Text('$key: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[700]))),
          Expanded(flex: 3, child: Text(value, style: TextStyle(color: Colors.red[600]))),
        ],
      ),
    );
  }

  Widget buildContactRow(IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.red),
          SizedBox(width: 8),
          Text(info, style: TextStyle(color: Colors.red[600])),
        ],
      ),
    );
  }

  Widget buildLinkRow(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.red),
          SizedBox(width: 8),
          Text(title, style: TextStyle(color: Colors.red[600])),
        ],
      ),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Aboutus extends StatefulWidget {
//   const Aboutus({super.key});
//
//   @override
//   State<Aboutus> createState() => _AboutusState();
// }
//
// class _AboutusState extends State<Aboutus> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('About Us', style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.red, // Red theme
//         elevation: 2,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Header Section with Heart Icon and Infinity Text
//               Center(
//                 child: Container(
//                   constraints: const BoxConstraints(maxWidth: 200),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Icon(
//                       Icons.favorite, // Heart icon
//                       size: 100,
//                       color: Colors.orange, // Orange color for heart
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Center(
//                 child: Text(
//                   'Infinity', // Text below the heart
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red[800],
//                     letterSpacing: 1.2,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 32),
//
//               // Meet Our Team Section
//               _buildSectionCard(
//                 'Meet Our Team',
//                 Column(
//                   children: [
//                     buildKeyValueRow('Developed by', 'Viraj Odedra (23010101178)'),
//                     buildKeyValueRow('Mentored by', 'Prof. Mehul Bhundiya\nComputer Engineering Department'),
//                     buildKeyValueRow('Explored by', 'ASWDC, School Of Computer Science'),
//                     buildKeyValueRow('Eulogized by', 'Darshan University, Rajkot, Gujarat - INDIA'),
//                   ],
//                 ),
//               ),
//
//               // About ASWDC Section
//               _buildSectionCard(
//                 'About ASWDC',
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset('assets/aboutusimages/darshanUniversity.jpg'),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset('assets/aboutusimages/aswdc.jpg'),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     _buildInfoText(),
//                   ],
//                 ),
//               ),
//
//               // Contact Section
//               _buildSectionCard(
//                 'Contact Us',
//                 Column(
//                   children: [
//                     buildContactRow(Icons.email, 'aswdc@darshan.ac.in'),
//                     buildContactRow(Icons.phone, '+91-9727747317'),
//                     buildContactRow(Icons.language, 'www.darshan.ac.in'),
//                   ],
//                 ),
//               ),
//
//               // Quick Links
//               _buildSectionCard(
//                 'Quick Links',
//                 Column(
//                   children: [
//                     _buildActionButton(Icons.share, 'Share App'),
//                     _buildActionButton(Icons.apps, 'More Apps'),
//                     _buildActionButton(Icons.star, 'Rate Us'),
//                     _buildActionButton(Icons.thumb_up, 'Like us on Facebook'),
//                     _buildActionButton(Icons.update, 'Check For Update'),
//                   ],
//                 ),
//               ),
//
//               // Footer
//               const SizedBox(height: 24),
//               _buildFooter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionCard(String title, Widget content) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 24),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red[800],
//                 letterSpacing: 0.5,
//               ),
//             ),
//             const Divider(color: Colors.red, thickness: 1.5, height: 24),
//             content,
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildActionButton(IconData icon, String label) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(8),
//         onTap: () {},
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//           child: Row(
//             children: [
//               Icon(icon, color: Colors.red[600], size: 22),
//               const SizedBox(width: 16),
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.red[700],
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoText() {
//     return Text(
//       'ASWDC is Application, Software and Website Development Center @ Darshan University...',
//       style: TextStyle(
//         fontSize: 15,
//         height: 1.5,
//         color: Colors.grey[800],
//       ),
//     );
//   }
//
//   Widget _buildFooter() {
//     return Center(
//       child: RichText(
//         textAlign: TextAlign.center,
//         text: TextSpan(
//           style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.5),
//           children: [
//             const TextSpan(text: '© 2025 Darshan University\n'),
//             const TextSpan(text: 'All Rights Reserved - Privacy Policy\n'),
//             const TextSpan(text: 'Made with '),
//             WidgetSpan(
//               child: Icon(Icons.favorite, color: Colors.red, size: 14),
//             ),
//             const TextSpan(text: ' in India'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildKeyValueRow(String key, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(flex: 2, child: Text('$key: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[700]))),
//           Expanded(flex: 3, child: Text(value, style: TextStyle(color: Colors.red[600]))),
//         ],
//       ),
//     );
//   }
//
//   Widget buildContactRow(IconData icon, String info) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.red),
//           SizedBox(width: 8),
//           Text(info, style: TextStyle(color: Colors.red[600])),
//         ],
//       ),
//     );
//   }
//
//   Widget buildLinkRow(IconData icon, String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.red),
//           SizedBox(width: 8),
//           Text(title, style: TextStyle(color: Colors.red[600])),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Aboutus extends StatefulWidget {
//   const Aboutus({super.key});
//
//   @override
//   State<Aboutus> createState() => _AboutusState();
// }
//
// class _AboutusState extends State<Aboutus> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('About Us', style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.teal,
//         elevation: 2,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Header Section with Logo
//               Center(
//                 child: Container(
//                   constraints: const BoxConstraints(maxWidth: 200),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.asset('assets/aboutusimages/keyboard.jpg'),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: Text(
//                   'Typing Tutor',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.teal[800],
//                     letterSpacing: 1.2,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 32),
//
//               // Meet Our Team Section
//               _buildSectionCard(
//                 'Meet Our Team',
//                 Column(
//                   children: [
//                     buildKeyValueRow('Developed by', 'Viraj Odedra (23010101178)'),
//                     buildKeyValueRow('Mentored by', 'Prof. Mehul Bhundiya\nComputer Engineering Department'),
//                     buildKeyValueRow('Explored by', 'ASWDC, School Of Computer Science'),
//                     buildKeyValueRow('Eulogized by', 'Darshan University, Rajkot, Gujarat - INDIA'),
//                   ],
//                 ),
//               ),
//
//               // About ASWDC Section
//               _buildSectionCard(
//                 'About ASWDC',
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset('assets/aboutusimages/darshanUniversity.jpg'),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset('assets/aboutusimages/aswdc.jpg'),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     _buildInfoText(),
//                   ],
//                 ),
//               ),
//
//               // Contact Section
//               _buildSectionCard(
//                 'Contact Us',
//                 Column(
//                   children: [
//                     buildContactRow(Icons.email, 'aswdc@darshan.ac.in'),
//                     buildContactRow(Icons.phone, '+91-9727747317'),
//                     buildContactRow(Icons.language, 'www.darshan.ac.in'),
//                   ],
//                 ),
//               ),
//
//               // Quick Links
//               _buildSectionCard(
//                 'Quick Links',
//                 Column(
//                   children: [
//                     _buildActionButton(Icons.share, 'Share App'),
//                     _buildActionButton(Icons.apps, 'More Apps'),
//                     _buildActionButton(Icons.star, 'Rate Us'),
//                     _buildActionButton(Icons.thumb_up, 'Like us on Facebook'),
//                     _buildActionButton(Icons.update, 'Check For Update'),
//                   ],
//                 ),
//               ),
//
//               // Footer
//               const SizedBox(height: 24),
//               _buildFooter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionCard(String title, Widget content) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 24),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal[800],
//                 letterSpacing: 0.5,
//               ),
//             ),
//             const Divider(color: Colors.teal, thickness: 1.5, height: 24),
//             content,
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildActionButton(IconData icon, String label) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(8),
//         onTap: () {},
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//           child: Row(
//             children: [
//               Icon(icon, color: Colors.teal[600], size: 22),
//               const SizedBox(width: 16),
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.teal[700],
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoText() {
//     return Text(
//       'ASWDC is Application, Software and Website Development Center @ Darshan University...',
//       style: TextStyle(
//         fontSize: 15,
//         height: 1.5,
//         color: Colors.grey[800],
//       ),
//     );
//   }
//
//   Widget _buildFooter() {
//     return Center(
//       child: RichText(
//         textAlign: TextAlign.center,
//         text: TextSpan(
//           style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.5),
//           children: [
//             const TextSpan(text: '© 2025 Darshan University\n'),
//             const TextSpan(text: 'All Rights Reserved - Privacy Policy\n'),
//             const TextSpan(text: 'Made with '),
//             WidgetSpan(
//               child: Icon(Icons.favorite, color: Colors.red, size: 14),
//             ),
//             const TextSpan(text: ' in India'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildKeyValueRow(String key, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(flex: 2, child: Text('$key: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal[700]))),
//           Expanded(flex: 3, child: Text(value, style: TextStyle(color: Colors.teal[600]))),
//         ],
//       ),
//     );
//   }
//
//   Widget buildContactRow(IconData icon, String info) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.teal),
//           SizedBox(width: 8),
//           Text(info, style: TextStyle(color: Colors.teal[600])),
//         ],
//       ),
//     );
//   }
//
//   Widget buildLinkRow(IconData icon, String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.teal),
//           SizedBox(width: 8),
//           Text(title, style: TextStyle(color: Colors.teal[600])),
//         ],
//       ),
//     );
//   }
// }
