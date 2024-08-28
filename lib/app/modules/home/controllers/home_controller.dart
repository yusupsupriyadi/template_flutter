import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String dangerDescription = '';
  Color dangerColor = const Color(0xFFD3D3D3);
  Color dangerSecondary = const Color(0xFFD3D3D3);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getDangerData(int dangerCode) {
    switch (dangerCode) {
      case 1:
        dangerDescription = 'Risiko Rendah';
        dangerColor = Color(0xFF4CAF50); // Hijau
        dangerSecondary = Color(0xFFE8F5E9); // Hijau muda
        break;
      case 2:
        dangerDescription = 'Risiko Sedang';
        dangerColor = Color(0xFFFFC107); // Kuning
        dangerSecondary = Color(0xFFFFF8E1); // Kuning muda
        break;
      case 3:
        dangerDescription = 'Risiko Tinggi';
        dangerColor = Color(0xFFFF9800); // Oranye
        dangerSecondary = Color(0xFFFFF3E0); // Oranye muda
        break;
      case 4:
        dangerDescription = 'Sangat Berisiko';
        dangerColor = Color(0xFFF44336); // Merah
        dangerSecondary = Color(0xFFFFEBEE); // Merah muda
        break;
      default:
        dangerDescription = 'Tidak diketahui';
        dangerColor = Color(0xFF9E9E9E); // Abu-abu
        dangerSecondary = Color(0xFFF5F5F5); // Abu-abu muda
        break;
    }
    update();
  }
}
