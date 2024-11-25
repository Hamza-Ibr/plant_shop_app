// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/onbording_model.dart';
import 'plants_home_screen.dart.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: HeaderSection(context),
      body: MainSection(context),
    );
  }

  SingleChildScrollView MainSection(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 630,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) => setState(() {
                currentIndex = value;
              }),
              itemCount: pOnBording.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      height: 380,
                      pOnBording[index].image,
                      fit: BoxFit.fitHeight,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pOnBording.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 4),
                          width: index == currentIndex ? 18 : 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == currentIndex
                                ? primaryColor
                                : Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: pOnBording[index].title,
                              style: const TextStyle(
                                fontSize: 45,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const TextSpan(
                              text: " Plants",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 45,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: InkWell(
              onTap: () async {
                if (currentIndex == (pOnBording.length - 1)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PlantsHomeScreen(),
                    ),
                  );
                } else {
                  await controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: const CircleAvatar(
                backgroundColor: primaryColor,
                radius: 40,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar HeaderSection(BuildContext context) {
    return AppBar(
      backgroundColor: myBackgroundColor,
      actions: [
        if (currentIndex < pOnBording.length - 1)
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const PlantsHomeScreen(),
                ),
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
      ],
    );
  }
}
