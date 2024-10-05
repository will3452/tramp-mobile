import 'package:permission_handler/permission_handler.dart';

Future<void> requestLocationPermission() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
    // Permission granted
  } else {
    // Handle permission denial
  }
}
