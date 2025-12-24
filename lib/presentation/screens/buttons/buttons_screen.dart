import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = 'bottons_screen';

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () { 
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override

  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme; 

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            
            ElevatedButton(
              onPressed:(){} , 
              child: const Text('Elevated ')
            ),
      
            const ElevatedButton(
              onPressed: null , 
              child: Text('Disable')
            ),
      
            ElevatedButton(
              onPressed: (){} , 
              child: Text('Enable')
            ),
      
            ElevatedButton.icon(
              label: Text('Elevated Icon'),
              onPressed: (){},
              icon: const Icon(Icons.access_alarm_rounded),
            ),

            FilledButton(
              onPressed: (){}, 
              child: Text('Filled')
            ),

            FilledButton.icon(
              label:Text('Filled'),
              onPressed: (){}, 
              icon: Icon(Icons.accessibility_new),
            ),

            OutlinedButton(
              onPressed: (){}, 
              child: const Text('Outline') 
            ),

            OutlinedButton.icon(
              icon: Icon(Icons.terminal),
              onPressed: (){}, 
              label: const Text('Outline icon') 
            ),

            TextButton(
              onPressed: (){}, 
              child: const Text('Text')
            ),

            TextButton.icon(
              onPressed: (){}, 
              label:  Text('Text'),
              icon: Icon(Icons.ac_unit_outlined),
            ),



            const CustomButton(),

            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.account_balance_wallet_outlined),
            ),

            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.account_balance_wallet_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {


    final colors = Theme.of(context).colorScheme;


    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:20,vertical: 10 ),
            child: Text('hola mundo',style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}