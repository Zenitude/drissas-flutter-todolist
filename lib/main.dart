import 'package:flutter/material.dart';
import 'package:my_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/pages/home/components/createtask_component.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CreateTask());
}
