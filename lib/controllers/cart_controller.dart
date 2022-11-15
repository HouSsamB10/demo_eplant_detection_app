import 'dart:ffi';

import 'package:e_plant1/services/api/CartApi.dart';
import 'package:e_plant1/services/api/CartApi.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartApi cartApi = CartApi();
  RxBool isLoading = true.obs;
  var cartList = [].obs;
  final total =RxDouble(0.0);
  var orderDone;
  @override
  void onInit() {
    fetchCarts();
    super.onInit();
  }

  void fetchCarts() async {
    try {
      isLoading(true);
      var products = await cartApi.getCarts();
      if (products != null) {
        cartList.value = products.listCart;
        total.value = products.totalPrice;
        print('hhhhhhhhhhhh');
         isLoading(false);
      }else{
        cartList.value = [];
        total.value = 0.0;
      }
      
    } finally {
      isLoading(false);
    }
  }

    void makeOrder() async {
    try {
      isLoading(true);
      var makeOrder = await cartApi.makeOrder();
      if (makeOrder == 1 ) {
        cartList.value = [];
        total.value = 0.0;
      fetchCarts();
      }
     
    } finally {
      isLoading(false);
    }
  }

      void removeproductIncart(int? id) async {
    try {
      isLoading(true);
      var remove = await cartApi.removeProductIncart(id!);
      if (remove == 1 ) {
        print('remove');
        fetchCarts();
      }
        print('not removed');
    } finally {
      isLoading(false);
    }
  }

        void addProductTocart(int? id) async {
    try {
      isLoading(true);
      var addproduct = await cartApi.addProduct(id!);
      if (addproduct == 1 ) {
        fetchCarts();
      }else{
       Get.snackbar('Erorr', 'you must choose product from the same shop',snackPosition: SnackPosition.BOTTOM);
      }
      
    } finally {
      isLoading(false);
    }
  }
/*
  void searchProducts(String tag) async {
    try {
      isLoading(true);
      var products = await productApi.searchProducts(tag);
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

  deleteProduct(int id) async {
    var is_deleted = await productApi.deleteProduct(id);
    if (is_deleted == true) {
      fetchProducts();
      return true;
    } else {
      return false;
    }
  }

  getProduct(int id) async {
    try {
      isLoading(true);
      var product1 = await productApi.getProduct(id);

      if (product1 != null) {
        product = product1;

        titlecontroller.text = product.title!;
        desccontroller.text = product.description!;
        regularcontroller.text = product.regular_price!;
        salecontroller.text = product.sale_price!;
        qtycontroller.text = product.qty!;
        typecontroller.text = product.type!;
        discountcontroller.text = product.discount!;
        //  statuscontroller.text = product. ;
        // imagecontroller.text = product. ;

      }
    } finally {
      isLoading(false);
    }
  }

  updateProduct(int id) async {
    try {
      isLoading(true);
      Product addProduct = new Product(
        id: null,
        description: desccontroller.text,
        title: titlecontroller.text,
        regular_price: regularcontroller.text,
        discount: discountcontroller.text,
        qty: qtycontroller.text,
        sale_price: salecontroller.text,
        type: typecontroller.text,
        image: null,
      );

      var product1 = await productApi.updateProduct(addProduct, id);

      if (product1 != null) {
        print(product1);
        fetchProducts();
        return true;
      } else {
        return false;
      }
    } finally {
      isLoading(false);
    }
  }

  AddProduct() async {
    try {
      isLoading(true);
      Product addProduct = new Product(
        id: null,
        description: desccontroller.text,
        title: titlecontroller.text,
        regular_price: regularcontroller.text,
        discount: discountcontroller.text,
        qty: qtycontroller.text,
        sale_price: salecontroller.text,
        type: typecontroller.text,
        image: null,
      );

      var product1 = await productApi.addProduct(addProduct);

      if (product1 != null) {
        print(product1);
        fetchProducts();
        return true;
      } else {
        return false;
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchProducts();

    super.onInit();
  }

  void videAll() {
    titlecontroller.text = '';
    desccontroller.text = '';
    regularcontroller.text = '';
    salecontroller.text = '';
    qtycontroller.text = '';
    typecontroller.text = '';
    discountcontroller.text = '';
    statuscontroller.text = '';
    imagecontroller.text = '';
  }

  @override
  void onClose() {
    titlecontroller.text = '';
    desccontroller.text = '';
    regularcontroller.text = '';
    salecontroller.text = '';
    qtycontroller.text = '';
    typecontroller.text = '';
    discountcontroller.text = '';
    statuscontroller.text = '';
    imagecontroller.text = '';

    super.onClose();
  }

 */
}
