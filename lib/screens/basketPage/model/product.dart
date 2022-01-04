import 'package:flutter/foundation.dart';

class Product{
  String link;
  String productTitle;
  String productDesc;
  double productCost;
  double rating;
  int trending;
  int popular;
  
  Product(this.link,this.productTitle,this.productDesc,this.productCost,this.rating,this.trending,this.popular);


}
List products=[
Product("https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTVfTo1aQxAV5KAM6Ao82_j2wjoVw1Lk8OE3hceCMYvWXW1Dvn4WwwRHSYEcfNSt43cK0gBOh6bDMul4L_efJhRxHMFeG3RI4jAdK5wOOEHAbKfsoWT7SR3pA&usqp=CAE",
"Fossil FS5666 Erkek Kol Saati","açıklama",854.50,4,4,3),
Product("https://avatars.mds.yandex.net/i?id=889915e17dad12fe7e9d4bf370e65d37-5369934-images-thumbs&n=13&exp=1",
"Black Gold Rolex Watch","açıklama",524.50,5,5,2),
Product("https://www.clipartkey.com/mpngs/m/77-779202_watches-png-image-watch-png-for-picsart.png",
"Fossil FS5666 Erkek Kol Saati","açıklama",724.20,2,3,5),
Product("https://b7.pngbarn.com/png/583/564/watch-strap-rolex-daytona-brand-watch-png-clip-art.png",
"Rolex Daytona, clock Face","açıklama",399.50,3,5,2),
Product("https://cdn.shopify.com/s/files/1/0045/6812/1432/products/product-image-842653476_720x_1727a534-a639-4e70-b6cc-5608f03661f3_720x.jpg",
"Casio g shock military","açıklama",542.50,1,3,5),
Product("https://img.favpng.com/14/3/21/watch-quartz-clock-police-chronograph-png-favpng-6Ec4zvnhPdBKhrv6YvUiR0hLZ.jpg",
"Police Three Chronograph Quartz","açıklama",439.90,3,2,5),
Product("https://s3-eu-west-1.amazonaws.com/images.linnlive.com/26bad06816251c941f65f362e37727df/8b895730-0cd1-478e-a4b8-a0ca656b2137.jpg",
"Casio RETRO A168WG-9W A168WEC-3D","Casio RETRO A168WG-9W A168WEC-3D A168WECM-5D A168WEGC-3D Digital Unisex Watch",50.49,3,5,2),


];