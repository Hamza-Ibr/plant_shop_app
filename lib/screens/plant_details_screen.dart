// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:plant_shop_app/constants.dart';
import 'package:plant_shop_app/models/plant_model.dart';

class PlantDetailsScreen extends StatefulWidget {
  final Plant plant;
  const PlantDetailsScreen({super.key, required this.plant});

  @override
  // ignore: library_private_types_in_public_api
  _PlantDetailsScreenState createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  int curPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 330,
                  child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      onPageChanged: (val) => setState(() => curPage = val),
                      itemCount: 3,
                      itemBuilder: (context, index) => Hero(
                          tag: widget.plant.name,
                          child: Image.asset(widget.plant.image))),
                ),
                Positioned(
                    bottom: 15,
                    right: 100,
                    child: Column(
                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 7,
                          height: curPage == index ? 20 : 7,
                          decoration: BoxDecoration(
                              color:
                                  curPage == index ? primaryColor : Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                        );
                      }),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.plant.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Plants make your life with minimal and happy Love the plants more and enjoy life.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                    letterSpacing: -.5),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 270,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: primaryColor),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlantInfo(Icons.height, "Height", widget.plant.height),
                PlantInfo(Icons.device_thermostat, "Temparature",
                    widget.plant.temparature),
                PlantInfo(Icons.yard_outlined, "Pot", widget.plant.pot),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -1),
                    ),
                    Text(
                      "\$${widget.plant.price}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1,
                          letterSpacing: -1),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  decoration: BoxDecoration(
                      color: cartButtonColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Column PlantInfo(icon, name, value) {
    return Column(
      children: [
        Icon(
          icon,
          size: 45,
          color: Colors.white,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade200),
        ),
      ],
    );
  }
}
