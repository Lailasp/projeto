import 'package:projeto/db/shared_prefs.dart';
import 'package:projeto/pages/home_page.dart' show HomePage2;
import 'package:projeto/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    await Future.delayed(Duration(seconds: 3));
    bool status = await SharedPrefs().getUserStatus();
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage2();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D9ABA),
      body: Center(
      child: Image.asset('assets/assests_image.png'),
     ),
    );
  }
}