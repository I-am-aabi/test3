import 'package:get/get.dart';
import 'package:test3/models/productmodel.dart';
import 'package:test3/services/remoteservice.dart';

class Productcontroller extends GetxController {
  var productList = <Product>[].obs;
    var categoryList = <Product>[].obs;


  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
void updateCategory(String category) {
  categoryList.value = productList
                .where((product) => product.category == category)
                .toList();
}


  void fetchProducts() async {
    var products = await RemotesService.getProducts();
    if (products != null) {
      productList.value = products;
      
    }
  }
}
