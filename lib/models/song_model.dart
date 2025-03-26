class SongModel {
  final int id;
  final String displayNameWOExt;
  final String? artist;
  final String uri;

  SongModel({
    required this.id,
    required this.displayNameWOExt,
    this.artist,
    required this.uri,
  });
} 