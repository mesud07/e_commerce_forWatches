import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:flutter/cupertino.dart';

class ProviderViewModel extends ChangeNotifier{

  

  List<Product> _sepet =[];
  
  void addProduct(Product product) {
    _sepet.add(product);
    notifyListeners();
  }
List<Product> get getSepet {
    return [..._sepet];
  }


  int _counter = 0;
  int get counter=> _counter;

  void arttir()
  {
    _counter++;
    notifyListeners();
  }

  void azalt()
  {
    _counter--;
    notifyListeners();
  }
}