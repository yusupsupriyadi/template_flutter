import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:template_flutter/core.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load(fileName: '.env');
  getPermission();

  runApp(
    GetMaterialApp(
      title: "YS | Template Flutter GetX",
      useInheritedMediaQuery: true,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

void getPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
    Permission.notification,
    Permission.camera
  ].request();

  statuses.forEach((permission, status) {
    if (!status.isGranted) {
      // Handle the denied permissions here, you can show a message or request again.
      // For now, print a message to the console.
    }
  });
}
