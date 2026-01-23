// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';





class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static const name = 'Theme_changer_screen';

  @override
  Widget build(BuildContext context, ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [IconButton(
        icon:  isDarkMode
        ?Icon(Icons.light_mode_rounded)
        :Icon(Icons.dark_mode_rounded),
        onPressed: (){
          ref.read(isDarkModeProvider.notifier).state=!isDarkMode;
        }
        )],
      ),
      body:const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colortheme = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colortheme.length,
      itemBuilder:  (context, index) {
        final color = colortheme[index];
        return RadioListTile(
          title: Text('Este color',style: TextStyle(color: color),),
          subtitle: Text('${color.g}'),
          value: index,
          activeColor: color,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}