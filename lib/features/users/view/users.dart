import 'package:flutter/material.dart';
import 'package:flutter_iwallet/core/utils/context.dart';
import 'package:flutter_iwallet/core/widget/appbar/appbar.dart';
import 'package:flutter_iwallet/core/widget/circle_progress/circle_progress.dart';
import 'package:flutter_iwallet/features/users/mixin/user_page_mixin.dart';
import 'package:flutter_iwallet/features/users/widget/search_bar.dart';
import 'package:flutter_iwallet/features/users/widget/users_list.dart';
import 'package:flutter_iwallet/product/constant/string_constant.dart';
import 'package:flutter_iwallet/product/model/user/user_response.dart';
import 'package:flutter_iwallet/product/provider/user/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersPageView extends ConsumerWidget with UsersPageViewMixin {
  const UsersPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var usersProvider = ref.watch(userListProvider);
    var userSearchProvider = ref.watch(userSearchStateProvider) as List<UsersResponseModel>?;
    return Scaffold(
      appBar: normalAppBar("IPerson"),
      body: usersProvider.when(
        data: (usersData) {
          return Padding(
            padding: EdgeInsets.all(context.responsiveWidth(5)),
            child: Column(
              children: [
                UsersPageSearch(usersData: usersData.data as List<UsersResponseModel>),
                SizedBox(height: context.responsiveWidth(2)),
                Flexible(
                  flex: 10,
                  child: isUserNotFound(userSearchProvider)
                      ? const Center(child: Text(AppStrings.userNotFound))
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: userSearchProvider?.length ?? usersData.data?.length,
                          itemBuilder: (context, index) {
                            return UsersPageList(usersData: userSearchProvider?[index] ?? usersData.data?[index]);
                          },
                        ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return const Center(child: Text('Failed to load users'));
        },
        loading: () {
          return const AppCircleProgress();
        },
      ),
    );
  }
}
