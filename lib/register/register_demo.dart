import 'package:flutter/material.dart';

import 'registry_page.dart';

// void main() {
//   runApp(const MyApp());
// }

class RegisterDemo extends StatelessWidget {
  const RegisterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegistryPage(),
    );
  }
}
