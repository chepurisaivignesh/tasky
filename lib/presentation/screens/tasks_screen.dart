import 'package:flutter/material.dart';
import 'package:task_management_app/presentation/screens/edit_task_screen.dart';
import 'package:task_management_app/presentation/screens/view_task_screen.dart';
import 'package:task_management_app/presentation/widgets/custom_text_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 2,
                child: Image(
                  image: AssetImage("assets/images/2.jpeg"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned.fill(
                bottom: 16,
                left: 16,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.task_alt, color: Colors.blue),
                          SizedBox(width: 8.0),
                          CustomTextWidget(
                            text: '5',
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Dismissible(
                    key: Key('task $index'),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.green,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(width: 16.0),
                          Icon(Icons.check_circle_outline_outlined,
                              color: Colors.white),
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.red,
                      ),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.delete_rounded, color: Colors.white),
                          SizedBox(width: 16.0),
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        print('Task $index completed');
                      } else {
                        print('Task $index deleted');
                      }
                    },
                    child: GestureDetector(
                      onDoubleTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                  '/edit-task',
                                  arguments: EditScreenArguments(
                                      'Title ${index + 1}',
                                      'Description ${index + 1}'),
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.edit),
                                  title: CustomTextWidget(
                                    textAlign: TextAlign.start,
                                    text: 'Edit',
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                    '/view-task',
                                    arguments: ViewScreenArguments(
                                        title: 'Title ${index + 1}',
                                        description:
                                            'Description ${index + 1}')),
                                child: ListTile(
                                  leading: Icon(Icons.remove_red_eye),
                                  title: CustomTextWidget(
                                    textAlign: TextAlign.start,
                                    text: 'View',
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        tileColor: Colors.blue,
                        title: CustomTextWidget(
                          textAlign: TextAlign.start,
                          text: 'Task ${index + 1}',
                          fontSize: 16.0,
                        ),
                        subtitle: CustomTextWidget(
                          textAlign: TextAlign.start,
                          text: 'Description ${index + 1}',
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          backgroundColor: Colors.white,
          onPressed: () => Navigator.of(context).pushNamed('/add-task')),
    );
  }
}
