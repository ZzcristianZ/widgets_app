import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {


  bool isDeveloper = true;
  Transportation? selectedTransportation;
  bool wantsBreakfast =false;
  bool wantsLunch =false;
  bool wantsDinner =false;


  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          activeThumbColor: Colors.red,
          title: const Text('Developper mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = value;
          }),
        ),

        ExpansionTile(
          collapsedIconColor: Colors.red,
          textColor: Colors.blue,
          title: const Text('Vehículo De Transporte'),
          subtitle: Text(selectedTransportation?.name ?? 'ninguno'),
          children: [
            RadioGroup<Transportation>(
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = value;
              }),
              child: Column(
                children: [
                  RadioListTile<Transportation>(
                    value: Transportation.car,
                    title: const Text('By Car'),
                    subtitle: const Text('Viajar Por Carro'),
                  ),
                  RadioListTile<Transportation>(
                    value: Transportation.boat,
                    title: const Text('By Boat'),
                    subtitle: const Text('Viajar Por Bote'),
                  ),
                  RadioListTile<Transportation>(
                    value: Transportation.plane,
                    title: const Text('By Plane'),
                    subtitle: const Text('Viajar Por Avion'),
                  ),
                  RadioListTile<Transportation>(
                    value: Transportation.submarine,
                    title: const Text('By Submarine'),
                    subtitle: const Text('Viajar Por Submarino'),
                  ),
                  Text(
                    'El valor escogido ha sido : ${selectedTransportation?.name ?? 'ninguno'}',
                  ),
                ],
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: Text('Desayuno'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast =! wantsBreakfast;
          }),
        ),

        CheckboxListTile(
          title: Text('almuerzo'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch =! wantsLunch;
          }),
        ),  
        
        CheckboxListTile(
          title: Text('Cena'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner =! wantsDinner;
          }),
        ),
      ],
    );
  }
}
