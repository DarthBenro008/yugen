// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yugen/routes/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<bool> canNavigate(
      List<PageRouteInfo> pendingRoutes, StackRouter router) async {
    print("sup");
    if (FirebaseAuth.instance.currentUser == null) {
      router.root.push(AuthenticationRoute());
      return false;
    }
    return true;
  }
}
