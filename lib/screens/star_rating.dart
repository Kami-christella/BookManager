import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final double size;
  final Color color;
  final Function(int)? onRatingChanged;

  StarRating({
    required this.rating,
    this.size = 24,
    this.color = Colors.amber,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: onRatingChanged != null
              ? () => onRatingChanged!(index + 1)
              : null,
          child: Icon(
            index < rating ? Icons.star : Icons.star_border,
            size: size,
            color: color,
          ),
        );
      }),
    );
  }
}