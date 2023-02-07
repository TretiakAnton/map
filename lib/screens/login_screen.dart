import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageIcon(
          AssetImage('assets/images/map_img.png'),
        ),
        TextFormField(
          controller: emailController,
        ),
        TextFormField(),
      ],
    );
  }
}
