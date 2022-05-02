import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutapi/controller.dart';
import 'package:tutapi/model.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // Text(
                    //     (productController.productList[index].name).toString()),
                    SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage((productController
                                        .productList[index].imageLink)
                                    .toString())),
                          ),
                          child: Column(
                            children: [
                              Text(
                                  "${productController.productList[index].name}"),
                              Text((productController.productList[index].brand)
                                  .toString())
                            ],
                          ),
                        ))
                  ],
                );
              });
        }
      }),
    );
  }
}
