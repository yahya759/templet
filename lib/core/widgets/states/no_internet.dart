import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off_outlined, size: 48, color: Colors.orange),
          SizedBox(height: 16),
          Text('No Internet Connection'),
        ],
      ),
    );
  }
}
