import 'package:flutter/material.dart';
import 'package:todo_v1/my_theme.dart';
import 'package:todo_v1/ui/home/add_task.dart';
import 'package:todo_v1/ui/home/setting_tab/setting_tab.dart';
import 'package:todo_v1/ui/home/task_tab/tasks_tab.dart';
import 'package:todo_v1/providers/AppConfigProvider.dart';

import 'package:provider/provider.dart';




class HomeScreen extends StatefulWidget {
static const String routName ='ui.ui.home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);    //provider

    return Scaffold(
      backgroundColor:provider.isDarkMode()?MyThemeData.backgroundColorDark:MyThemeData.backgroundColorLight,
      appBar: AppBar(
        elevation: 0,
        title: Text('To Do List', style: Theme
            .of(context)
            .primaryTextTheme
            .headline1,
        ),

      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(

            side: BorderSide(
                color:provider.isDarkMode()?
        MyThemeData.whiteColor:
        MyThemeData.whiteColor, width: 4),

        ),
        onPressed: () {
          ShowAddTaskBottomSheet();

        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: provider.isDarkMode()?
        MyThemeData.secondaryDarkColor:
        Colors.transparent,
          currentIndex: selectedIndexTab,
          onTap: (index) {
            selectedIndexTab = index;
            setState(() {
            });
          },

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list_rounded), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: ''),
          ],
        ),
      ),
      body: tabs[selectedIndexTab],

    );
  }
    var tabs =[
      TasksTab(),SettingTab()
    ];

    void ShowAddTaskBottomSheet() {
      showModalBottomSheet(context: context, builder: (buildeContext){
        return AddTask();
      });

    }
}
