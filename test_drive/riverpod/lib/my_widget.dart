import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folder_manager/notifier.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final s1 = ref.watch(s1NotifierProvider);

    final button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(s1NotifierProvider.notifier);
        notifier.updateState();
      },
       child: const Text('ボタン'),
    );
    
    // 縦に並べる
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('$s1'),
        button,
      ],
    );
  }
}