import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_shop_app/config/pallette.dart';
import 'package:plant_shop_app/models/plant.dart';
import 'package:plant_shop_app/models/widgets/menu_plant.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

import '../global/bottom_nav_bar.dart';

final carouselControllerProvider = Provider<PageController>(
    (ref) => PageController(initialPage: 0, viewportFraction: 0.8));

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(carouselControllerProvider);
    final _plantList = ref.watch(plantListProvider);
    final _categoryList = ref.watch(categoryListProvider);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFAFCFF), Color(0xffDEEDFE)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Header(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: _CategoryWidget(category: _categoryList[index],),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Plant Collections',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          //TODO: on arrow pressed
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
                ),
                Expanded(
                  child: AspectRatio(
                      aspectRatio: 0.87,
                      child: PageView.builder(
                          controller: _controller,
                          itemCount: _plantList.length,
                          itemBuilder: (context, index) =>
                              CarouselView(index: index))),
                ),
                SizedBox(height: 110,)
              ],
            ),
          ),
          Positioned(
            child: BottomNavBar(),
            bottom: 0,
          )
        ],
      ),
    ));
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Title()),
          Container(
            width: 40,
            height: 64,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  width: 0.5,
                  color: Color(0xFF105D5C),
                ),
              ),
            ),
            child: Center(
              child:
                  Image.asset('lib\\assets\\images\\menu_icon.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselView extends ConsumerWidget {
  const CarouselView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(carouselControllerProvider);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 0.0;
        //  double scaleFactor =    (index - _controller.page!).abs().clamp(0.0, 1.0) * 5.0;
        if (_controller.position.haveDimensions) {
          value = index.toDouble() - (_controller.page ?? 0);
          value = (value * 0.05).clamp(-1, 1);
        }
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Transform.rotate(
            angle: math.pi * value,
            child: MenuPlantWidget(
              index: index,
            ),
          ),
        );
      },
    );
  }
}

class _CategoryWidget extends ConsumerWidget {
  const _CategoryWidget({required this.category});
  final String category;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedCategory.notifier).state=category;
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: 90,
        height: 46,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        ),
        child: Container(
          width: 74,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: ShapeDecoration(
            color: Color(0xFF44F1A6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Supreme',
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Let’s Make our\nlives ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Greener',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
