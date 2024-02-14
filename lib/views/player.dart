import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/consts/colors.dart';
import 'package:flutter_music_player/consts/text_style.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_query_platform_interface/src/models/song_model.dart';
import '../controllers/player_controller.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen( {super.key, required this.songList});

  final List<SongModel> songList;

  @override
  Widget build(BuildContext context) {
    var playerController = Get.put(PlayerController());
    var currentSongIndex =  playerController.playIndex.value;

    if (kDebugMode) {
      print('index from controller ${songList[currentSongIndex].id}');
    }
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child:
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,

              child: QueryArtworkWidget(
                id: songList[currentSongIndex].id, type: ArtworkType.AUDIO,
                artworkWidth: double.infinity,
                artworkHeight: double.infinity,
                nullArtworkWidget: Icon(Icons.music_note, size: 48,color: whiteColor,),
              ),
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
                  Text(songList[playerController.playIndex.value].displayNameWOExt,
                    style: myTextStyle(size: 24, color: bgDarkColor,family: bold),
                  ),
                  SizedBox(height: 12,),
                  Text(songList[playerController.playIndex.value].artist!,
                    style: myTextStyle(size: 18, color: bgDarkColor,),
                  ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      ()=> Row(
                        children: [
                          Text(playerController.position.value, style: myTextStyle(color: bgDarkColor),),
                          Expanded(child: Slider(
                              activeColor: sliderColor,
                              inactiveColor: bgDarkColor,
                              min: Duration(seconds: 0).inSeconds.toDouble(),
                              max: playerController.durationInDouble.value,
                              value: playerController.positionToDouble.value, onChanged: (newValue){
                                playerController.changeDurationToString(newValue.toInt());
                                newValue = newValue;
                          })),
                          Text(playerController.duration.value, style: myTextStyle(color: bgDarkColor),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    IconButton(onPressed: () {
                      //--playerController.playIndex.value;
                      playerController.playSong(songList[playerController.playIndex.value].uri, playerController.playIndex.value);

                    }, icon: Icon(Icons.skip_previous_outlined,size: 40,),),
                    Transform.scale(
                        scale: 2,
                        child: Obx(
                            () => CircleAvatar(
                              backgroundColor: bgColor,
                              child: IconButton(onPressed: () {
                               if(playerController.isPlaying.value){
                                 playerController.audiPlayer.pause();
                                 playerController.isPlaying.value = false;
                               }else{
                                 playerController.audiPlayer.play();
                                 playerController.isPlaying.value = true;
                               }

                              }, icon: Icon( playerController.isPlaying.value? Icons.pause : Icons.play_arrow,color: whiteColor,),)),
                        )),
                    IconButton(onPressed: () {  }, icon: Icon(Icons.skip_next_outlined,size: 40,),),
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
