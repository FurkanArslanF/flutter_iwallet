import 'package:flutter/material.dart';
import 'package:flutter_iwallet/core/utils/context.dart';
import 'package:flutter_iwallet/core/widget/search_bar/search_bar.dart';
import 'package:flutter_iwallet/product/constant/string_constant.dart';
import 'package:flutter_iwallet/product/model/user/user_response.dart';
import 'package:flutter_iwallet/product/provider/user/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersPageSearch extends ConsumerStatefulWidget {
  const UsersPageSearch({super.key, required this.usersData});
  final List<UsersResponseModel> usersData;

  @override
  ConsumerState<UsersPageSearch> createState() => _UsersPageSearchState();
}

class _UsersPageSearchState extends ConsumerState<UsersPageSearch> {
  late final TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.responsiveWidth(90),
      height: context.responsiveWidth(10),
      child: AppSearchBar(
        controller: _searchController,
        hintText: AppStrings.searchButton,
        onClearPressed: () {
          _searchController.clear();
          ref.read(userSearchStateProvider.notifier).clear();
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            var filteredUsers = widget.usersData.where((user) => user.username?.toLowerCase().contains(value.toLowerCase()) ?? false).toList();
            ref.read(userSearchStateProvider.notifier).notify(filteredUsers);
          } else {
            ref.read(userSearchStateProvider.notifier).clear();
          }
        },
      ),
    );
  }
}
