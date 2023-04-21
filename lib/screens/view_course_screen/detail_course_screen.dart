import 'package:flutter/material.dart';

import '../shared_components/my_drop_down.dart';

class CourseTopicsScreen extends StatefulWidget {
  const CourseTopicsScreen({super.key});

  @override
  State<CourseTopicsScreen> createState() => _CourseTopicsScreenState();
}

class _CourseTopicsScreenState extends State<CourseTopicsScreen> {
  int currentIndex = 0;
  void onPageChanged(int? index) {
    if (index == null) return;
    currentIndex = index;
    setState(() {});
  }

  bool isAtStart() => currentIndex == 0;
  bool isAtEnd() => currentIndex == 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 36,
                  onPressed: isAtStart()
                      ? null
                      : () => onPageChanged(currentIndex - 1),
                  icon: const Icon(Icons.arrow_circle_left_outlined)),
              MyDropDownWidget<String>(
                dataList: const ["Topic 1", "Topic 2"],
                hint: "Pick a topic",
                choosenIndex: currentIndex,
                onValueChanged: onPageChanged,
              ),
              IconButton(
                  iconSize: 36,
                  onPressed:
                      isAtEnd() ? null : () => onPageChanged(currentIndex + 1),
                  icon: const Icon(Icons.arrow_circle_right_outlined)),
            ],
          ),
          const Center(
            child: Text("PDF viewer"),
          )
        ],
      ),
    );
  }
}
