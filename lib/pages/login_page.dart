import 'package:projeto/db/user_dao.dart';
import 'package:projeto/pages/resgister_page.dart';
import 'package:flutter/material.dart';
import 'package:projeto/pages/mensagens_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/assests_image2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /*Center(
              child: Text(
                    'PulmoVida',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
              ),*/
                SizedBox(height: 24),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    focusedBorder: buildUserOutlineInputBorder(),
                    border: buildUserOutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    focusedBorder: buildPasswordOutlineInputBorder(),
                    border: buildPasswordOutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3D9ABA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // <-- Radius
                    ),
                  ),
                  onPressed: onPressedMensagensPage,
                  child: Text(
                    'Acessar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // <-- Radius
                    ),
                  ),
                  onPressed: onPressedRegisterPage,
                  child: Text(
                    'Criar conta',
                    style: TextStyle(
                      backgroundColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    String user = userController.text;
    String password = passwordController.text;
    bool auth = await UserDao().login(user, password);
    if (auth) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage2();
          },
        ),
      );
    } else {
      print('Usuario e/ou senha incorretos!');
    }
  }

  OutlineInputBorder buildPasswordOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(8),
      ),
    );
  }

  OutlineInputBorder buildUserOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8),
      ),
    );
  }

  void onPressedMensagensPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MensagensPage();
          },
        ),
    );
  }

  void onPressedRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RegisterPage();
        },
      ),
    );
  }
}
