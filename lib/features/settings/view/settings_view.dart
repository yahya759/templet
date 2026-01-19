import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildProfileCard(context),
                  const SizedBox(height: 30),
                  Text(
                    'Preferences',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildSettingsSection(context, state),
                  const SizedBox(height: 30),
                  _buildLogoutButton(context),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade300,
            Colors.blueAccent.shade100,
            Colors.indigo.shade300,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 55, color: Colors.blue.shade300),
          ),
          const SizedBox(height: 15),
          const Text(
            'User Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'user@example.com',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context, SettingsState state) {
    return Column(
      children: [
        _buildSettingsTile(
          context,
          icon: Icons.dark_mode_outlined,
          title: 'Dark Mode',
          trailing: Switch(
            value: state.themeMode == ThemeMode.dark,
            onChanged: (value) {
              context.read<SettingsCubit>().toggleTheme(value);
            },
          ),
        ),
        const Divider(height: 1),
        _buildSettingsTile(
          context,
          icon: Icons.notifications_none_outlined,
          title: 'Notifications',
          trailing: Switch(
            value: state.notificationsEnabled,
            onChanged: (value) {
              context.read<SettingsCubit>().toggleNotifications(value);
            },
          ),
        ),
        const Divider(height: 1),
        _buildSettingsTile(
          context,
          icon: Icons.help_outline,
          title: 'Help & Support',
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: theme.colorScheme.onSurface, size: 26),
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onSurface,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Icon(Icons.logout, color: theme.colorScheme.error, size: 26),
            const SizedBox(width: 15),
            Text(
              'Log Out',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
