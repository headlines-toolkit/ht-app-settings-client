// ignore_for_file: lines_longer_than_80_chars

// import 'dart:async';

// import 'package:ht_app_settings_client/src/models/app_language.dart';
// import 'package:ht_app_settings_client/src/models/display_settings.dart';
// import 'package:ht_shared/ht_shared.dart';

/// {@template ht_app_settings_client}
/// Defines the interface for managing user-configurable application settings
/// related to appearance and language.
///
/// This client provides a contract for persisting and retrieving settings
/// like theme, font preferences, and language selection. Concrete implementations
/// (e.g., using shared_preferences, Hive, etc.) will handle the actual storage
/// mechanism.
/// {@endtemplate}
// abstract class HtAppSettingsClient {
//   /// {@macro ht_app_settings_client}
//   const HtAppSettingsClient();

//   // --- Display Settings ---

//   /// Retrieves the currently saved display settings for the specified user.
//   ///
//   /// - [userId]: The unique identifier of the user.
//   /// Implementations should return a default [DisplaySettings] object if no
//   /// settings have been previously saved.
//   ///
//   /// Throws [HtHttpException] or its subtypes on failure.
//   /// Can also throw other exceptions during serialization.
//   Future<DisplaySettings> getDisplaySettings({required String userId});

//   /// Saves the provided display settings for the specified user.
//   ///
//   /// - [userId]: The unique identifier of the user.
//   /// - [settings]: The display settings to save.
//   /// Persists the entire [DisplaySettings] object.
//   ///
//   /// Throws [HtHttpException] or its subtypes on failure.
//   /// Can also throw other exceptions during serialization.
//   Future<void> setDisplaySettings({
//     required String userId,
//     required DisplaySettings settings,
//   });

//   // --- Language ---

//   /// Retrieves the currently saved application language code (ISO 639-1) for the specified user.
//   ///
//   /// - [userId]: The unique identifier of the user.
//   /// Implementations should return a default language code (e.g., 'en') if no
//   /// language has been previously saved.
//   ///
//   /// Throws [HtHttpException] or its subtypes on failure.
//   /// Can also throw other exceptions during serialization.
//   Future<AppLanguage> getLanguage({required String userId});

//   /// Saves the selected application language code for the specified user.
//   ///
//   /// - [userId]: The unique identifier of the user.
//   /// - [language]: The language code to save.
//   /// Throws [HtHttpException] or its subtypes on failure.
//   /// Can also throw other exceptions during serialization.
//   Future<void> setLanguage({
//     required String userId,
//     required AppLanguage language,
//   });

//   // --- General ---

//   /// Clears all settings managed by this client for the specified user.
//   ///
//   /// - [userId]: The unique identifier of the user.
//   /// Resets all stored preferences to their default state. Useful for logout
//   /// or reset functionality. Implementations should ensure subsequent `get` calls
//   /// return the default values.
//   ///
//   /// Throws [HtHttpException] or its subtypes on failure.
//   /// Can also throw other exceptions during serialization.
//   Future<void> clearSettings({required String userId});
// }
