import 'package:flutter/material.dart';

const Color _customColor=Color(0xFF5C11D4); 

const List<Color> _colorThemes=[
  _customColor,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
]; 
class AppTheme{
  final int selectedColor;

  AppTheme({
    this.selectedColor=0,
    }):assert (selectedColor>=0 && selectedColor<_colorThemes.length,
    'Colores en el rango de 0 y ${_colorThemes.length}');
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}