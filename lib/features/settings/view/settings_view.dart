import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: state.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  context.read<SettingsCubit>().toggleTheme(value);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
