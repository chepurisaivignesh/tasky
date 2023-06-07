import 'package:flutter/material.dart';
import 'package:task_management_app/presentation/widgets/custom_text_widget.dart';
import 'package:action_slider/action_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = ActionSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/2.jpeg"), fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Tasky',
                    fontSize: 36.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.0),
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextWidget(
                        text:
                            'Life without goals is like flying a plane not knowing where you want to land. The purpose of life is to know where we want to go and then go there.',
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              ActionSlider.standard(
                backgroundColor: Colors.white.withOpacity(0.9),
                controller: _controller,
                toggleColor: Colors.blue.shade500,
                width: double.maxFinite,
                icon: Icon(Icons.flight_takeoff, color: Colors.white),
                successIcon: Icon(Icons.flight),
                child: const CustomTextWidget(
                  text: 'Set tasks to achive your goals',
                  color: Colors.blue,
                ),
                action: (controller) async {
                  _controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(seconds: 1));
                  _controller.success(); //starts success animation
                  Navigator.of(context).pushReplacementNamed('/tasks');
                  _controller.reset(); //resets the slider
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
