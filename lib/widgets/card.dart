import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category, total;
  final bool isInverted;

  const CategoryCard({
    super.key,
    required this.category,
    required this.total,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.cyan.shade500 : Colors.amber.shade600,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  total,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Transform.scale(
              scale: 3.5,
              child: Transform.translate(
                offset: const Offset(-5, 7),
                child: Icon(
                  Icons.menu_book_rounded,
                  color:
                      isInverted ? Colors.cyan.shade200 : Colors.amber.shade200,
                  size: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
