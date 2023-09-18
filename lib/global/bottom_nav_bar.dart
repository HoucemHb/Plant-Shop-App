import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_shop_app/global/transition.dart';
import 'package:plant_shop_app/models/plant.dart';
import 'package:plant_shop_app/pages/pannier.dart';
import 'package:sizer/sizer.dart';

import '../config/pallette.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cartItemNumber = ref.watch(cartListProvider).length;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(CustomPageRoute(child: const BasketInterface()));
      },
      child: Stack(children: [
        ClipPath(
            clipper: BottomNavBarClipper(),
            child: Container(
              color: AppColors.primary,
              width: 100.w,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Center(
                        child: Text(
                          '$cartItemNumber',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '$cartItemNumber items',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: 120,
                      height: 46,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('lib\\assets\\images\\pot1.png'),
                              backgroundColor: AppColors.secondary,
                              radius: 23,
                            ),
                          ),
                          Positioned(
                            right: 25,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('lib\\assets\\images\\pot2.png'),
                              backgroundColor: AppColors.secondary,
                              radius: 23,
                            ),
                          ),
                          Positioned(
                            right: 50,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('lib\\assets\\images\\pot3.png'),
                              backgroundColor: AppColors.secondary,
                              radius: 23,
                            ),
                          ),
                          Positioned(
                            right: 75,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('lib\\assets\\images\\pot1.png'),
                              backgroundColor: AppColors.secondary,
                              radius: 23,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
        Positioned(
          top: 10,
          left: 42.w,
          right: 42.w,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primary,
            ),
            height: 4,
            width: 60,
          ),
        )
      ]),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(0, size.height, 70, size.height);
    path.lineTo(size.width - 70, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, 0, size.width - 70, 0);
    path.lineTo(size.width - 100, 0);
    path.quadraticBezierTo(size.width - 110, 0, size.width - 117, 3);
    path.lineTo(size.width - 165, 25);
    path.lineTo(167, 25);
    path.quadraticBezierTo(165, 25, 163, 25);
    path.lineTo(111, 3);
    path.quadraticBezierTo(100, 0, 95, 0);
    path.lineTo(70, 0);
    path.quadraticBezierTo(0, 0, 0, size.height / 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
