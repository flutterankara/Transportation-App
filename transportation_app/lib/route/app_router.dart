import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';


@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
  deferredLoading: true,
  )       
class AppRouter extends $AppRouter {     

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();  
 
  @override    
  List<AutoRoute> get routes => [  
  
/*  AutoRoute(
    page: HomeRoute.page,
    initial: true,
    ), */
      AutoRoute(
    page: ProfileRoute.page,
    path: '/login',
    ),
/*       AutoRoute(
    page: PlanningRoute.page,
    path: '/register',
    ), */
  ];    
}