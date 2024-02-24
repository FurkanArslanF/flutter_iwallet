import 'package:flutter/material.dart';
import 'package:flutter_iwallet/core/utils/context.dart';
import 'package:flutter_iwallet/core/widget/button/close_button.dart';
import 'package:flutter_iwallet/core/widget/image/network_image.dart';
import 'package:flutter_iwallet/product/constant/string_constant.dart';
import 'package:flutter_iwallet/product/model/user/user_response.dart';

class UsersDetailDialog extends StatelessWidget {
  const UsersDetailDialog({super.key, required this.userImage, required this.usersData});
  final String userImage;
  final UsersResponseModel? usersData;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: context.responsiveWidth(145),
        padding: EdgeInsets.all(context.responsiveWidth(5)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(alignment: Alignment.topRight, child: AppCloseButton()),
              SizedBox(height: context.responsiveWidth(1)),
              ClipOval(child: SizedBox(height: context.responsiveWidth(50), width: context.responsiveWidth(50), child: AppNetworkImage(path: userImage))),
              SizedBox(height: context.responsiveWidth(5)),
              UserInfoText(title: usersData?.name ?? '', textStyle: TextStyle(fontSize: context.responsiveText(11), fontWeight: FontWeight.bold)),
              UserInfoText(title: "@${usersData?.username ?? ''}", textStyle: TextStyle(fontSize: context.responsiveText(11))),
              SizedBox(height: context.responsiveWidth(5)),
              UserInfoRow(title: AppStrings.email, value: usersData?.email ?? ''),
              SizedBox(height: context.responsiveWidth(2)),
              UserInfoRow(title: AppStrings.phone, value: usersData?.phone ?? ''),
              SizedBox(height: context.responsiveWidth(2)),
              UserInfoRow(title: AppStrings.address, value: "${usersData?.address?.street ?? ''} ${usersData?.address?.suite ?? ''}"),
              SizedBox(height: context.responsiveWidth(2)),
              UserInfoRow(title: AppStrings.city, value: usersData?.address?.city ?? ''),
              SizedBox(height: context.responsiveWidth(2)),
              UserInfoRow(title: AppStrings.location, value: "${usersData?.address?.geo?.lat ?? ''} ${usersData?.address?.geo?.lng ?? ''}"),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoText extends StatelessWidget {
  const UserInfoText({super.key, required this.title, this.textStyle});
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: textStyle);
  }
}

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.responsiveWidth(4)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            text: "$title: ",
            style: TextStyle(fontSize: context.responsiveText(12), color: Colors.black),
            children: [
              TextSpan(
                text: value,
                style: TextStyle(fontSize: context.responsiveText(12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
