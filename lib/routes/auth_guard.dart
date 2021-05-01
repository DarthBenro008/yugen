// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yugen/routes/router.gr.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    print(FirebaseAuth.instance.currentUser);
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    navigator.root.push(Routes.authScreen);
    return false;
  }
}
