import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';


@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
  deferredLoading: true,
  )       
class AppRouter extends $AppRouter {     

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();  
 
  @override    
  List<AutoRoute> get routes => [  
  
  AutoRoute(
    page: MyHomeRoute.page,
    initial: true,
    ), 
/*       AutoRoute(
    page: ProfileRoute.page,
    path: '/login',
    ), */
/*       AutoRoute(
    page: PlanningRoute.page,
    path: '/register',
    ), */
  ];    
}