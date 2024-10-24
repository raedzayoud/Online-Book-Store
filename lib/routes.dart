import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:onlinebook/view/screen/homebook.dart';

List<GetPage<dynamic>>? getPages = [
 GetPage(name: "/", page: () =>Homebook())];