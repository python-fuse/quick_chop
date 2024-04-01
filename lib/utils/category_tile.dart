import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  const CategoryTile({super.key, required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 110,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CircleAvatar(
          radius: 18,
          child: Image.asset('lib/assets/drinks.jpg'),
        ),
        Text(categoryName)
      ]),
    );
  }
}
