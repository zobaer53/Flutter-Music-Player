import 'dart:ui';

import 'package:flutter_music_player/consts/colors.dart';

const bold = 'bold';
const regular = 'regular';

textStyle({family = "regular", double? size = 14,    color = whitebgColor}){
  TextStyle(
      fontSize: size,
      color: color,
      fontFamily: family
  )
}