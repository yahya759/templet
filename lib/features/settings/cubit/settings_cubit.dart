import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/base/base_cubit.dart';
import '../../../core/base/base_state.dart';
import '../../../core/services/locator.dart';

class SettingsState extends BaseState {
  final ThemeMode themeMode;

  const SettingsState({
    super.status,
    super.errorMessage,
    this.themeMode = ThemeMode.system,
  });

  @override
  List<Object?> get props => [...super.props, themeMode];

  SettingsState copyWith({
    BaseStatus? status,
    String? errorMessage,
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

class SettingsCubit extends BaseCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState()) {
    _loadTheme();
  }

  static const String _themeKey = 'theme_mode';

  void _loadTheme() {
    final prefs = locator<SharedPreferences>();
    final themeIndex = prefs.getInt(_themeKey);
    if (themeIndex != null) {
      emit(state.copyWith(themeMode: ThemeMode.values[themeIndex]));
    }
  }

  Future<void> toggleTheme(bool isDark) async {
    final mode = isDark ? ThemeMode.dark : ThemeMode.light;
    final prefs = locator<SharedPreferences>();
    await prefs.setInt(_themeKey, mode.index);
    emit(state.copyWith(themeMode: mode));
  }
}
