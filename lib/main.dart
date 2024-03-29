import 'package:flutter/material.dart';
import 'package:flutter_music_player/consts/colors.dart';
import 'package:flutter_music_player/views/home.dart';
import 'package:get/get.dart';

import 'controllers/player_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //fontFamily: 'reqular',
        appBarTheme: const AppBarTheme(
           backgroundColor: bgDarkColor,
          //elevation: 0
        )
      ),
      home:const Home() ,
    );
  }
}
