import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../config/pallette.dart';

//local providers

import 'home_page.dart';

final _pageController = Provider<PageController>((ref) {
  return PageController(initialPage: 0);
});

final _indexProvider = StateProvider((ref) => 0);

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_pageController);
    final pageIndex = ref.watch(_indexProvider);
    final pages = [
      _IntroductionPage(
        key: UniqueKey(),
        image: 'lib\\assets\\images\\pot1.png',
        text1: 'Best collection of\n',
        text2: 'indoor & outdoor ',
        text3: 'plants',
      ),
      _IntroductionPage(
        key: UniqueKey(),
        image: 'lib\\assets\\images\\pot2.png',
        text1: 'Keep your \n plants ',
        text2: 'alive ',
      ),
      _IntroductionPage(
        key: UniqueKey(),
        image: 'lib\\assets\\images\\pot3.png',
        text1: 'Plant a tree &\n green the ',
        text2: 'earth ',
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 71.h,
              child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  onPageChanged: (page) {
                    ref.read(_indexProvider.notifier).state = page;
                  },
                  children: pages),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundColor: pageIndex == index
                                ? AppColors.primary
                                : AppColors.primary.withOpacity(0.30),
                            radius: 3,
                          ),
                        ))),
            Spacer(),
            pageIndex == 2
                ? Padding(
                  padding: const EdgeInsets.only(bottom:25.0),
                  child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Container(
                        width: 90.w,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: AppColors.primary),
                        child: Center(child: Text('Get Started')),
                      ),
                    ),
                )
                : Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            ref.read(_pageController).nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: AppColors.primary),
                            child: Center(child: Text('Next')),
                          ),
                        )
                      ],
                    ),
                ),
           
          ],
        ),
      ),
    );
    
  }
}

class _IntroductionPage extends ConsumerWidget {
  _IntroductionPage({
    super.key,
    required this.text1,
    required this.text2,
    this.text3,
    required this.image,
  });
  final String image, text1, text2;
  final String? text3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
                  
            ),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: text1,
                  style: GoogleFonts.poppins(
                      fontSize: 17.sp, fontWeight: FontWeight.w700)),
              TextSpan(
                  text: text2,
                  style: GoogleFonts.poppins(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary)),
              TextSpan(
                  text: text3,
                  style: GoogleFonts.poppins(
                      fontSize: 17.sp, fontWeight: FontWeight.w700)),
            ]),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectuteur\n adipiscing ellit. Fringlla in sed risus sit.',
            style:
                GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
