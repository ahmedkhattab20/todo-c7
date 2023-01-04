import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:todo_v1/providers/AppConfigProvider.dart';

import 'package:provider/provider.dart';


class MyThemeData{

  static Color primaryLightColor =Color(0xff5D9CEC);
  static Color primaryDarkColor =Color(0xff5D9CEC);
  static Color secondaryDarkColor =Color(0xff141922);

  static Color backgroundColorLight =Color(0xffDFECDB);
  static Color backgroundColorDark =Color(0xff060E1E);


  static Color whiteColor =Colors.white;
  static Color greenColor =Color(0xff61E757);
  static Color redColor =Color(0xffEC4B4B);
  static Color blackColor =Color(0xff060E1E);
  static Color grayColor =Color(0xff707070);

 static ThemeData lightTheme = ThemeData(


  primaryColor: primaryLightColor,
primaryTextTheme: TextTheme(
  headline1: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: whiteColor
  )
),
     appBarTheme: AppBarTheme(
     backgroundColor: primaryLightColor
 ),

     //scaffoldBackgroundColor: provider.isDarkMode()?backgroundColorLight:backgroundColorDark,
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
       backgroundColor: Colors.transparent,
       elevation: 0,
       selectedIconTheme: IconThemeData(
         color: primaryLightColor,
         size: 32,

       ),

       unselectedIconTheme: IconThemeData(
         color: grayColor,
         size: 32,

       ),
 ),
     bottomSheetTheme: BottomSheetThemeData(
     shape:RoundedRectangleBorder(
       borderRadius: BorderRadius.only(
         topLeft:Radius.circular(18) ,
         topRight: Radius.circular(18)
       )
     )
 ),
   textTheme:  TextTheme(
     headline5:TextStyle(
       fontSize: 20,
       fontWeight: FontWeight.bold,
       color: Colors.black
     ) ,
     headline6:TextStyle(
         fontSize: 18,
         fontWeight: FontWeight.bold,
         color: Colors.black
     ) ,


   )

 );

}