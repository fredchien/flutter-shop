/**
 * @author [Frederic Chien]
 * @email [contato@kyuubi.com.br]
 * @create date 06-07-2023 10:47:21
 * @modify date 06-07-2023 10:47:21
 * @desc [description]
 */
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/shop.dart';
import 'package:flutter_shop/pages/splash_page.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Shop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: const HomePage(),
        initialRoute: '/splash',
        routes: {
          "/splash": (context) => SplashPage(),
          "/home": (context) => HomePage(),
        },
      ),
    );
  }
}
