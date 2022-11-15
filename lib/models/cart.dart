import 'package:e_plant1/models/cartItem.dart';
import 'package:e_plant1/models/product.dart';

class Cart {
  late List<cartItem> listCart;
  
  late double totalPrice = 0.0;

  Cart(this.listCart, this.totalPrice);
}
