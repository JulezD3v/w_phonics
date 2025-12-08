import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/images/mouse_nobg.png",
              width: 250,
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
