import 'screen_size.dart';

ScreenSize getScreenSize(double maxWidth) {
  ScreenSize screenSize;
  if (maxWidth <= 600)
    screenSize = ScreenSize.SMALL;
  else if (maxWidth > 600 && maxWidth <= 900)
    screenSize = ScreenSize.NORMAL;
  else if (maxWidth > 900 && maxWidth <= 1200)
    screenSize = ScreenSize.MEDIUM;
  else
    screenSize = ScreenSize.LARGE;
  return screenSize;
}
