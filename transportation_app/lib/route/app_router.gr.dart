// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:transportation_app/profile/view/profile_view.dart'
    deferred as _i1;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    ProfileRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.ProfileView(),
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.ProfileView]
class ProfileRoute extends _i2.PageRouteInfo<void> {
  const ProfileRoute({List<_i2.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
