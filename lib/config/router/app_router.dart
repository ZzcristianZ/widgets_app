import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

// GoRouter configuration
final  appRouter= GoRouter(
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),

    GoRoute(
      name: CardsScreens.name,
      path: '/cards',
      builder: (context, state) => const CardsScreens(),
    ),
  ],
);