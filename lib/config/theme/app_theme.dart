import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.yellow,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.pink
];


class AppTheme {
  
  final int selectedColor;
  final bool isDarkMode;
  AppTheme({
    this.isDarkMode=false, 
    this.selectedColor = 0
}): assert(selectedColor >= 0 && selectedColor < colorList.length, 'selectedColor tiene que ser mayor o igual a 0 y menor o igual a ${colorList.length-1}');

  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode
    ?Brightness.dark
    :Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: false,
    )
  );

}