// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:team_project/src/config/app_pages.dart';
import 'package:team_project/src/config/translations/app_translations.dart';
import 'package:team_project/src/core/bindings/main_binding.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_constants.dart';
import 'package:team_project/src/utils/app_text_styles.dart';
import 'package:team_project/src/config/app_routes.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'STEM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.assets),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          iconTheme: IconThemeData(color: AppColors.filledIconColor),
        ),
        chipTheme: const ChipThemeData(side: BorderSide.none),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Lato'),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: AppTextStyles.selectedNavBarStyle,
          unselectedItemColor: AppColors.filledIconColor,
          selectedItemColor: AppColors.filledIconColor,
          unselectedLabelStyle: AppTextStyles.unselectedNavBarStyle,
        ),
        useMaterial3: true,
      ),
      locale: const Locale('uz'),
      translations: AppTranslations(),
      initialRoute: AppRoutes.initialRoute,
      navigatorKey: AppConstants.navigatorKey,
      initialBinding: MainBinding(),
      getPages: AppPages.pages,
    );
  }
}
