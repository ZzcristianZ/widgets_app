import 'package:flutter/material.dart';



class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = 'bottons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: const Placeholder(),
    );
  }
}