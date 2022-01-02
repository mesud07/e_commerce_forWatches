import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:e_commerce_app/screens/basketPage/view/basketPage.dart';
import 'package:e_commerce_app/screens/productDetailPage/model/colorModel.dart';
import 'package:e_commerce_app/screens/productDetailPage/model/productModel.dart';
import 'package:flutter/cupertino.dart';

class  BasketProduct {

  Product product;
  ProductModel productModel;
  ColorModel colorModel;
  int count;
  BasketProduct(this.product,this.productModel,this.colorModel,this.count);

}