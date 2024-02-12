import 'package:flutter/material.dart';
import 'package:flutter_music_player/consts/colors.dart';
import 'package:flutter_music_player/consts/text_style.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child:
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              alignment: Alignment.center,

              child: Icon(Icons.play_circle),
            ),
            ),
            const SizedBox(height: 12,),
            Expanded(child:
            Container(
              //width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  Text('Music Name',
                    style: myTextStyle(size: 24, color: bgDarkColor,family: bold),
                  ),
                  SizedBox(height: 12,),
                  Text('Artist Name',
                    style: myTextStyle(size: 18, color: bgDarkColor,),
                  ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('0:0', style: myTextStyle(color: bgDarkColor),),
                        Expanded(child: Slider(value: 0.0, onChanged: (newValue){})),
                        Text('04:00', style: myTextStyle(color: bgDarkColor),),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    IconButton(onPressed: () {  }, icon: Icon(Icons.skip_previous_outlined),),
                    Transform.scale(
                        scale: 2,
                        child: CircleAvatar(
                            backgroundColor: bgColor,
                            child: IconButton(onPressed: () {  }, icon: Icon(Icons.play_arrow,color: whiteColor,),))),
                    IconButton(onPressed: () {  }, icon: Icon(Icons.skip_next_outlined),),
                  ],)

                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
