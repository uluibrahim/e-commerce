class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();
  ImageConstants._init();

  String toPng(String name) => 'assets/images/$name.png';
  String toJpg(String name) => 'assets/images/$name.jpg';
  String toGif(String name) => 'assets/gif/$name.gif';
}
