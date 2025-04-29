# app_settings_client

![coverage: 0%](https://img.shields.io/badge/coverage-0%25-red)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: PolyForm Free Trial](https://img.shields.io/badge/License-PolyForm%20Free%20Trial-blue)](https://polyformproject.org/licenses/free-trial/1.0.0)

A Dart package defining the interface for managing user-configurable application settings related to appearance and language.

## Description

This package provides a project-agnostic, abstract interface (`AppSettingsClient`) and associated data models (`DisplaySettings`, `AppLanguage`, enums) for managing user-configurable application settings. It focuses on settings typically controlled directly by the user via a settings UI, such as:

*   Display preferences (theme mode, accent color, font family, text scale, font weight)
*   Language selection

**Important:** This package defines the **contract (interface) only**. It does **not** include a concrete implementation for data persistence. A separate package (e.g., using `shared_preferences`, `hive`, or another storage mechanism) is required to implement the `AppSettingsClient` interface and handle the actual saving and loading of settings data.

## Getting Started

To use this interface in an implementation package or an application, add it to your `pubspec.yaml`:

```yaml
dependencies:
  app_settings_client:
    git:
      url: https://github.com/headlines-toolkit/ht-app-settings-client.git
```

Then, import the library:

```dart
import 'package:app_settings_client/app_settings_client.dart';
```

## Features

This package exports the following core components:

*   **`AppSettingsClient`**: The abstract interface defining methods for getting, setting, and watching settings (`getDisplaySettings`, `setDisplaySettings`, `watchDisplaySettings`, `getLanguage`, `setLanguage`, `watchLanguage`, `clearSettings`).
*   **`DisplaySettings`**: A model class grouping visual preferences:
    *   `baseTheme`: The base theme mode ([AppBaseTheme]).
    *   `accentTheme`: The selected accent color theme ([AppAccentTheme]).
    *   `fontFamily`: The chosen font family name (`String`).
    *   `textScaleFactor`: The text size preference ([AppTextScaleFactor]).
    *   `fontWeight`: The font weight preference ([AppFontWeight]).
*   **`AppLanguage`**: A typedef (`String`) representing the selected language code (e.g., 'en', 'ar').
*   **Supporting Enums**: `AppBaseTheme`, `AppAccentTheme`, `AppTextScaleFactor`, `AppFontWeight`.

## Usage

Applications or other packages should depend on a **concrete implementation** of the `AppSettingsClient` interface provided by a separate package.

This concrete instance would typically be initialized and provided to the application's widget tree or business logic layers using a dependency injection mechanism (like `provider`, `riverpod`, `get_it`, etc.).

**Conceptual Example (within an application):**

```dart
// Assuming 'myAppSettingsClient' is an instance of a concrete implementation
// obtained via dependency injection.

// Get the current display settings
final currentDisplaySettings = await myAppSettingsClient.getDisplaySettings();
print('Current base theme: ${currentDisplaySettings.baseTheme}');

// Watch for changes in display settings (e.g., to update the UI reactively)
myAppSettingsClient.watchDisplaySettings().listen((settings) {
  print('Display settings changed! New accent: ${settings.accentTheme}');
  // Trigger UI rebuild or theme update logic here
});

// Set a new language preference
await myAppSettingsClient.setLanguage('ar');
```

Refer to the documentation of the specific implementation package for details on its setup and usage.

## License

This package is licensed under the [PolyForm Free Trial 1.0.0](LICENSE). Please review the terms before use.
