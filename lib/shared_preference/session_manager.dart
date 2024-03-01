import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {

  late SharedPreferences sharedPreferences;

  Future<void> saveUserPhoneNo(String phoneNo) async {

    sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString("PhoneNo", phoneNo);

  }

  Future<String?> getUserPhoneNo() async {

    sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString("PhoneNo");

  }

  Future<void> saveUserPhoneCode(String phoneCode) async {

    sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString("PhoneCode", phoneCode);

  }

  Future<String?> getUserPhoneCode() async {

    sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString("PhoneCode");

  }

}