import 'package:auto_route/auto_route.dart';
import 'package:pos/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IntroRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: MainRouteView.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoutes.page),
        AutoRoute(page: SongPlayRoute.page),
      ];
}
