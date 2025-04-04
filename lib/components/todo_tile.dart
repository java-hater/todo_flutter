import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.isComplete, 
    required this.onChanged,
    required this.deleteFunction,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:24.0, right: 24.0, top: 24.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(12),
          )
            
          ]),
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: isComplete,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // name of task
              Text(
                taskName,
                style: TextStyle(decoration: isComplete ? TextDecoration.lineThrough: TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}