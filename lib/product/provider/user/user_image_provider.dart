import 'package:flutter_iwallet/product/service/user/users_image.dart';
import 'package:riverpod/riverpod.dart';

final userImageProvider = FutureProvider.family<String, int>((ref, userId) async {
  var userImage = await UserImageService.instance.getUsersImage(userId: userId).then((value) => value.data?.downloadUrl ?? '');
  return userImage;
});
