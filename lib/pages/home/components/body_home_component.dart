library body_home_component;

import 'package:flutter/material.dart';
import 'package:my_app/pages/home/components/addtask_component.dart';
import 'package:my_app/pages/home/components/task_component.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() {
    return _BodyHomeState();
  }
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: const [
          AddTask(),
          Expanded(child: Tasks()),
        ],
      );
  }
}
