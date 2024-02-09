import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController{

  final audioQuery = OnAudioQuery();
  final audiPlayer = AudioPlayer();

  var  playIndex= 0.obs;
  var isPlaying = false.obs;

  @override

  void onInit() {
    super.onInit();
    checkPermission();
  }
   checkPermission() async {

    //grand storage permission
    var permissionStorage = await Permission.storage.request();
    var permissionAudio = await Permission.audio.request();

    if(permissionStorage.isGranted && permissionAudio.isGranted){
    }else {
      checkPermission();
    }
  }
  playSong(String? uri,index){
    playIndex.value = index;
   try{
     audiPlayer.setAudioSource(
         AudioSource.uri(Uri.parse(uri!))
     );
     audiPlayer.play();
     isPlaying = true.obs;

   }on Exception catch(e){
     isPlaying = false.obs;
     if (kDebugMode) {
       print(e);
     }
   }
  }

}
