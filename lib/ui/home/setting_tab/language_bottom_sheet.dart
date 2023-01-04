import 'package:flutter/material.dart';
import 'package:todo_v1/providers/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_v1/my_theme.dart';
import 'package:provider/provider.dart';





class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);    //provider

    return Container(
      padding: EdgeInsets.all(20),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          InkWell(
            onTap: (){
              provider.changeLanguage('en');
              print('in english');
            },
            child: provider.appLanguage =='en'?
            getSelectedItemWidget( AppLocalizations.of(context)!.english)
                :  getUnSelectedItemWidget( AppLocalizations.of(context)!.english),
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
              print('in arabic');
            },
          child: provider.appLanguage =='ar'?
          getSelectedItemWidget( AppLocalizations.of(context)!.arabic)
              :  getUnSelectedItemWidget( AppLocalizations.of(context)!.arabic),
            ),



        ],
      ),



    );
  }
  Widget getSelectedItemWidget(String text){
    var provider =Provider.of<AppConfigProvider>(context);    //provider

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$text",style: TextStyle(
          color:
          provider.isDarkMode()?
          MyThemeData.primaryLightColor:
          MyThemeData.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
        Icon(Icons.check,size: 25,color:
        provider.isDarkMode()?
        MyThemeData.primaryLightColor:
        MyThemeData.primaryDarkColor,

          ),
      ],
    );

  }
  Widget getUnSelectedItemWidget(String text){
    var provider =Provider.of<AppConfigProvider>(context);    //provider

    return Text("$text",style: TextStyle(
    color:provider.isDarkMode()?
    MyThemeData.whiteColor:
    MyThemeData.blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
    ),
    );
  }

}
