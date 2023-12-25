import 'package:flutter/material.dart';
import 'package:mamak_app/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:mamak_app/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:mamak_app/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:mamak_app/presentation/on_the_way_three_screen/on_the_way_three_screen.dart';
import 'package:mamak_app/presentation/home_one_screen/home_one_screen.dart';
import 'package:mamak_app/presentation/taxi_secenek_screen/taxi_secenek_screen.dart';
import 'package:mamak_app/presentation/toplam_fiyat_screen/toplam_fiyat_screen.dart';
import 'package:mamak_app/presentation/home_screen/home_screen.dart';
import 'package:mamak_app/presentation/account_container_screen/account_container_screen.dart';
import 'package:mamak_app/presentation/account_one_screen/account_one_screen.dart';
import 'package:mamak_app/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String onTheWayThreeScreen = '/on_the_way_three_screen';

  static const String homeOneScreen = '/home_one_screen';

  static const String taxiSecenekScreen = '/taxi_secenek_screen';

  static const String toplamFiyatScreen = '/toplam_fiyat_screen';

  static const String homeScreen = '/home_screen';

  static const String accountPage = '/account_page';

  static const String accountContainerScreen = '/account_container_screen';

  static const String accountOneScreen = '/account_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        onboardingThreeScreen: OnboardingThreeScreen.builder,
        signInScreen: SignInScreen.builder,
        signUpScreen: SignUpScreen.builder,
        onTheWayThreeScreen: OnTheWayThreeScreen.builder,
        homeOneScreen: HomeOneScreen.builder,
        taxiSecenekScreen: TaxiSecenekScreen.builder,
        toplamFiyatScreen: ToplamFiyatScreen.builder,
        homeScreen: HomeScreen.builder,
        accountContainerScreen: AccountContainerScreen.builder,
        accountOneScreen: AccountOneScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: OnboardingThreeScreen.builder
      };
}
