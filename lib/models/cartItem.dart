import 'package:e_plant1/models/product.dart';


class cartItem {
 int? id;
 int? quantity;
 int? total;
 Product? product;
 int? user_id;
  
  

  cartItem({required  this.id, required this.quantity, required this.total, required this.user_id,required this.product,});


  factory cartItem.fromJson(Map<String, dynamic> data) {
   
   
    return cartItem(
      id: data['id'],
      user_id: data['user_id'],
      total: data['total'],
      quantity: data['quantity'],
      product: Product.fromJson(data['product']),
    
    );
  }
}

