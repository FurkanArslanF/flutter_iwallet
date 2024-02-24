import 'package:flutter/material.dart';
import 'package:flutter_iwallet/core/widget/circle_progress/circle_progress.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      fit: BoxFit.cover,
      errorBuilder: (context, _, __) => const AppCircleProgress(),
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress != null ? const AppCircleProgress() : child;
      },
    );
  }
}
