import 'package:flutter/material.dart';
import 'package:pokemon/main.dart';

ColorScheme get _colorScheme =>
    Theme.of(MyApp.navigatorKey.currentContext!).colorScheme;
// Primary Color
get primary => _colorScheme.primary;
Color get primaryDark => _colorScheme.primaryContainer;
Color get primaryLight => _colorScheme.onPrimary;
// Secondary Color
get secondary => _colorScheme.secondary;
Color get secondaryDark => _colorScheme.secondaryContainer;
Color get secondaryLight => _colorScheme.onSecondary;
//Gray
Color get inversePrimary => _colorScheme.inversePrimary;
//proper grey
Color get inverseSurface => _colorScheme.inverseSurface;
//Black
Color get surfaceVariant => _colorScheme.surfaceVariant;
// Tertiary Color
//success green
Color get tertiarylight => _colorScheme.tertiary;
//
Color get warning => _colorScheme.onTertiary;
// ignore: non_constant_identifier_names
Color get Grayhard => _colorScheme.tertiaryContainer;

// Error Color
Color get error => _colorScheme.error;
Color get errorDark => _colorScheme.errorContainer;
Color get errorLight => _colorScheme.onError;
// BackGround Color
Color get background => _colorScheme.background;
// Surface Color
Color get surface => _colorScheme.surface;
