import 'dart:async';

import 'package:bloc_app/views/counter_screen.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 1.5, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    _slideAnimation = Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
    ));

    _controller.forward();
    Timer(Duration(seconds: 3), () {
     Navigator.push(context, PageTransition(
      duration:const Duration(seconds:1),
      type: PageTransitionType.fade, child: CounterScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset('assets/logo.png',
              height: 100,),
            ),
            
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  'Birds View',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

 