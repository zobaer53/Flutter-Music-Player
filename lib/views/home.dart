import 'package:flutter/material.dart';
import 'package:flutter_music_player/consts/colors.dart';
import 'package:flutter_music_player/controllers/player_controller.dart';
import 'package:get/get.dart';
import '../consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //set controller to getX
    var playerController = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(onPressed: (){
          }, icon: const Icon(Icons.search, color: whiteColor,))
        ],
        leading: const Icon(Icons.sort_rounded,color: whiteColor,),
        title: Text('Beats',
        style: myTextStyle(
          family: bold,
          size: 18,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 100,
            itemBuilder: (BuildContext context, int index){
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  tileColor: bgColor,
                  title: Text('Music Name',
                  style: myTextStyle(
                    family: bold,
                    size: 15,
                  ),
                  ),
                  subtitle: Text('Artist Name',
                  style: myTextStyle(
                      family:regular,
                      size: 12,
                  ),
                ),
                  leading: const Icon(Icons.music_note, color: whiteColor,size: 32,),
                  trailing: const Icon(Icons.play_arrow, color: whiteColor, size: 26,),
                )
            );
          }
          ),
      ),
    );
  }
}
