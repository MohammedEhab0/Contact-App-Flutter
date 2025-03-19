import 'package:flutter/cupertino.dart';

class AppAssets {
  static Image Title = Image.asset('assets/images/Route.png');

  static Image AddImage(BuildContext context) {
    return Image.asset(
      'assets/images/image-not-preview-SKnaSYA7Kx.png',
      width: MediaQuery.of(context).size.width * 0.35,
    );
  }
}
