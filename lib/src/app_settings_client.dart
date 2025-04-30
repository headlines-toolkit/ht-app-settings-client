// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:ht_app_settings_client/src/models/app_language.dart';
import 'package:ht_app_settings_client/src/models/display_settings.dart';

/// {@template ht_app_settings_client}
/// Defines the interface for managing user-configurable application settings
/// related to appearance and language.
///
/// This client provides a contract for persisting and retrieving settings
/// like theme, font preferences, and language selection. Concrete implementations
/// (e.g., using shared_preferences, Hive, etc.) will handle the actual storage
/// mechanism.
/// {@endtemplate}
abstract class HtAppSettingsClient {
  /// {@macro ht_app_settings_client}
  const HtAppSettingsClient();

  // --- Display Settings ---

  /// Retrieves the currently saved display settings.
  ///
  /// Implementations should return a default [DisplaySettings] object if no
  /// settings have been previously saved.
  Future<DisplaySettings> getDisplaySettings();

  /// Saves the provided display settings.
  ///
  /// Persists the entire [DisplaySettings] object.
  Future<void> setDisplaySettings(DisplaySettings settings);

  /// Provides a stream that emits the current [DisplaySettings] whenever they
  /// change.
  ///
  /// The stream should emit the current settings immediately upon listening.
  Stream<DisplaySettings> watchDisplaySettings();

  // --- Language ---

  /// Retrieves the currently saved application language code (ISO 639-1).
  ///
  /// Implementations should return a default language code (e.g., 'en') if no
  /// language has been previously saved.
  Future<AppLanguage> getLanguage();

  /// Saves the selected application language code.
  Future<void> setLanguage(AppLanguage language);

  /// Provides a stream that emits the current language code whenever it changes.
  ///
  /// The stream should emit the current language immediately upon listening.
  Stream<AppLanguage> watchLanguage();

  // --- General ---

  /// Clears all settings managed by this client.
  ///
  /// Resets all stored preferences to their default state. Useful for logout
  /// or reset functionality. Implementations should ensure subsequent `get` calls
  /// return the default values.
  Future<void> clearSettings();
}
