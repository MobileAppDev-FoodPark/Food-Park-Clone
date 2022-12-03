// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodspark/Businesspages/controllers/data_controller.dart';
import 'package:get/get.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key});

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FOOD STALLS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.cyanAccent,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset('images/loginbg.png', fit: BoxFit.cover),
            ),
          ),
          GetBuilder<DataController>(
            builder: (controller) => controller.allProduct.isEmpty
                ? Center(
                    child: Text(' NO DATA FOUND 😔'),
                  )
                : ListView.builder(
                    itemCount: controller.allProduct.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            // ignore: sized_box_for_whitespace
                            Container(
                              height: 200,
                              width: double.infinity,
                              child: Image.network(
                                controller.allProduct[index].stallimage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Stall Name: ${controller.allProduct[index].stallname}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Contact: ${controller.allProduct[index].phone.toString()}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('CALL'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
