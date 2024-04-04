import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/models/food_model.dart';
import 'package:quick_chop/services/user_service.dart';
import 'package:quick_chop/utils/popular_food.dart';

// ignore: must_be_immutable
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserService>(context, listen: false).getCurrentUser();
  }

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
    Food(
        name: 'Burger',
        description: 'Spicy and delicious',
        price: 'N500',
        rating: 4.5,
        imagePath: 'lib/assets/indomie_egg.jpeg',
        category: FoodCategory.snack,
        availableAddons: []),
    Food(
        name: 'Burger',
        description: 'Spicy and delicious',
        price: 'N500',
        rating: 4.5,
        imagePath: 'lib/assets/indomie_egg.jpeg',
        category: FoodCategory.snack,
        availableAddons: []),
    Food(
        name: 'Burger',
        description: 'Spicy and delicious',
        price: 'N500',
        rating: 4.5,
        imagePath: 'lib/assets/indomie_egg.jpeg',
        category: FoodCategory.snack,
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
    final userData = Provider.of<UserService>(context).currentUserData;
    final fullName = userData['fullName'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink.shade100.withOpacity(0.3),
        title: Text(
          'Welcome, ${fullName != null ? fullName.split(' ')[0] : ''}',
          style: GoogleFonts.poppins(fontSize: 28),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      body: Stack(
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
                  Colors.pink.shade50.withOpacity(0.1),
                ],
              ),
            ),
          ),
          Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Ready to order your favourite food?',
                      style: GoogleFonts.poppins(fontSize: 32),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(1),
                          hintText: 'Search for food',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.background,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  // add a listview of filtered food categories here [beakfast, lunch, snacks, drinks]

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
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
                  ),

                  SizedBox(
                    height: 190,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
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

                  const Text(
                    'All Available Food',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
