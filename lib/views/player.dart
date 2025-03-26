import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/consts/colors.dart';
import 'package:flutter_music_player/consts/text_style.dart';
import 'package:get/get.dart';
import '../controllers/player_controller.dart';
import '../models/song_model.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key, required this.songList});

  final List<SongModel> songList;

  @override
  Widget build(BuildContext context) {
    var playerController = Get.put(PlayerController());
    var currentSongIndex = playerController.playIndex;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back, color: whiteColor,)
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.music_note, size: 48, color: whiteColor),
                ),
              ),
              const SizedBox(height: 12,),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    color: whiteColor,
                  ),
                  child: Column(
                    children: [
                      Text(
                        songList[currentSongIndex.value].displayNameWOExt,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: myTextStyle(size: 24, color: bgDarkColor, family: bold),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        songList[playerController.playIndex.value].artist ?? "Unknown Artist",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: myTextStyle(size: 18, color: bgDarkColor,),
                      ),
                      SizedBox(height: 12,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => Row(
                            children: [
                              Text(playerController.position.value, style: myTextStyle(color: bgDarkColor),),
                              Expanded(
                                child: Slider(
                                  activeColor: sliderColor,
                                  inactiveColor: bgDarkColor,
                                  min: Duration(seconds: 0).inSeconds.toDouble(),
                                  max: playerController.durationInDouble.value,
                                  value: playerController.positionToDouble.value, 
                                  onChanged: (newValue) {
                                    playerController.changeDurationToString(newValue.toInt());
                                    newValue = newValue;
                                  }
                                )
                              ),
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
                          IconButton(
                            onPressed: () {
                              if (currentSongIndex.value == 0) {
                                currentSongIndex.value = songList.length - 1;
                                playerController.playSong(songList[currentSongIndex.value].uri, currentSongIndex.value);
                              } else {
                                --currentSongIndex.value;
                                playerController.playSong(songList[currentSongIndex.value].uri, currentSongIndex.value);
                              }
                            }, 
                            icon: Icon(Icons.skip_previous_outlined, size: 40,),
                          ),
                          Transform.scale(
                            scale: 2,
                            child: Obx(
                              () => CircleAvatar(
                                backgroundColor: bgColor,
                                child: IconButton(
                                  onPressed: () {
                                    if (playerController.isPlaying.value) {
                                      playerController.pausePlay();
                                    } else {
                                      playerController.pausePlay();
                                    }
                                  }, 
                                  icon: Icon(
                                    playerController.isPlaying.value ? Icons.pause : Icons.play_arrow,
                                    color: whiteColor,
                                  ),
                                )
                              ),
                            )
                          ),
                          IconButton(
                            onPressed: () {
                              if (currentSongIndex.value == songList.length - 1) {
                                currentSongIndex.value = 0;
                                playerController.playSong(songList[currentSongIndex.value].uri, currentSongIndex.value);
                              } else {
                                ++currentSongIndex.value;
                                playerController.playSong(songList[currentSongIndex.value].uri, currentSongIndex.value);
                              }
                            }, 
                            icon: Icon(Icons.skip_next_outlined, size: 40,),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
