import 'package:get/get.dart';
import 'package:team_project/src/core/bindings/auth_binding.dart';
import 'package:team_project/src/core/bindings/home_binding.dart';
import 'package:team_project/src/core/bindings/onboarding_binding.dart';
import 'package:team_project/src/core/bindings/all_subjects_binding.dart';
import 'package:team_project/src/core/bindings/subject_binding.dart';
import 'package:team_project/src/core/bindings/topic_binding.dart';
import 'package:team_project/src/presentation/auth/screen/auth_screen.dart';
import 'package:team_project/src/presentation/home/screen/home_screen.dart';
import 'package:team_project/src/presentation/onboarding/screen/onboarding_screen.dart';
import 'package:team_project/src/presentation/splash/screen/splash_screen.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/presentation/all_subjects/screen/all_subjects_screen.dart';
import 'package:team_project/src/presentation/subject/screen/subject_screen.dart';
import 'package:team_project/src/presentation/topic/screen/topic_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.allSubjects,
      page: () => const AllSubjectsScreen(),
      binding: AllSubjectsBinding(),
    ),
    GetPage(
      name: AppRoutes.subject,
      page: () => const SubjectScreen(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: AppRoutes.topic,
      page: () => const TopicScreen(),
      binding: TopicBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),
  ];
}
