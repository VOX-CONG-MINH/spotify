// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:pos/domain/domain.dart' as _i10;
import 'package:pos/ui/home/home_page.dart' as _i1;
import 'package:pos/ui/intro/intro_page.dart' as _i2;
import 'package:pos/ui/login/login_page.dart' as _i3;
import 'package:pos/ui/main_screen/main_screen_view.dart' as _i4;
import 'package:pos/ui/profile/profile_pages.dart' as _i5;
import 'package:pos/ui/register/register_page.dart' as _i6;
import 'package:pos/ui/song_play/song_play_page.dart' as _i7;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.IntroPage]
class IntroRoute extends _i8.PageRouteInfo<void> {
  const IntroRoute({List<_i8.PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.IntroPage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.MainScreenView]
class MainRouteView extends _i8.PageRouteInfo<void> {
  const MainRouteView({List<_i8.PageRouteInfo>? children})
    : super(MainRouteView.name, initialChildren: children);

  static const String name = 'MainRouteView';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainScreenView();
    },
  );
}

/// generated route for
/// [_i5.ProfilePages]
class ProfileRoutes extends _i8.PageRouteInfo<void> {
  const ProfileRoutes({List<_i8.PageRouteInfo>? children})
    : super(ProfileRoutes.name, initialChildren: children);

  static const String name = 'ProfileRoutes';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfilePages();
    },
  );
}

/// generated route for
/// [_i6.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.RegisterPage();
    },
  );
}

/// generated route for
/// [_i7.SongPlayPage]
class SongPlayRoute extends _i8.PageRouteInfo<SongPlayRouteArgs> {
  SongPlayRoute({
    _i9.Key? key,
    required _i10.SongEntity song,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         SongPlayRoute.name,
         args: SongPlayRouteArgs(key: key, song: song),
         initialChildren: children,
       );

  static const String name = 'SongPlayRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SongPlayRouteArgs>();
      return _i7.SongPlayPage(key: args.key, song: args.song);
    },
  );
}

class SongPlayRouteArgs {
  const SongPlayRouteArgs({this.key, required this.song});

  final _i9.Key? key;

  final _i10.SongEntity song;

  @override
  String toString() {
    return 'SongPlayRouteArgs{key: $key, song: $song}';
  }
}
