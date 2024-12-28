import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tasks/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks/model/task_model.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(1, 8),
              color: Colors.black.withOpacity(0.1))
        ],
        color:
            widget.task.isDone ? Color(widget.task.color!) : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.task.title,
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: widget.task.isDone ? Colors.black : Colors.grey[400]),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.description,
                    style: TextStyle(
                        fontSize: 20,
                        color: widget.task.isDone
                            ? Colors.black
                            : Colors.grey[400]),
                  ),
                  Text(
                    DateFormat.yMMMEd().format(widget.task.date),
                    style: TextStyle(
                        fontSize: 15,
                        color: widget.task.isDone
                            ? Colors.black
                            : Colors.grey[400]),
                  ),
                ],
              ),
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Task has Done"),
                          backgroundColor: Colors.green,
                        ));
                        BlocProvider.of<TasksCubit>(context)
                            .markTaskAsDone(widget.task);
                        setState(() {
                          widget.task.isDone = !widget.task.isDone;
                        });
                      },
                      icon: Icon(
                        widget.task.isDone
                            ? Icons.check_circle_outlined
                            : Icons.check_circle_sharp,
                        color: widget.task.isDone
                            ? Colors.black87
                            : Colors.green[300],
                      )),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        widget.task.isArchived
                            ? ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text("Task has Archived"),
                                backgroundColor: Colors.green,
                              ))
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text("Task has removed from Archive"),
                                backgroundColor: Colors.blueGrey,
                              ));
                        BlocProvider.of<TasksCubit>(context)
                            .markTaskAsArchived(widget.task);
                        setState(() {
                          widget.task.isArchived = !widget.task.isArchived;
                        });
                      },
                      icon: Icon(
                        Icons.book,
                        color: widget.task.isArchived
                            ? widget.task.isDone
                                ? Colors.black
                                : Colors.grey[400]
                            : Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
