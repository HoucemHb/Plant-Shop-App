import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_shop_app/config/pallette.dart';
import 'package:plant_shop_app/models/plant.dart';
import 'package:plant_shop_app/pages/home_page.dart';
import 'package:plant_shop_app/pages/plant_interface.dart';

class MenuPlantWidget extends ConsumerWidget {
  MenuPlantWidget({
    super.key,
    required this.index,
  });

  int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(carouselControllerProvider);
    final _plant = ref.read(plantListProvider)[index];
    double _bluramoutnt = 0;
    if (_controller.position.haveDimensions)
      _bluramoutnt = (index - _controller.page!).abs().clamp(0.0, 1.0) * 3.0;
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 4, color: Colors.black26)
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(42)),
              color: Colors.white),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PlantInterface(
                            plant: _plant,
                          )));
                },
                child: Hero(
                  tag: '${_plant.description}',
                  child: Container(
                    width: 285,
                    height: 220,
                    decoration: ShapeDecoration(
                      color: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                    child: Image.asset(_plant.image),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _plant.description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Perfect for beginners or anyone looking for an easy-to-care-for plant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8B8B8B),
                  fontSize: 14,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AddToCart(plant: _plant, )
            ],
          ),
        ),
        Positioned.fill(
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return ClipRRect(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: _bluramoutnt, sigmaY: _bluramoutnt),
                    child: Container(),
                  ));
                }))
      ],
    );
  }
}

class AddToCart extends ConsumerWidget {
  const AddToCart(
      {super.key, this.fromPlantInterface = false, required this.plant});
  final bool fromPlantInterface;
  final Plant plant;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: () {
       fromPlantInterface? ref.read(cartListProvider.notifier).addItemToCart(plant):  Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlantInterface(plant: plant)));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(42),
          ),
        ),
        child: Row(children: [
          CircleAvatar(
              backgroundColor:
                  fromPlantInterface ? AppColors.primary : Colors.transparent,
              child: fromPlantInterface
                  ? Image.asset(
                      'lib\\assets\\images\\shopping-basket (2).png',
                      width: 18,
                    )
                  : Image.asset('lib\\assets\\images\\bag.png')),
          SizedBox(
            width: 5,
          ),
          Text(
            'Add to Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          Text(
            '\$${plant.price}',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w700,
            ),
          )
        ]),
      ),
    );
  }
}
