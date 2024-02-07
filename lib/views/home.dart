import 'package:flutter/material.dart';
import 'package:flutter_music_player/consts/colors.dart';
import 'package:flutter_music_player/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
          }, icon: const Icon(Icons.search, color: whiteColor,))
        ],
        leading: const Icon(Icons.sort_rounded,color: whiteColor,),
        title: Text('Beats',
        style: myTextStyle(
          family: bold,
          size: 18,
          color: whiteColor
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 100,
            itemBuilder: (BuildContext context, int index){
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: ListTile(
                  title: Text('Music Name',
                  strutStyle: myTextStyle(
                    family: bold,
                    size: 15,
                      color: whiteColor
                  ),
                  ),
                  subtitle: Text('Artist Name',
                  strutStyle: myTextStyle(
                      family:regular,
                      size: 12,
                    color: whiteColor
                  ),
                ),
                  leading: Icon(Icons.music_note, color: whiteColor,size: 32,),
                  trailing: Icon(Icons.play_arrow, color: whiteColor, size: 26,),
                )
            );
          }
          ),
      ),
    );
  }
}
