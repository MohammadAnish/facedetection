import 'package:face_detection/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  static const userDetails = "user_details";
  static Box userDetailsBox()=> Hive.box(userDetails);

  static initialize()async{
    await HiveBoxes.userDetailsBox().clear();
  }
}

class lo_db {
  static User getUser()=> User.fromjson(HiveBoxes.userDetailsBox().toMap());

  static String getUsername() =>
      HiveBoxes.userDetailsBox().toMap()[User.namekey];

  static String getUserArray()=>
      HiveBoxes.userDetailsBox().toMap()[User.arraykey];

  static setUserDetails(User user)=>
      HiveBoxes.userDetailsBox().putAll(user.tojson());

}