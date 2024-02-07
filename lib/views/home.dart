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
                  strutStyle: textStyle(
                    family: bold,
                    size: 15
                  ),
                  ),
                  subtitle: Text('Artist Name',
                  strutStyle: textStyle(
                      family:regular,
                      size: 12
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
