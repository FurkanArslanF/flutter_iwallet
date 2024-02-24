import 'package:flutter/material.dart';
import 'package:flutter_iwallet/core/utils/context.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, required this.hintText, required this.onChanged, this.onClearPressed, this.controller});
  final String hintText;
  final Function(String) onChanged;
  final void Function()? onClearPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: context.responsiveText(10),
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: onClearPressed,
          icon: const Icon(Icons.clear),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
