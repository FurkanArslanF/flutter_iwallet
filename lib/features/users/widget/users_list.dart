import 'package:flutter/material.dart';
import 'package:flutter_iwallet/core/utils/context.dart';
import 'package:flutter_iwallet/core/widget/image/network_image.dart';
import 'package:flutter_iwallet/features/users/widget/users_dialog.dart';
import 'package:flutter_iwallet/product/model/user/user_response.dart';
import 'package:flutter_iwallet/product/provider/user/user_image_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersPageList extends ConsumerWidget {
  const UsersPageList({super.key, required this.usersData});
  final UsersResponseModel usersData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userImage = ref.watch(userImageProvider(usersData.id ?? 0)).value;
    return Card(
      child: ListTile(
        leading: ClipOval(
          child: SizedBox(
            height: context.responsiveWidth(12),
            width: context.responsiveWidth(12),
            child: AppNetworkImage(path: userImage ?? ''),
          ),
        ),
        title: Text(usersData.name ?? ''),
        subtitle: Text(usersData.username ?? ''),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => UsersDetailDialog(userImage: userImage ?? '', usersData: usersData),
          );
        },
      ),
    );
  }
}
