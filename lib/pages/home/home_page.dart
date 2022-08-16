library home_page;

import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar_widget.dart';
import 'package:my_app/pages/home/components/body_home_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Flutter Firebase'),
      body: BodyHome(),
    );
  }
}
