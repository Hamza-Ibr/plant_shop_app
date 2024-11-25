// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:plant_shop_app/models/plant_model.dart';
import 'package:plant_shop_app/screens/plant_details_screen.dart';
import '../constants.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PlantsHomeScreen extends StatefulWidget {
  const PlantsHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlantsHomeScreenState createState() => _PlantsHomeScreenState();
}

class _PlantsHomeScreenState extends State<PlantsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: HeaderSection(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            MasonryGridView(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              children: [
                const Text(
                  "Found \n10 Results",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32, height: 1.1),
                ),
                for (var plant in plants)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PlantDetailsScreen(
                                    plant: plant,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22)),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Hero(
                                  tag: plant.name,
                                  child: Image.asset(plant.image))),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            plant.name,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1),
                          ),
                          plant.category != null
                              ? Text(
                                  plant.category!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                )
                              : const SizedBox(
                                  height: 20,
                                ),
                          Row(
                            children: [
                              Text(
                                "\$${plant.price}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -1),
                              ),
                              const Spacer(),
                              const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  AppBar HeaderSection() {
    return AppBar(
      backgroundColor: myBackgroundColor,
      leading: const Icon(
        Icons.arrow_back_ios_new_rounded,
      ),
      centerTitle: true,
      title: const Text(
        "Search Products",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset("assets/person.png"))
      ],
    );
  }

  Padding SearchSection() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Row(
        children: [
          const Expanded(
              flex: 6,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: "Plant",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none)),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(15),
                  child: const Icon(Icons.tune))),
        ],
      ),
    );
  }
}
