import 'package:merchant_app/utils/path.dart';

class Item {
  String imageBannerPath;
  List<String> imagePreviewPathList;

  Item({required this.imageBannerPath, required this.imagePreviewPathList});
}

var items = [
  Item(imageBannerPath: '${Path.images}/monstadt_vision_banner.png',
      imagePreviewPathList: [
        '${Path.images}/monstadt_vision_01.png',
        '${Path.images}/monstadt_vision_02.png',
        '${Path.images}/monstadt_vision_03.png',
        '${Path.images}/monstadt_vision_04.png',
        '${Path.images}/monstadt_vision_05.png',
        '${Path.images}/monstadt_vision_06.png',
        '${Path.images}/monstadt_vision_07.png',
      ])
];