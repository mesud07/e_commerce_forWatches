  import 'package:flutter/material.dart';

class ProductModel{

    String name;
    int value;

    ProductModel(this.name,this.value);


      @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}