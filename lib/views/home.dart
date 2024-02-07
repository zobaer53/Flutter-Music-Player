import 'package:flutter/material.dart';
import 'package:flutter_music_player/consts/colors.dart';
import 'package:flutter_music_player/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.search, color: bgColor,))
        ],
        leading: const Icon(Icons.sort_rounded,color: bgColor,),
        title: Text('Beats',
        style: textStyle(
          family: bold,
          size: 18
        ),),
      ),
      body: Container(),
    );
  }
}
