import 'dart:convert';

LaunchScrap launchScrapFromJson(String str) => LaunchScrap.fromJson(json.decode(str));

String launchScrapToJson(LaunchScrap data) => json.encode(data.toJson());

class LaunchScrap {
  String msg;
  String url;
  final title;
  String name;
  String ref;
  String weight;
  String ean;
  String especifications;
  final photos;

  LaunchScrap({
    required this.msg,
    required this.url,
    required this.title,
    required this.name,
    required this.ref,
    required this.weight,
    required this.ean,
    required this.especifications,
    required this.photos,
  });


  factory LaunchScrap.fromJson(Map<String, dynamic> json) => LaunchScrap(
    msg: json["msg"] == null ? null : json["msg"],
    url: json["url"] == null ? null : json["url"],
    title: json["title"] == null ? null : json["title"],
    name: json["name"] == null ? null : json["name"],
    ref: json["ref"] == null ? null : json["ref"],
    weight: json["weight"] == null ? null : json["weight"],
    ean: json["ean"] == null ? null : json["ean"],
    especifications: json["especifications"] == null ? null : json["especifications"],
    photos: json["photos"] == null ? null : List<String>.from(json["photos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg == null ? null : msg,
    "url": url == null ? null : url,
    "title": title == null ? null : title,
    "name": name == null ? null : name,
    "ref": ref == null ? null : ref,
    "weight": weight == null ? null : weight,
    "ean": ean == null ? null : ean,
    "especifications": especifications == null ? null : especifications,
    "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x)),
  };
}
