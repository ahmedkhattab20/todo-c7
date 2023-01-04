
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_v1/my_theme.dart';
import 'package:todo_v1/ui/home/setting_tab/language_bottom_sheet.dart';
import 'package:todo_v1/ui/home/setting_tab/theme_bottom_sheet.dart';
import 'package:todo_v1/providers/AppConfigProvider.dart';

import 'package:provider/provider.dart';


class SettingTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);    //provider

    return Container(

      margin: EdgeInsets.all(15),
      child:

      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50),
          Text( AppLocalizations.of(context)!.language,

            style: Theme.of(context).primaryTextTheme.subtitle1?.copyWith(color: Colors.black),),
          SizedBox(height: 20),
          Container(

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color:
                MyThemeData.whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:MyThemeData.primaryLightColor )

            ),
            child:
            InkWell(
              onTap:(){
                showlanguagebottomsheet(context);
              },
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(

                     provider.appLanguage == 'en'?
                      AppLocalizations.of(context)!.english
                         : AppLocalizations.of(context)!.arabic
                    ,
//style: TextStyle(color: MyThemeData.primaryLightColor),
                    style: provider.isDarkMode()?
                     Theme.of(context).textTheme.subtitle1
                          :Theme.of(context).textTheme.subtitle1
                  ),
                  Icon(Icons.arrow_drop_down_outlined,size: 25,color: MyThemeData.primaryLightColor  )

                ],
              ),
            ),
          ),


          SizedBox(height: 50),
          Text( AppLocalizations.of(context)!.theming,

            style: Theme.of(context).primaryTextTheme.subtitle1?.copyWith(color: Colors.black),),
          SizedBox(height: 20),
          Container(

            padding: EdgeInsets.all(10),

            decoration: BoxDecoration(
                color:
                MyThemeData.whiteColor,
                borderRadius: BorderRadius.circular(10),
              border: Border.all(color:MyThemeData.primaryLightColor )
            ),
            child:
            InkWell(
              onTap:(){
                showThemebottomsheet(context);
              },
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(

                      provider.appMode == ThemeMode.light?
                      AppLocalizations.of(context)!.light

                         :  AppLocalizations.of(context)!.dark

                      ,
                   // style: TextStyle(color: MyThemeData.primaryLightColor),


                    style: provider.isDarkMode()?
                      Theme.of(context).textTheme.subtitle1
                          :Theme.of(context).textTheme.subtitle1
                      ),
                  Icon(Icons.arrow_drop_down_outlined,size: 25,color: MyThemeData.primaryLightColor,)

               ],
              ),
            ),
          ),
        ],

      ),


    );

  }

  void showlanguagebottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return LanguageBottomSheet();
        }
    );
  }

  void showThemebottomsheet(BuildContext context) {
    showModalBottomSheet(context: context,
        builder: (context){
          return ThemeBottomSheet();
        }
    );

  }}
