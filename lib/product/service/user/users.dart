import 'dart:io';

import 'package:flutter_iwallet/product/model/base/base_response.dart';
import 'package:flutter_iwallet/product/model/user/user_response.dart';
import 'package:flutter_iwallet/product/service/path/service_path.dart';
import 'package:http/http.dart' as http;

class UserService {
  UserService._();
  static final UserService instance = UserService._();

  Future<BaseResponseModel<List<UsersResponseModel>>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(ServicePath.instance.getUsersPath));
      if (response.statusCode == HttpStatus.ok) {
        final data = response.body;
        final usersResponse = usersResponseModelFromJson(data);
        return BaseResponseModel(data: usersResponse, statusCode: response.statusCode, message: 'Success');
      }
      return BaseResponseModel(data: null, statusCode: response.statusCode, message: 'Failed');
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }
}
