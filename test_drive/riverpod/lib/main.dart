// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folder_manager/my_widget.dart';

void main() {
  const app = MyApp();
  const scope = ProviderScope(child: app); //reverpodの使用で必須
  runApp(scope); //reverpodの使用で必須
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyWidget(),
          // child: MyWidget1(),
          // child: MyWidget2(),
          // child: MyWidget3(),
          // child: MyWidget4(),
        ),
      ),
    );
  }
}