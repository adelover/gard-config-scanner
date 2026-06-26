import 'package:flutter/material.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      color: Color(0xFF00E676),
      backgroundColor: Colors.grey,
    );
  }
}
