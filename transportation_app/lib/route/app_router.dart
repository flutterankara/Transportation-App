import 'package:auto_route/auto_route.dart';


@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
  deferredLoading: true,
  )       
class AppRouter extends $AppRouter {     

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();  
 
  @override    
  List<AutoRoute> get routes => [  
  
 AutoRoute(
    page: HomeRoute.page,
    initial: true,
    ),
      AutoRoute(
    page: LoginRoute.page,
    path: '/login',
    ),
      AutoRoute(
    page: RegisterRoute.page,
    path: '/register',
    ),
  ];    
}