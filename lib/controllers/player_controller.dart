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
  var duration = ''.obs;
  var position = ''.obs;

  var positionToDouble = 0.0.obs;
  var durationInDouble = 0.0.obs;

  @override

  void onInit() {
    super.onInit();
    checkPermission();
  }

  updateDuration(){
    audiPlayer.durationStream.listen((event) {
      duration.value = event.toString().split('.')[0];
      durationInDouble.value = event!.inSeconds.toDouble();
    });

    audiPlayer.positionStream.listen((event) {
      position.value = event.toString().split('.')[0];
      positionToDouble.value = event.inSeconds.toDouble();
    });
  }

  changeDurationToString(seconds){
    var duration = Duration(seconds: seconds);
    audiPlayer.seek(duration);
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
    if (kDebugMode) {
      print('index from controller ${playIndex.value}');
    }
   try{
     audiPlayer.setAudioSource(
         AudioSource.uri(Uri.parse(uri!))
     );
     audiPlayer.play();
     isPlaying = true.obs;
     updateDuration();

   }on Exception catch(e){
     isPlaying = false.obs;
     if (kDebugMode) {
       print(e);
     }
   }
  }

}
