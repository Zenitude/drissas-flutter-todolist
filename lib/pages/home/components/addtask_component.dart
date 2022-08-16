// ignore_for_file: avoid_print

library addtask_component;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> {
  TextEditingController addTaskController = TextEditingController();

  final dataReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 250,
              height: 40,
              child: TextFormField(
                controller: addTaskController,
                decoration: const InputDecoration(
                    hintText: 'Entrez une nouvelle tâche',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  addDataToFirebase();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void addDataToFirebase() {

    try {
      dataReference
          .collection('todolist')
          .add({
            "done": false,
            "decoration": "none",
            "text": addTaskController.text.toString(),
            "time": DateFormat('HH:MM').format(DateTime.now())
          }).then(
            (value) => print(value.id));
    } catch (error) {
      print(error.toString());
    }
  }
}
