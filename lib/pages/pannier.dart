import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_shop_app/config/pallette.dart';
import 'package:plant_shop_app/models/plant.dart';
import 'package:plant_shop_app/pages/plant_interface.dart';
import 'package:sizer/sizer.dart';

class BasketInterface extends ConsumerWidget {
  const BasketInterface({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cartList = ref.watch(cartListProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Cart ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Center(
                      child: Text(
                        '${cartList.length}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: Color(0xFF13283C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
                child: ListView.separated(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) => BasketItem(plant: cartList[index]),
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              Spacer(),
              BasketTotalAmount()
            ],
          ),
        ),
      ),
    );
  }
}

class BasketTotalAmount extends ConsumerWidget {
  const BasketTotalAmount({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cartList = ref.watch(cartListProvider);
    
    return ClipPath(
      clipper: BasketTotalClipper(),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 25.h,
        width: 100.w,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Delivery Amount',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  '\$25.50',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white.withOpacity(0.3),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Total Amount',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  '\$${ref.read(cartListProvider.notifier).getTotal()}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 350,
              height: 60,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50),
                  borderRadius: BorderRadius.circular(42),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Make Payment',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: Colors.black.withOpacity(0.699999988079071),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38),
                      ),
                    ),
                 
                    child: Center(
                        child: Lottie.asset(
                            'lib\\assets\\lottie_animation\\animation_llatec9t.json',
                            height: 20)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BasketTotalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1269841);
    path_0.cubicTo(0, size.height * 0.06712341, 0, size.height * 0.03719278,
        size.width * 0.01226777, size.height * 0.01859639);
    path_0.cubicTo(size.width * 0.02453555, 0, size.width * 0.04428037, 0,
        size.width * 0.08376963, 0);
    path_0.lineTo(size.width * 0.2416728, 0);
    path_0.cubicTo(size.width * 0.2567259, 0, size.width * 0.2642513, 0,
        size.width * 0.2711806, size.height * 0.003813155);
    path_0.cubicTo(
        size.width * 0.2781073,
        size.height * 0.007626310,
        size.width * 0.2838796,
        size.height * 0.01494726,
        size.width * 0.2954241,
        size.height * 0.02958921);
    path_0.lineTo(size.width * 0.3569005, size.height * 0.1075524);
    path_0.cubicTo(
        size.width * 0.3684450,
        size.height * 0.1221940,
        size.width * 0.3742199,
        size.height * 0.1295151,
        size.width * 0.3811466,
        size.height * 0.1333282);
    path_0.cubicTo(
        size.width * 0.3880733,
        size.height * 0.1371417,
        size.width * 0.3955995,
        size.height * 0.1371417,
        size.width * 0.4106518,
        size.height * 0.1371417);
    path_0.lineTo(size.width * 0.4988377, size.height * 0.1371417);
    path_0.lineTo(size.width * 0.5946492, size.height * 0.1371417);
    path_0.cubicTo(
        size.width * 0.6082539,
        size.height * 0.1371417,
        size.width * 0.6150576,
        size.height * 0.1371417,
        size.width * 0.6214110,
        size.height * 0.1339861);
    path_0.cubicTo(
        size.width * 0.6277644,
        size.height * 0.1308306,
        size.width * 0.6332487,
        size.height * 0.1247290,
        size.width * 0.6442173,
        size.height * 0.1125254);
    path_0.lineTo(size.width * 0.7232251, size.height * 0.02461627);
    path_0.cubicTo(
        size.width * 0.7341937,
        size.height * 0.01241270,
        size.width * 0.7396780,
        size.height * 0.006310873,
        size.width * 0.7460314,
        size.height * 0.003155444);
    path_0.cubicTo(size.width * 0.7523848, 0, size.width * 0.7591885, 0,
        size.width * 0.7727932, 0);
    path_0.lineTo(size.width * 0.9162304, 0);
    path_0.cubicTo(size.width * 0.9557199, 0, size.width * 0.9754634, 0,
        size.width * 0.9877330, size.height * 0.01859639);
    path_0.cubicTo(size.width, size.height * 0.03719278, size.width,
        size.height * 0.06712341, size.width, size.height * 0.1269841);
    path_0.lineTo(size.width, size.height * 0.6825397);
    path_0.cubicTo(
        size.width,
        size.height * 0.8321905,
        size.width,
        size.height * 0.9070198,
        size.width * 0.9693298,
        size.height * 0.9535079);
    path_0.cubicTo(size.width * 0.9386623, size.height, size.width * 0.8892984,
        size.height, size.width * 0.7905759, size.height);
    path_0.lineTo(size.width * 0.2094241, size.height);
    path_0.cubicTo(size.width * 0.1107005, size.height, size.width * 0.06133901,
        size.height, size.width * 0.03066937, size.height * 0.9535079);
    path_0.cubicTo(0, size.height * 0.9070198, 0, size.height * 0.8321905, 0,
        size.height * 0.6825397);
    path_0.lineTo(0, size.height * 0.1269841);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class BasketItem extends StatelessWidget {
  const BasketItem({super.key,required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.secondary,
                    Color.fromARGB(255, 255, 255, 255)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  shape: BoxShape.circle),
              child: Center(
                child: Image.asset(plant.image),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${plant.quantity} piece',
                  style: TextStyle(
                    color: Color(0xFF105D5C),
                    fontSize: 14,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 90,
            height: 42,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              '\$${plant.getTotalPrice()}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
