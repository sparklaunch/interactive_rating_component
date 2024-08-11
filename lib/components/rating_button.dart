import 'package:flutter/material.dart';

class RatingButton extends StatelessWidget {
  final int rating;
  final bool isActive;
  final void Function(int rating) setActiveRating;
  const RatingButton(this.rating, this.setActiveRating,
      {super.key, required this.isActive});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setActiveRating(rating);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isActive ? Colors.white : const Color.fromRGBO(34, 41, 49, 1),
        foregroundColor:
            isActive ? Colors.black : const Color.fromRGBO(122, 130, 140, 1),
        elevation: 10,
        shape: const CircleBorder(),
      ),
      child: Text(
        rating.toString(),
      ),
    );
  }
}
