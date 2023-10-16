import 'package:flutter/material.dart';
import 'package:task_enorness/utils/appcolors.dart';

class SellsSelectorWidget extends StatelessWidget {
  const SellsSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      padding: const EdgeInsets.all(4),
      child: const Center(child: Text('Weekly')),
    );
  }
}
