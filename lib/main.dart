import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "YS | Template Flutter GetX",
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
