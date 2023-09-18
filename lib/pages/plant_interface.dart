import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:plant_shop_app/config/pallette.dart';
import 'package:plant_shop_app/models/plant.dart';
import 'package:plant_shop_app/models/widgets/menu_plant.dart';
import 'package:plant_shop_app/pages/home_page.dart';
import 'package:sizer/sizer.dart';

class PlantInterface extends ConsumerWidget {
  const PlantInterface({super.key, required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> words = plant.description.split(" ");
    String firstTwoWords = words.sublist(0, 2).join(" ");
    String lastWord = words.length==3? words[2]:"";
    return Scaffold(
      body: Container(
        width: 100.w,
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                        child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$firstTwoWords\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: lastWord,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    )),
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
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 17.h,
                    child: Text(
                      'Plants',
                      style: TextStyle(
                        color: Color(0x3343F1A5),
                        fontSize: 135,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  GradientCircle(),
                  Hero(
                      tag: '${plant.description}',
                      child: Image.asset(
                        plant.image,
                        height: 45.h,
                      ))
                ],
              ),
              Text(
                'Perfect for beginners or anyone looking\nfor an easy-to-care-for plant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8B8B8B),
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w400,
                ),
              ),
              QuantityWidget(
                plant: plant,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: AddToCart(
                  plant: plant,
                  fromPlantInterface: true,
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCircle extends StatelessWidget {
  const GradientCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.secondary, Color.fromARGB(255, 255, 255, 255)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}

final _counterProvider = StateProvider.autoDispose<int>((ref) {
  return 1;
});

class QuantityWidget extends ConsumerWidget {
  QuantityWidget({super.key, required this.plant});
  Plant plant;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _counter = ref.watch(_counterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (_counter > 1) {
              ref.read(_counterProvider.notifier).state--;
              plant.quantity--;
            }
          },
          child: QuantityButton(
            text: '-',
          ),
        ),
        Spacer(),
        Text(
          NumberFormat('00').format(_counter),
          style: TextStyle(
            color: Colors.black,
            fontSize: 85,
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            ref.read(_counterProvider.notifier).state++;
            plant.quantity++;
          },
          child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(-1, 1, 1),
              child: QuantityButton(
                text: '+',
              )),
        ),
      ],
    );
  }
}

class QuantityButton extends StatelessWidget {
  const QuantityButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ButtonClipper(),
      child: Container(
        width: 96,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xffDCEBFE),
              Color(0xffDCEBFE),
              Color(0xffDCEBFE).withOpacity(0),
            ],
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 70, color: Colors.black),
        )),
      ),
    );
  }
}

class ButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4890458, size.height * 0.2522836);
    path_0.cubicTo(size.width * 0.3652365, size.height * 0.2164518,
        size.width * 0.09409490, size.height * 0.1158309, 0, 0);
    path_0.lineTo(0, size.height * 0.9959727);
    path_0.cubicTo(
        size.width * 0.02682531,
        size.height * 0.9572136,
        size.width * 0.1621896,
        size.height * 0.8494273,
        size.width * 0.4890458,
        size.height * 0.7283318);
    path_0.cubicTo(
        size.width * 0.5179344,
        size.height * 0.7166318,
        size.width * 0.6326646,
        size.height * 0.6769955,
        size.width * 0.8604729,
        size.height * 0.6120636);
    path_0.cubicTo(
        size.width * 1.005505,
        size.height * 0.5545136,
        size.width * 1.016028,
        size.height * 0.4979864,
        size.width * 0.9869990,
        size.height * 0.4441495);
    path_0.cubicTo(
        size.width * 0.9623240,
        size.height * 0.3983886,
        size.width * 0.8951396,
        size.height * 0.3505645,
        size.width * 0.4890458,
        size.height * 0.2522836);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
