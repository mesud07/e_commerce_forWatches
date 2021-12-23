import 'package:flutter/material.dart';

class ColorModel{
  String name;
  Color color;
  ColorModel(this.name,this.color);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorModel && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}