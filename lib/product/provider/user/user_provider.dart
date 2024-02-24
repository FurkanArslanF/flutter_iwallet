import 'package:flutter_iwallet/product/model/base/base_response.dart';
import 'package:flutter_iwallet/product/model/user/user_response.dart';
import 'package:flutter_iwallet/product/service/user/users.dart';
import 'package:riverpod/riverpod.dart';

final userListProvider = FutureProvider<BaseResponseModel<List<UsersResponseModel>>>((ref) async {
  return UserService.instance.getUsers();
});

final userSearchStateProvider = StateNotifierProvider(
  (ref) {
    return UserSearchNotifier();
  },
);

class UserSearchNotifier extends StateNotifier<List<UsersResponseModel>?> {
  UserSearchNotifier() : super(null);

  void notify(List<UsersResponseModel>? data) {
    state = data;
  }

  void clear() {
    state = null;
  }
}
