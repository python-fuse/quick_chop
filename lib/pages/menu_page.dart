import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_chop/models/food_model.dart';
import 'package:quick_chop/utils/category_tile.dart';
import 'package:quick_chop/utils/food_tile.dart';
import 'package:quick_chop/utils/popular_food.dart';

// ignore: must_be_immutable
class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  List<Food> popularfoods = [
    Food(
        name: 'Jollof Rice',
        description: 'Spicy and delicious',
        price: 'N500',
        rating: 5.0,
        imagePath: 'lib/assets/chips_eggs.jpeg',
        category: FoodCategory.lunch,
        availableAddons: []),
    Food(
        name: 'Fried Rice',
        description: 'Spicy and delicious',
        price: 'N500',
        rating: 5.0,
        imagePath: 'lib/assets/indomie_cooked.jpeg',
        category: FoodCategory.lunch,
        availableAddons: []),
    Food(
        name: 'Pancakes',
        description: 'Spicy and delicious',
        price: 'N500',
        rating: 4.0,
        imagePath: 'lib/assets/chips_eggs.jpeg',
        category: FoodCategory.breakfast,
        availableAddons: []),
    Food(
        name: 'Burger',
        description: 'Spicy and delicious',
        price: 'N500',
        rating: 4.5,
        imagePath: 'lib/assets/indomie_egg.jpeg',
        category: FoodCategory.snack,
        availableAddons: []),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.pink.shade100.withOpacity(0.3),
                    Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade100,
                        child: const Icon(
                          Icons.person,
                          size: 32,
                          color: Colors.pink,
                        ),
                      ),
                      Text(
                        'Welcome, User',
                        style: GoogleFonts.poppins(fontSize: 24),
                      ),
                      IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: Theme.of(context).colorScheme.primary,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ready to order your favourite food?',
                    style: GoogleFonts.poppins(fontSize: 32),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for food',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // add a listview of filtered food categories here [beakfast, lunch, snacks, drinks]
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const CategoryTile(categoryName: 'Breakfast');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Food',
                        style: TextStyle(fontSize: 24),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View all'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 190,
                    child: ListView.builder(
                      itemCount: popularfoods.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return PopularFood(
                          name: popularfoods[index].name,
                          description: popularfoods[index].description,
                          price: popularfoods[index].price,
                          rating: popularfoods[index].rating,
                          imagePath: popularfoods[index].imagePath,
                        );
                      },
                    ),
                  ),
                  // list of all available foods using the FoodTile widget

                  const SizedBox(
                    height: 20,
                  ),

                  // list of all available foods using the FoodTile widget
                  Expanded(
                      child: ListView.separated(
                    itemBuilder: (context, index) {
                      return FoodTile(
                        name: popularfoods[index].name,
                        description: popularfoods[index].description,
                        price: popularfoods[index].price,
                        rating: popularfoods[index].rating,
                        imagePath: popularfoods[index].imagePath,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.pink[600],
                        thickness: 2,
                      );
                    },
                    itemCount: popularfoods.length,
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
