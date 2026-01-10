import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la Comida',
    'Dolore mollit quis velit officia proident reprehenderit ad ut consectetur laboris ex. Proident proident officia non ea aliquip voluptate nostrud mollit veniam deserunt eu. Labore consequat aliquip nostrud fugiat sunt cupidatat Lorem ipsum exercitation.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega Rapida',
    'Voluptate ad cupidatat tempor enim officia id id proident magna ea occaecat pariatur veniam. Ipsum est reprehenderit non cillum. Ad et exercitation culpa eiusmod mollit laboris anim aliquip sit incididunt. Nulla reprehenderit reprehenderit cillum laboris do pariatur id quis sunt officia. Incididunt et id incididunt voluptate Lorem sunt. Eiusmod commodo voluptate do ut. Cupidatat aliqua magna reprehenderit occaecat cillum amet anim mollit id.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta La Comida',
    'Cillum aute aute adipisicing id Lorem dolore cillum id quis tempor ea occaecat elit. Anim sint cupidatat dolore elit anim ex dolore amet pariatur ad incididunt labore sint consequat. Incididunt non consequat commodo veniam nisi nulla nisi. Consequat aliqua proident velit ut. Aute consequat sunt culpa qui incididunt aute laborum enim reprehenderit proident. Aliquip ut ullamco in nisi et incididunt laboris commodo. Ea voluptate anim minim excepteur nulla consectetur ut commodo.',
    'assets/images/3.png',
  ),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReacehed = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;

      if (!endReacehed && page >= (slides.length - 1.5)) {
        setState(() {
          endReacehed = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),

          endReacehed? Positioned(
            right: 20,
            bottom: 50,
            child: FadeInUpBig(
              from: 15,
              delay: Duration(milliseconds: 400),
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Comenzar'),
              ),
            ),
          ): SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
