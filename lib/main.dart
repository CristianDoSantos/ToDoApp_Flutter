// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//pages
import './pages/home.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  
  runApp(Calculauto());
  
}
// main() => runApp(Calculauto());

class Calculauto extends StatelessWidget {
  const Calculauto({super.key});

  @override
  Widget build(BuildContext context) {
  final ThemeData theme = ThemeData();

    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.black,
          secondary: Colors.purple
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )
        ),
         appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 255, 206, 46),
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

