library createtask_component;

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/pages/home/components/errorfirebase_component.dart';
import 'package:my_app/pages/home/components/loader_component.dart';
import 'package:my_app/pages/home/home_page.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorFirebase();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const MyApp();
        }
        return const Loader();
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
