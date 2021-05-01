import 'package:firebase_auth/firebase_auth.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenGenerator {
  late IdTokenResult tokenResult;

  Future<IdTokenResult> fetchFirebaseToken() async {
    if (tokenResult == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenTime =
          (prefs.getString('tokenTime') ?? Jiffy().dateTime.toString());
      var storedDateTime = Jiffy(tokenTime);
      print("This is the stored time $storedDateTime");
      var currentJiffy = Jiffy(DateTime.now()).add(hours: 12);
      var aheadJiffy = Jiffy(currentJiffy);
      // DateTime currentTime = DateTime.now();
      if (aheadJiffy.isBefore(storedDateTime)) {
        // Check for 12 hour difference
        final idTokenResult =
            await FirebaseAuth.instance.currentUser!.getIdTokenResult(true);
        prefs.setString('tokenTime', DateTime.now().toString());
        tokenResult = idTokenResult;
        return idTokenResult;
      } else {
        final idTokenResult =
            await FirebaseAuth.instance.currentUser!.getIdTokenResult();
        tokenResult = idTokenResult;
        return idTokenResult;
      }
    }
    return tokenResult;
  }
}
