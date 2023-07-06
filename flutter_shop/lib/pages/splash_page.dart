import 'package:flutter/material.dart';

/**
 * @author [Frederic Chien]
 * @email [contato@kyuubi.com.br]
 * @create date 06-07-2023 17:13:43
 * @modify date 06-07-2023 17:13:43
 * @desc [description]
 */
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeSplash() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    initializeSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/home.jpg"),
      ),
    );
    ;
  }
}
