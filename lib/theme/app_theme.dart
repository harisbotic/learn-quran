import 'package:flutter/material.dart';
import 'package:learnquran/theme/theme_extension_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

ThemeExtensionColors colors(context) =>
    Theme.of(context).extension<ThemeExtensionColors>()!;

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xffF6F6F6),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    )),
    cardTheme: CardTheme(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.green.shade100,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          );
        }
        return const TextStyle(
          fontSize: 12,
        );
      }),
    ),
    extensions: <ThemeExtension<ThemeExtensionColors>>[
      ThemeExtensionColors(
        success: const Color(0xFF9ADE7B),
        failure: Colors.red.shade400,
        defaultWordBackground: Colors.amber[50],
        maleWordBackground: Colors.blue.shade50,
        femaleWordBackground: Colors.pink.shade50,
        defaultWordIcon: Colors.amber.shade700,
        maleWordIcon: Colors.blue.shade300,
        femaleWordIcon: Colors.pink.shade300,
      )
    ],
  );
}

ThemeData getLightFlexTheme(FlexScheme scheme) {
  return FlexThemeData.light(
      scheme: scheme,
      appBarElevation: 2,
      useMaterial3: true,
      extensions: <ThemeExtension<ThemeExtensionColors>>[
        ThemeExtensionColors(
          success: const Color(0xFF9ADE7B),
          failure: Colors.red.shade400,
          defaultWordBackground: Colors.amber[50],
          maleWordBackground: Colors.blue.shade50,
          femaleWordBackground: Colors.pink.shade50,
          defaultWordIcon: Colors.amber.shade700,
          maleWordIcon: Colors.blue.shade300,
          femaleWordIcon: Colors.pink.shade300,
        )
      ]).copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    )),
    cardTheme: CardTheme(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFF8BD49),
      onPrimary: Color(0xFF422D00),
      primaryContainer: Color(0xFF5E4200),
      onPrimaryContainer: Color(0xFFFFDEA8),
      secondary: Color(0xFF55D6F3),
      onSecondary: Color(0xFF003640),
      secondaryContainer: Color(0xFF004E5C),
      onSecondaryContainer: Color(0xFFABEDFF),
      tertiary: Color(0xFF7FDA99),
      onTertiary: Color(0xFF00391B),
      tertiaryContainer: Color(0xFF005229),
      onTertiaryContainer: Color(0xFF9AF6B3),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF231A00),
      onBackground: Color(0xFFFFE086),
      surface: Color(0xFF231A00),
      onSurface: Color(0xFFFFE086),
      surfaceVariant: Color(0xFF4E4639),
      onSurfaceVariant: Color(0xFFD1C5B4),
      outline: Color(0xFF9A8F80),
      onInverseSurface: Color(0xFF231A00),
      inverseSurface: Color(0xFFFFE086),
      inversePrimary: Color(0xFF7C5800),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFFF8BD49),
      outlineVariant: Color(0xFF4E4639),
      scrim: Color(0xFF000000),
    ),
    extensions: <ThemeExtension<ThemeExtensionColors>>[
      ThemeExtensionColors(
        success: const Color(0xFF006D39),
        failure: Colors.red.shade900,
        defaultWordBackground: Colors.amber.shade900,
        maleWordBackground: Colors.blue.shade700,
        femaleWordBackground: Colors.pink.shade900,
        defaultWordIcon: Colors.amber.shade700,
        maleWordIcon: Colors.blue.shade200,
        femaleWordIcon: Colors.pink.shade200,
      )
    ],
  );
}

ThemeData getDarkFlexTheme(FlexScheme scheme) {
  return FlexThemeData.dark(
      scheme: scheme,
      extensions: <ThemeExtension<ThemeExtensionColors>>[
        ThemeExtensionColors(
          success: const Color(0xFF006D39),
          failure: Colors.red.shade900,
          defaultWordBackground: Colors.amber.shade900,
          maleWordBackground: Colors.blue.shade700,
          femaleWordBackground: Colors.pink.shade900,
          defaultWordIcon: Colors.amber.shade700,
          maleWordIcon: Colors.blue.shade200,
          femaleWordIcon: Colors.pink.shade200,
        )
      ]).copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    )),
    cardTheme: CardTheme(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
