import 'dart:ui';

import 'package:flutter_music_player/consts/colors.dart';

const bold = 'bold';
const regular = 'regular';

myTextStyle({family = 'regular', double? size = 14, color = whiteColor}){
  TextStyle(
      fontSize: size,
      color: color,
      fontFamily: family
  );
}