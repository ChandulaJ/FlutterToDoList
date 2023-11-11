import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(12.0)),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(width: 2.0, color: Colors.black12),
              ),
             // borderRadius: BorderRadius.circular(12.0)),
        ),
          child: Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                splashRadius: 2.0,
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.blue[800],
              ),
              Text(
                taskName,
                style: GoogleFonts.openSans(
                 // fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: taskCompleted ? 5.0 : null,
                ),
              )

            ],
          ),
        ),
      ),
      );

  }
}
