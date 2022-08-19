import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_screen/home_screen.dart';
import 'utils/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Trading UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kPrimaryTextColor,
              fontFamily: 'Onest',
            ),
        iconTheme: const IconThemeData(color: kPrimaryTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}
