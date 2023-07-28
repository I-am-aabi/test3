import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test3/controllers/product_controller.dart';
import 'package:test3/models/productmodel.dart';
import 'package:test3/views/homepage/widgets/product_card.dart';

class Categorybuider extends StatelessWidget {
  Categorybuider({
    super.key,
    required this.category,
  });
  final Productcontroller controller = Get.put(Productcontroller());
  final String category;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            List<Product> products = controller.productList
                .where((product) => product.category == category)
                .toList();
            if (products.isEmpty) {
              return const SizedBox(
                height: 100,
                width: 100,
                child: Center(child: CircularProgressIndicator()));
            } else {
              return ProductCard(
                product: products[index],
              );
            }
          },
          itemCount:
              controller.productList.length - controller.productList.length + 5,
        ),
      ),
    );
  }
}
