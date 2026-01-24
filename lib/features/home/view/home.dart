import 'package:flutter/material.dart';
import 'package:flutter_app_starter/core/widgets/states/no_internet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: NoInternet(),
    );
  }
}
