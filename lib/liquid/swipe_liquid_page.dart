import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SwipeLiquidPage extends StatefulWidget {
  const SwipeLiquidPage({Key? key}) : super(key: key);

  @override
  State<SwipeLiquidPage> createState() => _SwipeLiquidPageState();
}

class _SwipeLiquidPageState extends State<SwipeLiquidPage> {
  final liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: liquidController,
            enableSideReveal: true,
            onPageChangeCallback: (index) {
              setState(() {});
            },
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            pages: [
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Page 1',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Page 2',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.purple,
                child: const Center(
                  child: Text(
                    'Page 3',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Page 4',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    liquidController.jumpToPage(page: 3);
                  },
                  child: const Text(
                    'PULAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: liquidController.currentPage,
                  count: 4,
                  effect: const WormEffect(
                    spacing: 16,
                    dotColor: Colors.white54,
                    activeDotColor: Colors.white,
                  ),
                  onDotClicked: (index) {
                    liquidController.animateToPage(page: index);
                  },
                ),
                TextButton(
                  onPressed: () {
                    final page = liquidController.currentPage + 1;
                    liquidController.animateToPage(
                        page: page > 4 ? 0 : page, duration: 400);
                  },
                  child: const Text(
                    'PROXIMO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
