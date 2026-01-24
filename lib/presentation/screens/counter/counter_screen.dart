import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});
  static const name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(counterProvider);
    final modeScreen = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen'),
      actions: [IconButton(
        icon: modeScreen 
        ?Icon(Icons.dark_mode_rounded)
        :Icon(Icons.light_mode_rounded),
        onPressed: (){
          ref.read(themeNotifierProvider.notifier).toogleDarkMode();
        }
        )
      ],
      ),
      body: Center(
        child: Text(
          'valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

















