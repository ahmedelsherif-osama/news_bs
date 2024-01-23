import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final double screenWidth;
  final double screenHeight;
  final Function onTap;

  const CategoryCard({
    required this.onTap,
    required this.title,
    required this.icon,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = screenWidth * 0.4;
    final cardHeight = screenHeight * 0.2;

    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(height: 8.0),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
