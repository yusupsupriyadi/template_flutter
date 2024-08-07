import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Column(
                    children: [
                      Text('HomeView'),
                    ],
                  ),
                ],
              ),
            ),
            body: const Center(
              child: Text(
                'Hello',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        });
  }
}
