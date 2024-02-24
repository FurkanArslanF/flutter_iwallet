import 'package:flutter/material.dart';
import 'package:flutter_iwallet/core/theme/theme.dart';
import 'package:flutter_iwallet/features/users/view/users.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const UsersPageView(),
      theme: appTheme(context),
    );
  }
}
