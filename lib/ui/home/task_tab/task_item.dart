import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_v1/database/task.dart';
import 'package:todo_v1/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:todo_v1/providers/AppConfigProvider.dart';



class TaskItem extends StatelessWidget {
  Task task;
  TaskItem(this.task);
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);    //provider

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 12),

      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Slidable(

        startActionPane:ActionPane(
          extentRatio: 0.2,
          motion: DrawerMotion(),
          children: [SlidableAction(onPressed: (bulidContext){

          },
            backgroundColor: Colors.red,
            label: 'Delete',
            icon: Icons.delete_rounded,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),

            ),
          )

          ],
        ),
        child: Container(

            height: 120,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:provider.isDarkMode()?
            MyThemeData.secondaryDarkColor:
            MyThemeData.whiteColor,
            borderRadius: BorderRadius.circular(18), ),

            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,right: 20,),
                  height: 155,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(task.title,
                        style: Theme.of(context).textTheme.headline5
                            ?.copyWith(color:Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 8,),

                      Text(task.description,
                        style: TextStyle(
                        color: provider.isDarkMode()?
                        MyThemeData.whiteColor:
                        MyThemeData.blackColor,
                      ),)

                    ],
                  ),

                ),
                SizedBox(width: 8,),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(Icons.check_rounded,color:Colors.white,size: 40,),
                ),

              ],
            )),
      ),
    );
  }
}
