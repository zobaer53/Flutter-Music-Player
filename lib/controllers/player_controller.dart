import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/song_model.dart';

class PlayerController extends GetxController {
  var playIndex = 0.obs;
  var isPlaying = false.obs;
  var duration = '00:00'.obs;
  var position = '00:00'.obs;

  var positionToDouble = 0.0.obs;
  var durationInDouble = 1.0.obs; // Default to 1 to avoid division by zero

  var audioPermissionGranted = false.obs;
  var songsList = <SongModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Skip permission check in this simplified version
    audioPermissionGranted.value = true;
    _addDummySongs();
  }

  changeDurationToString(seconds) {
    // Mock function, would normally seek to position
    positionToDouble.value = seconds.toDouble();
    position.value = _formatDuration(Duration(seconds: seconds));
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  checkPermission() async {
    // Simplified permission check that always passes
    audioPermissionGranted.value = true;
    _addDummySongs();
  }

  _addDummySongs() {
    // Add some dummy songs for testing
    songsList.add(
      SongModel(
        id: 1,
        displayNameWOExt: "Demo Song 1",
        artist: "Demo Artist",
        uri: "https://example.com/song1.mp3",
      ),
    );
    songsList.add(
      SongModel(
        id: 2,
        displayNameWOExt: "Demo Song 2",
        artist: "Demo Artist",
        uri: "https://example.com/song2.mp3",
      ),
    );
    songsList.add(
      SongModel(
        id: 3,
        displayNameWOExt: "Demo Song 3",
        artist: "Demo Artist",
        uri: "https://example.com/song3.mp3",
      ),
    );
  }

  playSong(String? uri, index) {
    playIndex.value = index;
    if (kDebugMode) {
      print('Playing mock song at index: ${playIndex.value}');
    }
    // Mock behavior to simulate playing
    isPlaying.value = true;
    // Mock duration set
    durationInDouble.value = 180.0; // 3 minutes
    duration.value = "03:00";
  }

  pausePlay() {
    isPlaying.value = !isPlaying.value;
  }
}
