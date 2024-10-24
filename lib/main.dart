import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebook/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   // Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    //  theme: themeData, // Use the themeData here
     // initialBinding: MyBinding(),
      getPages: getPages, // Ensure routes are correctly imported
    );
  }
}