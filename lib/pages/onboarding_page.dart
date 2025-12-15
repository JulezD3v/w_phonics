import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:w_phonics/pages/login_page.dart';
import 'package:w_phonics/pages/signup_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //flutter_animate functional usage
          Image.asset("assets/images/mouse_nobg.png", width: 250, height: 250)
              .animate()
              .slideX(begin: -0.4, duration: Duration(seconds: 3))
              .fadeIn(duration: Duration(seconds: 2)),

          //flutter_animate widget based usage
          Animate(
            effects: [
              SlideEffect(
                duration: Duration(seconds: 3),
                begin: Offset(0.5, 0.3),
              ),
              FadeEffect(duration: Duration(milliseconds: 800))
            ],
            child: Image.asset(
              "assets/images/bee_nobg.png",
              width: 250,
              height: 250,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildOnboardingBottom(context),
    );
  }

  Widget _buildOnboardingBottom(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "W Phonics",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white,),
        ),
        Text(
          "The fun and interactive way to improve your kids reading and writing skills across all language",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.white,),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            spacing: 16,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                  },
                  child: Text("Sign up"),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
                onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
                child: Text("Sign in"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
