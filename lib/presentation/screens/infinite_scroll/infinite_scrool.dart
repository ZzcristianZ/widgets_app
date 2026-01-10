import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class InfiniteScrool extends StatefulWidget {

  static const name = 'infinite_scroll_screen';

  const InfiniteScrool({super.key});

  @override
  State<InfiniteScrool> createState() => _InfiniteScroolState();
}

class _InfiniteScroolState extends State<InfiniteScrool> {

  List<int> imagesIds = [1,2,3,4,5,6,7];
  final ScrollController scrollcontroller = ScrollController();
  bool isLoaidng = false;

  @override
  void initState() {
    super.initState();
    scrollcontroller.addListener( (){
      if ((scrollcontroller.position.pixels+500)>=scrollcontroller.position.maxScrollExtent) {
        loadNextPage();
      }
    });

  }


  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  Future loadNextPage() async{
    
    if (isLoaidng) return;
    isLoaidng = true;  
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 1500));

    addSevenImages();
    isLoaidng = false;



    setState(() {});      
  }

  Future <void> onRefresh()  async{
    isLoaidng = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));
    final lastId = imagesIds.last;
    isLoaidng = false;
    imagesIds.clear();
    imagesIds.add(lastId+1);

    addSevenImages();
    setState(() {});
  }



  void addSevenImages(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5,6,7].map(  (e) =>  lastId + e,)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollcontroller,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInUp(
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                
                ),
              );
            },
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed:  isLoaidng ? null : () => context.pop(),
        child: isLoaidng
            ? SpinPerfect(
              infinite: true,
                child: const Icon(Icons.refresh_rounded),
              )
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      
    );
  }
}