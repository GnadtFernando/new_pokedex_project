import 'package:flutter/material.dart';

class AppColors {
  static Color get white => const Color.fromRGBO(255, 255, 255, 1);
  static Color? get normal => Colors.brown[400];
  static Color? get fire => Colors.red;
  static Color? get water => Colors.blue.withAlpha((0.8 * 255).toInt());
  static Color? get grass => Colors.green;
  static Color? get electric => Colors.amber;
  static Color? get ice => Colors.cyanAccent[400];
  static Color? get fighting => Colors.orange;
  static Color? get bug => Colors.lightGreen[500];
  static Color? get fairy => Colors.pinkAccent[100];
  static Color? get ghost => Colors.indigo[400];
  static Color? get ground => Colors.orange[300];
  static Color? get poison => Colors.purple;
  static Color? get rock => Colors.grey;
  static Color? get psychic => Colors.pink;
  static Color? get steel => Colors.blueGrey;
  static Color? get dark => Colors.brown;
  static Color? get dragon => Colors.indigo[800];
  static Color? get flying => Colors.indigo[200];
  static Color? get base => Colors.grey;
}
