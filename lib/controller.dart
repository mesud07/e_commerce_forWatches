import 'package:e_commerce_app/screens/basketPage/model/basketProduct.dart';
import 'package:e_commerce_app/screens/basketPage/model/product.dart';
import 'package:e_commerce_app/screens/basketPage/view/basketPage.dart';
import 'package:flutter/cupertino.dart';

class ProviderViewModel extends ChangeNotifier{

  bool _searchOn=false;
  bool get searchOnGet =>_searchOn;
  
  void acKapa(){
    if(_searchOn!=true){
      _searchOn=true;
    }
    else{
      _searchOn=false;
    }
    notifyListeners();
  }
  

  
  List<BasketProduct> _sepet =[];
  
  void addProduct(BasketProduct product) {
    _sepet.add(product);
    notifyListeners();
  }
List<BasketProduct> get getSepet {
    return _sepet;
  }

  void urunAzalt(BasketProduct basketProduct){
    for(var i=0;i<_sepet.length;i++){
      if(_sepet[i]==basketProduct){
        if(_sepet[i].count==1){
          _sepet.remove(basketProduct);
        }
        else{
          _sepet[i].count--;
        }
      }
    }
    notifyListeners();
  }

   void urunArttir(BasketProduct basketProduct){
    for(var i=0;i<_sepet.length;i++){
      if(_sepet[i]==basketProduct){
        _sepet[i].count++;
      }
    }
    notifyListeners();
  }

  double sepetHesapla(List<BasketProduct> sepetList){
    double _totalTutar=0;
      for (var item in sepetList) {
        double satirBasiDeger=item.count*item.product.productCost;
        _totalTutar+=satirBasiDeger;
        
      }

        

      return _totalTutar;
     
  }


  
}