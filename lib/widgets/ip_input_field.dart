import 'package:flutter/material.dart';

class IpInputField extends StatelessWidget {
  final TextEditingController controller;
  const IpInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Subnet (e.g. 172.67.14)',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.network_ping),
      ),
    );
  }
}
