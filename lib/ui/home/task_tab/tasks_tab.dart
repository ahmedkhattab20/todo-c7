import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_v1/database/task.dart';
import 'package:todo_v1/my_theme.dart';
import 'package:todo_v1/ui/home/task_tab/task_item.dart';
import 'package:provider/provider.dart';
import 'package:todo_v1/providers/AppConfigProvider.dart';


class TasksTab extends StatelessWidget {
List<Task> allTasks=[];
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);    //provider

    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: provider.isDarkMode()?
            MyThemeData.whiteColor:
            MyThemeData.blackColor,
            dayColor:provider.isDarkMode()?
            MyThemeData.whiteColor:
            MyThemeData.blackColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyThemeData.primaryLightColor,

            dotsColor: Colors.white,
            locale: 'en_ISO',
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return TaskItem(allTasks[index]);
              },
              itemCount: allTasks.length,
            ),
          )
        ],
      ),
    );
  }
}
