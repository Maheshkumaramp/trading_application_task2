import 'package:flutter/material.dart';
import 'package:trading_app_task2/helpers/colors.dart';
import 'package:trading_app_task2/helpers/config.dart';
import 'package:trading_app_task2/helpers/size_config.dart';
import 'package:trading_app_task2/ui/bottom_navigation.dart';
import 'package:trading_app_task2/ui/home_screen.dart';
import 'package:trading_app_task2/ui/wallet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Config.brightness = MediaQuery.of(context).platformBrightness;
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trading App',
      theme: ThemeData(
        backgroundColor: COLORS.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyNavigationBar(),
    );
  }
}


