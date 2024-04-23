import 'package:flutter/material.dart';
import 'package:whatsapp/files/core/colors.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({
    super.key, required this.child,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => widget.child!,
          ),
          (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/128/1384/1384023.png',
            height: 70,
            width: 70,
            color: kWhite,
          ),
        ),
        Positioned(
          bottom: 50,
          left: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'from',
                style: TextStyle(color: kGrey),
              ),
              Row(
                children: [
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/128/15071/15071740.png',
                    width: 25,
                    height: 25,
                    color: kWhite,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Meta',
                    style: TextStyle(fontSize: 18, color: kWhite),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
