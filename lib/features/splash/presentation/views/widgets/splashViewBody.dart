import 'package:bookapp/features/home/presentation/views/homeView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    NavgateToHome();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, widget) {
              return SlideTransition(
                  position: slidingAnimation,
                  child: Image.asset('assets/images/Logo.png'));
            }),
      ],
    );
  }
    void NavgateToHome() {
    Future.delayed(Duration(seconds: 3),()=>Get.to(HomeView(),transition: Transition.rightToLeft,duration: Duration(seconds: 1)));
  }
  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
