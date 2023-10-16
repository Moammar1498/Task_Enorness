import 'package:flutter/material.dart';

class CardMiddle extends StatelessWidget {
  final String? salesPercentage;
  final String status;
  final Icon icon;
  final String label;
  const CardMiddle({
    super.key,
    this.salesPercentage,
    required this.status,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.05,
            width: MediaQuery.sizeOf(context).width * 0.15,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: Center(
                child: (salesPercentage != null)
                    ? Text('$salesPercentage%')
                    : icon),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label),
                Text(
                  status.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
