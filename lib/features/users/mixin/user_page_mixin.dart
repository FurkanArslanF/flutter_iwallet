import 'package:flutter_iwallet/product/model/user/user_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin UsersPageViewMixin on ConsumerWidget {
  bool isUserNotFound(List<UsersResponseModel>? allUsers, List<UsersResponseModel>? searchResults) {
    return searchResults != null && searchResults.isEmpty && allUsers != null && allUsers.isNotEmpty;
  }
}
