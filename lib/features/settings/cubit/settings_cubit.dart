import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/base/base_cubit.dart';
import '../../../core/base/base_state.dart';
import '../../../core/services/locator.dart';

class SettingsState extends BaseState {
  final ThemeMode themeMode;
  final bool notificationsEnabled;

  const SettingsState({
    super.status,
    super.errorMessage,
    this.themeMode = ThemeMode.system,
    this.notificationsEnabled = true,
  });

  @override
  List<Object?> get props => [...super.props, themeMode, notificationsEnabled];

  SettingsState copyWith({
    BaseStatus? status,
    String? errorMessage,
    ThemeMode? themeMode,
    bool? notificationsEnabled,
  }) {
    return SettingsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      themeMode: themeMode ?? this.themeMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}

class SettingsCubit extends BaseCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState()) {
    _loadSettings();
  }

  static const String _themeKey = 'theme_mode';
  static const String _notificationsKey = 'notifications_enabled';

  void _loadSettings() {
    final prefs = locator<SharedPreferences>();

    final themeIndex = prefs.getInt(_themeKey);
    final themeMode = themeIndex != null
        ? ThemeMode.values[themeIndex]
        : ThemeMode.system;

    final notificationsEnabled = prefs.getBool(_notificationsKey) ?? true;

    emit(
      state.copyWith(
        themeMode: themeMode,
        notificationsEnabled: notificationsEnabled,
      ),
    );
  }

  Future<void> toggleTheme(bool isDark) async {
    final mode = isDark ? ThemeMode.dark : ThemeMode.light;
    final prefs = locator<SharedPreferences>();
    await prefs.setInt(_themeKey, mode.index);
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> toggleNotifications(bool enabled) async {
    final prefs = locator<SharedPreferences>();
    await prefs.setBool(_notificationsKey, enabled);
    emit(state.copyWith(notificationsEnabled: enabled));
  }
}
