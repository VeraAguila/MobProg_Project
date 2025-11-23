import 'package:flutter/material.dart';
import 'dart:ui';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;

    final List<Map<String, String>> items = [
      {'title': 'Mango', 'imagepath': 'assets/images/movie1.png'},

      {'title': 'Banana', 'imagepath': 'assets/images/movie1.png'},

      {'title': 'Apple', 'imagepath': 'assets/images/movie1.png'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          child: Column(
            children: [
              SizedBox(height: 60),
              Row(
                children: [
                  Text(
                    'Favorites',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list),
                    // /color: Colors.lightGreen,
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

Widget _buildCard(
  BuildContext context, {
  required String title,
  required Widget imageWidget,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: 16.0,
      right: 8.0,
    ),
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Tapped')));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            SizedBox(
              height: 100,
              width: 160,
              child: imageWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
