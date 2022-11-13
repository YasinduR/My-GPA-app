


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

var THM = ThemeMode.system.obs;
//var isdark = THM.value == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light;
final themeController = Get.put(ThemeController());
class ThemeController extends GetxController {
   ThemeMode theme = THM.value; //theme value stored as global variable THM
                                // THIS CAN BE REPLACE WITH STORAGE METHOD LATELY
   //
  // final _box = GetStorage();
  // final _key = 'isDarkMode';

  //ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
 // bool _loadTheme() => _box.read(_key) ?? false;

  //void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);
  //void changeTheme(ThemeData theme) => Get.changeTheme(theme);
  void changeThemeMode() {
    THM.value = THM.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(THM.value);
    print(THM.value);

  }
   @override
  void onInit(){
    print("Intializing theme .....");
    // Convert system theme mode to dark or light
    changeThemeMode();
    changeThemeMode();
    super.onInit();
   }
}