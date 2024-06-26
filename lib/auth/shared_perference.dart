import 'package:shared_preferences/shared_preferences.dart';

const String rememberMeKey = "rememberMeKey";

setUserLoggedin({required bool rememberMe}) async {
  final sharedPref = await SharedPreferences.getInstance();
  if (rememberMe) {
    await sharedPref.setBool(rememberMeKey, true);
  }
}

clearUserSession() async {
  final sharedprefs = await SharedPreferences.getInstance();
  await sharedprefs.remove(rememberMeKey);
}
