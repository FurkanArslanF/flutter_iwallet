import 'package:flutter/material.dart';

@immutable
class BaseResponseModel<T> {
  final T? data;
  final String? message;
  final int? statusCode;

  const BaseResponseModel({
    this.data,
    this.message,
    this.statusCode,
  });

  BaseResponseModel copyWith({
    T? data,
    String? message,
    int? statusCode,
  }) =>
      BaseResponseModel(
        data: data ?? this.data,
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
      );

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
        data: json["data"],
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "statusCode": statusCode,
      };
}
