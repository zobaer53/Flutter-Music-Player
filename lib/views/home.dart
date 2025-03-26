import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/consts/colors.dart';
import 'package:flutter_music_player/controllers/player_controller.dart';
import 'package:flutter_music_player/views/player.dart';
import 'package:get/get.dart';
import '../consts/text_style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var playerController = Get.put(PlayerController());

  @override
  void initState() {
    super.initState();
    playerController.checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: whiteColor,
              ))
        ],
        leading: const Icon(
          Icons.sort_rounded,
          color: whiteColor,
        ),
        title: Text(
          'Beats',
          style: myTextStyle(
            family: bold,
            size: 18,
          ),
        ),
      ),
      body: Obx(
        () => playerController.audioPermissionGranted.value
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: playerController.songsList.length,
                itemBuilder: (BuildContext context, int index) {
                  var song = playerController.songsList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Obx(
                      () => ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        tileColor: bgColor,
                        title: Text(
                          song.displayNameWOExt,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: myTextStyle(
                            family: bold,
                            size: 15,
                          ),
                        ),
                        subtitle: Text(
                          '${song.artist}',
                          style: myTextStyle(
                            family: regular,
                            size: 12,
                          ),
                        ),
                        leading: const Icon(
                          Icons.music_note,
                          color: whiteColor,
                          size: 32,
                        ),
                        trailing: playerController.playIndex.value == index &&
                                playerController.isPlaying.value
                            ? const Icon(
                                Icons.pause,
                                color: whiteColor,
                                size: 26,
                              )
                            : null,
                        onTap: () {
                          Get.to(() => PlayerScreen(songList: playerController.songsList));
                          if (playerController.isPlaying.isFalse ||
                              playerController.playIndex.value != index) {
                            playerController.playSong(song.uri, index);
                          }
                        },
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  'No Song Found',
                  style: myTextStyle(),
                ),
              ),
      ),
    );
  }
}
