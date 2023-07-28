import 'package:battery_plus/battery_plus.dart';
import 'package:get/get.dart';

class BatteryController extends GetxController {
  RxString batterylevel = 'getting battery'.obs;

  @override
  void onInit() {
    getBatteryPerentage();
    super.onInit();
  }

  var battery = Battery();

  void getBatteryPerentage() async {
    final level = await battery.batteryLevel;
    batterylevel.value = level.toString();
  }
}
