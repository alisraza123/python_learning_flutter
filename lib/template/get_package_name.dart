import 'package:package_info_plus/package_info_plus.dart';

Future<String> getPackageName() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName; // e.g., com.example.myapp
}
