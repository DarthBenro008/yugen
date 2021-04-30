import 'package:auto_route/auto_route.dart';
import 'package:yugen/routes/auth_guard.dart';
import 'package:yugen/screens/authentication.dart';
import 'package:yugen/screens/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, guards: [AuthGuard]),
    AutoRoute(page: AuthenticationPage),
  ],
)
class $AppRouter {}
