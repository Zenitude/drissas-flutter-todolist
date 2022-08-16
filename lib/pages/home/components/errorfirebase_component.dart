library errorfirebase_component;

import 'package:flutter/material.dart';

class ErrorFirebase extends StatelessWidget {
  const ErrorFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Mon app - Erreur')),
        body:  const Center(child: Text('Erreur de chargement des données.'),),
      ),
    );
  }
}
