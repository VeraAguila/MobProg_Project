import 'package:flutter/material.dart';
import 'dart:ui';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;

    final List<Map<String, String>> items = [
      {'title': 'Mango', 'imagepath': 'assets/images/movie1.png'},

      {'title': 'Banana', 'imagepath': 'assets/images/movie1.png'},

      {'title': 'Apple', 'imagepath': 'assets/images/movie1.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('PUSO MALAYA'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Edit Profile",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "Morgan",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "@morgan123",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            //Movies You Might Like
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Favorites',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items.map((item) {
                    return _buildCard(
                      context,
                      title: item['title']!,
                      imageWidget: Image.asset(
                        'assets/images/movie1.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(height: 50),
          ],
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
