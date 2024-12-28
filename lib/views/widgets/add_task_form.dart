import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tasks/core/app_colors.dart';
import 'package:tasks/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:tasks/model/task_model.dart';
import 'package:tasks/views/widgets/colors_listView.dart';
import 'package:tasks/views/widgets/custom_btn.dart';
import 'package:tasks/views/widgets/custom_text_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  String? title, description;
  DateTime? date;
  bool? isDone, isArchived;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            controller: titleController,
            hint: "Enter a title",
            label: 'Title',
          ),
          CustomTextField(
            onSaved: (value) {
              description = value;
            },
            controller: descriptionController,
            hint: "Descripe the task",
            label: 'Description',
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030));
              if (pickedDate != null || pickedDate != selectedDate) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
            child: Container(
              width: 175,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: AppColors.mainColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                  ),
                  Text(
                    selectedDate != null
                        ? DateFormat.yMMMEd().format(selectedDate!)
                        : "Selete Date",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 20,
            children: [
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Cancle',
                backgeoundColor: Colors.white,
                color: Colors.black,
                icon: Icons.close,
                borderColor: Colors.white,
              ),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var taskModel = TaskModel(
                        title: title!,
                        description: description!,
                        date: selectedDate ?? DateTime.now(),
                        isDone: isDone ?? true,
                        isArchived: isArchived ?? true,
                        color: AppColors.mainColor.value);
                    BlocProvider.of<AddTaskCubit>(context).addTask(taskModel);
                  }
                },
                text: 'Add',
                icon: Icons.add,
                backgeoundColor: AppColors.mainColor,
                color: Colors.white,
                borderColor: Colors.black,
              ),
            ],
          ),
          ColorsListview()
        ],
      ),
    );
  }
}
