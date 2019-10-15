 import 'package:flutter/widgets.dart';
class SizeConfig {
static MediaQueryData _mediaQueryData;
static double screenWidth;
static double screenHeight;
static double blockSizeHorizontal;
static double blockSizeVertical;
static EdgeInsets buttonMargin;
static double defaultFontSize;
static void init(BuildContext context) {
_mediaQueryData = MediaQuery.of(context);
screenWidth = _mediaQueryData.size.width;
screenHeight = _mediaQueryData.size.height;
blockSizeHorizontal = screenWidth / 100;
blockSizeVertical = screenHeight / 100;
buttonMargin = EdgeInsets.only(bottom: blockSizeVertical * 6);
defaultFontSize = blockSizeVertical * 2;
}
}

// margin: EdgeInsets.only(
// top: SizeConfig.blockSizeVertical * 30,
// bottom: SizeConfig.blockSizeVertical * 1),
// width: SizeConfig.blockSizeHorizontal * 65,