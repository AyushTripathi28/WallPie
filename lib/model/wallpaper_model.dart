class WallpaperModel {
  String photographer;
  // ignore: non_constant_identifier_names
  String photographer_url;
  // ignore: non_constant_identifier_names
  int photographer_id;
  SrcModel src;
  // ignore: non_constant_identifier_names
  WallpaperModel(
      {this.src,
      // ignore: non_constant_identifier_names
      this.photographer_url,
      // ignore: non_constant_identifier_names
      this.photographer_id,
      this.photographer});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsonData["src"]),
        photographer_url: jsonData["photographer_url"],
        photographer_id: jsonData["photographer_id"],
        photographer: jsonData["photographer"]);
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;
  SrcModel({this.portrait, this.original, this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        portrait: jsonData["portrait"],
        original: jsonData["original"],
        small: jsonData["small"]);
  }
}
