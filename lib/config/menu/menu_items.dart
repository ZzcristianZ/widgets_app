import 'package:flutter/material.dart';



class MenuItems {
  
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}


const appMenuItems = <MenuItems>[
  MenuItems(
    title:'Botones' ,
    subTitle: 'Varios Botones En Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),

  MenuItems(
    title: 'targetas', 
    subTitle: 'un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

   MenuItems(
    title: 'progress Indicators', 
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItems(
    title: 'Snackbar y dialogos', 
    subTitle: 'indicadores en pantalla', 
    link: '/snackbar', 
    icon: Icons.info_outline
  ),


  MenuItems(
    title: 'Screen de animaciones', 
    subTitle: 'Formas Y Figuras', 
    link: '/AnimatedScreen', 
    icon: Icons.animation
  ),

  MenuItems(
    title: 'UI Controls', 
    subTitle: 'Serie de Controles', 
    link: '/UiControlsScreen', 
    icon: Icons.comment_rounded
  ),
  
  MenuItems(
    title: 'Introduccion a la App', 
    subTitle: 'Turorial de la app', 
    link: '/AppTutorialScreen', 
    icon: Icons.accessibility_new_rounded
  ),

  MenuItems(
    title: 'InfiniteScrool y Pull', 
    subTitle: 'Listas infinitas y pull to refresh', 
    link: '/InfiniteScrool', 
    icon: Icons.list_alt_rounded
  ),

];


