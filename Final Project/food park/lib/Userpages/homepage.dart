// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodspark/Businesspages/controllers/data_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Stack(children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.5,
            child: Image.asset('images/loginbg.png', fit: BoxFit.cover),
          ),
        ),
        ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(
                      'https://pixahive.com/wp-content/uploads/2020/09/Nikon-camera-product-shoot-107518-pixahive.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "San miguel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          // ignore: deprecated_member_use
                          onPressed: () => launch(
                              "tel:${controller.allProduct[index].phone.toString()}"),
                          child: Text('Call'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Direction'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ]),
    );
  }
}
