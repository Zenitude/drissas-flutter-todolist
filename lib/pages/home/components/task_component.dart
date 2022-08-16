
library task_component;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<StatefulWidget> {
  final dataReference = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: StreamBuilder(
        stream: dataReference.collection("todolist").snapshots(),
        builder:
            ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return CheckboxListTile(
                  title: Text(
                    document['text'],
                  ),
                  subtitle: Text(document['time']),
                  value: document['done'],
                  activeColor: Colors.amber,
                  secondary: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.grey),
                      onPressed: () {
                        deleteItem(document.id);
                      }),
                  onChanged: (value) {
                    updateItem(document.id, value!);
                  });
            }).toList(),
          );
        }),
      ),
    );
  }

  void updateItem(String itemId, bool itemDone) {
    dataReference.collection('todolist').doc(itemId).update({"done": itemDone});
  }

  void deleteItem(String itemId) {
    dataReference.collection('todolist').doc(itemId).delete();
  }

}
