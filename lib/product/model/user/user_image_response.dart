import 'dart:convert';

UsersImageResponseModel usersImageResponseModelFromJson(String str) => UsersImageResponseModel.fromJson(json.decode(str));

String usersImageResponseModelToJson(UsersImageResponseModel data) => json.encode(data.toJson());

class UsersImageResponseModel {
  final String? id;
  final String? author;
  final int? width;
  final int? height;
  final String? url;
  final String? downloadUrl;

  UsersImageResponseModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  UsersImageResponseModel copyWith({
    String? id,
    String? author,
    int? width,
    int? height,
    String? url,
    String? downloadUrl,
  }) =>
      UsersImageResponseModel(
        id: id ?? this.id,
        author: author ?? this.author,
        width: width ?? this.width,
        height: height ?? this.height,
        url: url ?? this.url,
        downloadUrl: downloadUrl ?? this.downloadUrl,
      );

  factory UsersImageResponseModel.fromJson(Map<String, dynamic> json) => UsersImageResponseModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
