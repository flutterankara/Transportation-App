// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:transportation_app/main.dart' deferred as _i1;
import 'package:transportation_app/profile/view/profile_view.dart'
    deferred as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.MyHomePage(),
        ),
      );
    },
    ProfileView.name: (routeData) {
      final args = routeData.argsAs<ProfileViewArgs>(
          orElse: () => const ProfileViewArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.ProfileView(key: args.key),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i3.PageRouteInfo<void> {
  const MyHomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ProfileView]
class ProfileView extends _i3.PageRouteInfo<ProfileViewArgs> {
  ProfileView({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ProfileView.name,
          args: ProfileViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i3.PageInfo<ProfileViewArgs> page =
      _i3.PageInfo<ProfileViewArgs>(name);
}

class ProfileViewArgs {
  const ProfileViewArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'ProfileViewArgs{key: $key}';
  }
}
