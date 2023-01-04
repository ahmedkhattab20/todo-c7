import 'package:flutter/material.dart';
import 'package:todo_v1/database/my_database.dart';
import 'package:todo_v1/database/task.dart';
import 'package:todo_v1/utils/date_utils.dart';
import 'package:todo_v1/utils/dialog_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.addTask,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.title),
              validator: (input) {
                if (input == null || input.trim().isEmpty == true) {
                  return 'please enter a valid title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descController,
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(labelText:AppLocalizations.of(context)!.description),
              validator: (input) {
                if (input == null || input.trim().isEmpty == true) {
                  return 'please enter a valid description';
                }
                return null;
              },
            ),
            SizedBox(
              height: 12,
            ),
            Text(AppLocalizations.of(context)!.selectDate,
                style: Theme.of(context).textTheme.headline6),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showTaskDatePicker();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(MyDateUtils.formattaskDate(selectedDate),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Theme.of(context).primaryColor)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  insertTask();
                },
                child: Text(AppLocalizations.of(context)!.submit))
          ],
        ),
      ),
    );
  }

  void insertTask() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Task task = Task(
        title: titleController.text,
        description: descController.text,
        dateTime: selectedDate);
    DialogUtils.hideDialog(context);

    DialogUtils.ShowLoadingDialog(context, 'loading...');
    print('/////////////////////////before task added////////////////////////////');

    try{
      //print('/////////////////////////before task added////////////////////////////');
      await MyDatabase.insertTask(task);
      print('task added');
      DialogUtils.ShowMessage(context, 'Task add successfully',
          posActiontitle: 'OK',
          posAction: (){
            Navigator.pop(context);
          },
      );

    }catch(e){
      DialogUtils.ShowMessage(context, 'Error inserting task',
        posActiontitle: 'Try Again',
        posAction: (){
         insertTask();
         Navigator.pop(context);
        },
      );

    }

  }

  var selectedDate = DateTime.now();
  void showTaskDatePicker() async {
    var userSekectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (userSekectedDate == null) {
      return;
    }
    setState(() {
      selectedDate = userSekectedDate;
    });
  }
}
