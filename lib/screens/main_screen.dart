import 'package:flutter/material.dart';
import 'package:interactive_rating_component/components/rating_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isFinished = false;
  int? activeRating;
  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(26, 32, 40, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/ThankYou.png",
                    width: 150,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(35, 41, 47, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "You selected $activeRating out of 5",
                      style: const TextStyle(
                        color: Color.fromRGBO(252, 107, 20, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Thank you!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "We appreciate you taking the time to give a rating. If you ever need more support, don't hesitate to get in touch!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(137, 144, 155, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(30, 36, 44, 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 0),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(30, 36, 44, 1),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 0))
                        ]),
                    child: Image.asset(
                      "assets/images/Star.png",
                      width: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "How did we do?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Please let us know how we did with your support request. All feedback is appreciated to help us improve our offering!",
                    style: TextStyle(
                      color: Color.fromRGBO(133, 140, 150, 1),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [1, 2, 3, 4, 5].map((number) {
                      return RatingButton(number, setActiveRating,
                          isActive: number == activeRating);
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onTapSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(252, 107, 20, 1),
                        foregroundColor: const Color.fromRGBO(20, 21, 24, 1),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text("SUBMIT"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void onTapSubmit() {
    if (activeRating != null) {
      setState(() {
        isFinished = true;
      });
    }
  }

  void setActiveRating(int rating) {
    setState(() {
      activeRating = rating;
    });
  }
}
