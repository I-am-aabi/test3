import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  RxString currentLocation = 'Fetching location...'.obs;

  @override
  void onInit() {
    _checkLocationPermission();
    super.onInit();
  }


 Future<void> _checkLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
     
      if (await Permission.locationWhenInUse.request().isGranted) {
        _getAdress();
      }
    } else {
     
      _getAdress();
    }
  }
    Future<void> _getAdress() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      String address =
          'Delivering to, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}';
    
        currentLocation.value = address;
  
    } catch (e) {
     
        currentLocation.value = 'Error getting location: $e';
    
    }
  }

}
