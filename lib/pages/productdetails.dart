import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import flutter_animate

import '../controller/detailscontoller.dart';
 // Import the details controller

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  ProductDetailsPage({required this.productId});

  @override
  Widget build(BuildContext context) {
    final Deatailescontoller detailsController = Get.put(Deatailescontoller());

    // Fetch product details when this page is initialized
    detailsController.fetchProductDetails(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        if (detailsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final product = detailsController.productDeatiles;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image with Animation
                Center(
                  child: Image.network(
                    product['image'],
                    height: 250,
                    fit: BoxFit.cover,
                  )
                      .animate()
                      .fadeIn(duration: 500.ms) // Fade-in animation
                      .scaleXY(begin: 0.8, end: 1.0, curve: Curves.easeOut), // Corrected to scaleXY
                ),
                SizedBox(height: 20),

                // Product Title with Animation
                Text(
                  product['title'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 400.ms) // Staggered fade-in
                    .slideY(begin: -0.2, end: 0.0), // Slide in from top
                SizedBox(height: 10),

                // Product Price
                Text(
                  '\$${product['price']}',
                  style: TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 400.ms)
                    .slideX(begin: -0.2, end: 0.0), // Slide in from left
                SizedBox(height: 20),

                // Product Description
                Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 400.ms)
                    .slideX(begin: 0.2, end: 0.0), // Slide in from right
                SizedBox(height: 10),
                Text(
                  product['description'],
                  style: TextStyle(fontSize: 16),
                ).animate().fadeIn(delay: 500.ms, duration: 400.ms),

                SizedBox(height: 20),

                // Product Category
                Row(
                  children: [
                    Text(
                      'Category: ',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product['category'],
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],
                ).animate().fadeIn(delay: 600.ms, duration: 400.ms),

                SizedBox(height: 20),

                // Rating Section
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    SizedBox(width: 5),
                    Text(
                      '${product['rating']['rate']} / 5.0',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '(${product['rating']['count']} reviews)',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ).animate().fadeIn(delay: 700.ms, duration: 400.ms),
              ],
            ),
          ),
        );
      }),
    );
  }
}
