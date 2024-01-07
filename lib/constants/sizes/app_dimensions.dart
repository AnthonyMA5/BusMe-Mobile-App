import 'package:flutter/material.dart';

class AppDimensions {
  // Ancho de la pantalla
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Alto de la pantalla
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
