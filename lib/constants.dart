import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:tasks/model/task_model.dart';

const kTaskBox = "task_box";

dynamic deleteAllTasks(BuildContext context) {
  return PanaraConfirmDialog.show(
    context,
    title: "Are you sure?",
    message: "Do you really want to delete all tasks?",
    confirmButtonText: "yes",
    cancelButtonText: "No",
    panaraDialogType: PanaraDialogType.error,
    barrierDismissible: true,
    onTapConfirm: () {
      Hive.box<TaskModel>(kTaskBox).clear();
      Navigator.pop(context);
    },
    onTapCancel: () {
      Navigator.pop(context);
    },
  );
}
