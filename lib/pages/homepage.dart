import 'package:bluestoneassign/controller/productshowcontroller.dart';
import 'package:bluestoneassign/pages/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final Productlistcontroller productcontroller =
      Get.put(Productlistcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (productcontroller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1),
            itemCount: productcontroller.productlist.length,
            itemBuilder: (context, index) {
              final product = productcontroller.productlist[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetailsPage(productId: product['id']));
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(product['image']),
                            fit: BoxFit.contain,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['title'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5,),
                            Text('\$${product['price']}',style: TextStyle(
                              fontSize: 14,
                              color: Colors.green
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ).animate()
                .fadeIn(delay: 100.ms*index)
                .slideY(begin: 1,end: 0,curve: Curves.easeOut)
                ,
              );
            },
          ),
        );
      }),
    );
  }
}
