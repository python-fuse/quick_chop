import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final double rating;
  final String imagePath;

  const FoodTile({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Column(
            children: [
              Text(name,
                  style: GoogleFonts.cinzel(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(imagePath),
        ],
      ),
    );
  }
}
