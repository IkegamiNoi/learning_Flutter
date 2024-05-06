import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folder_manager/notifier.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final s1 = ref.watch(s1NotifierProvider);
    return Text('$s1');
  }
}