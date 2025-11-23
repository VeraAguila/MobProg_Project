import 'package:flutter/material.dart';
import 'dart:ui';

class AddRatingScreen extends StatefulWidget {
  const AddRatingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddRatingScreenState();
  }
}

class _AddRatingScreenState extends State<AddRatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 40),
                  Text(
                    "Mango",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/movie1.png',
                    height: 172,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 40),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 60),
                  Text(
                    "Rate",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  Text(
                    "Add to Favorites",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(width: 60),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 50),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 140,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Your Rating",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite_border_rounded,
                    size: 50,
                  ),
                  SizedBox(width: 90),
                ],
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                //width: 140,
                height: 350,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                    hintText: "Write down your review...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Publish",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
