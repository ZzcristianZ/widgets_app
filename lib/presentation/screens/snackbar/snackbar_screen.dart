import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showcustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content:const Text('Hi how are you'),
      action: SnackBarAction(
        label: 'OK!', onPressed: (){}
      ),
      duration: Duration(seconds: 1),
    
    );   
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }


  void openDialog(BuildContext context){

    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estás seguro ?'),
        content: const Text('Esse magna eu esse nisi reprehenderit est culpa eiusmod id. Exercitation in adipisicing ad eu irure non voluptate nisi do ut laboris. Cillum labore mollit nisi cillum excepteur voluptate sint laboris cillum pariatur aute dolor. Ex minim id nisi sunt non nulla cillum enim irure. Occaecat in pariatur qui sint sunt dolore ad duis consectetur minim aute.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cerrar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
      
    );


  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Ullamco velit exercitation esse Lorem id officia. Nostrud laboris officia ipsum aute minim culpa cupidatat et enim labore laborum aliqua mollit et. Culpa dolor non dolore eu eu ea aute proident minim in labore sit. Duis et qui nisi eiusmod laborum ea consequat aliqua laboris elit id in. Dolor amet aliquip est consectetur adipisicing dolor. Non cillum consectetur esse cillum ipsum proident voluptate cillum minim commodo culpa pariatur ex. Duis ea sit duis ad ipsum ipsum veniam amet irure.')
                  ]
                );
              },
              child: Text('Licencias Usadas')
            ),
            
            SizedBox(height: 20),

            FilledButton.tonal(
              onPressed: () => openDialog(context),child: Text('Mostrar Codigo')
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showcustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
        
    );
  }
}