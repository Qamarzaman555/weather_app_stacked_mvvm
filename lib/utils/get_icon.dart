import 'package:flutter/material.dart';

class IconsUtils {
  static IconData getIcon(String iconName) {
    switch (iconName) {
      case 'clear-night':
        return Icons.nightlight_round; // Example mapping for clear night icon
      // Add more cases for other icon names as needed
      default:
        return Icons
            .error; // Return a default icon in case of unknown icon names
    }
  }
}
