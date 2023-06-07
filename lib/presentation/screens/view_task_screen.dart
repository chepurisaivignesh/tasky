import 'package:flutter/material.dart';

import '../widgets/custom_text_widget.dart';

class ViewScreenArguments {
  final String title;
  final String description;

  ViewScreenArguments({required this.title, required this.description});
}

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({super.key});

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ViewScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('View Task'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: Image(
              image: AssetImage("assets/images/2.jpeg"),
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                tileColor: Colors.blue,
                title: CustomTextWidget(
                  textAlign: TextAlign.start,
                  text: args.title,
                  fontSize: 32.0,
                ),
                subtitle: CustomTextWidget(
                  textAlign: TextAlign.start,
                  text: args.description,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
