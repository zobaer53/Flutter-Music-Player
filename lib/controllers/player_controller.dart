import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController{

  final audioQuery = OnAudioQuery();

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
}
