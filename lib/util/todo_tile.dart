import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  // VoidCallback deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    // required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            //check box
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.amber,
            ),

            // task name
            Text(
                taskName,
              style: TextStyle(
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),

      //       IconButton(
      //           onPressed: deleteFunction,
      //           icon: Icon(Icons.delete, color: Colors.black,),
      // )
          ],
        ),
        decoration: BoxDecoration(color: Colors.amber[100],
            borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}
