import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:logiology/app/modules/home/bindings/home_binding.dart';
import 'package:logiology/app/modules/home/views/home_page.dart';
import 'package:logiology/app/modules/login/bindings/login_binding.dart';
import 'package:logiology/app/modules/login/views/login_page.dart';
import 'package:logiology/app/modules/profile/views/profile_page.dart';
import 'package:logiology/app/routes/app_routes.dart';

final List<GetPage> appPages = [
  GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: LoginBinding()),
  GetPage(name: AppRoutes.home, page: () => HomePage(), binding: HomeBinding()),
  GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
];
