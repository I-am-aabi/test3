import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test3/controllers/location_controller.dart';
import 'package:test3/views/homepage/widgets/categorybuilder.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});
  final LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  'Products',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
               SizedBox(
                height: 40,
                child:  Obx(() => Text('${locationController.currentLocation}')) ,
              ),
              const Text(
                'SmartPhones',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Categorybuider(category: 'smartphones'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Laptops',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Categorybuider(category: 'laptops'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Fragrances',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Categorybuider(category: 'fragrances'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Skin Care',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Categorybuider(category: 'skincare'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Groceries',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Categorybuider(category: 'groceries'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Home Decorations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Categorybuider(category: 'home-decoration')
            ],
          ),
        ),
      )),
    );
  }
}
