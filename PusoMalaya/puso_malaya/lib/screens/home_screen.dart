import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:puso_malaya/screens/select_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  

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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, Vera!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Review film you’ve watched...',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

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
                    'Movies You Might Like',
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

            //Recently Reviewed
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recently Reviewed',
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
                    return _buildCardRecently(
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

            //Ranked Movies
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Ranked Movies',
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
                    return _buildCardRanked(
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
  void openItemModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SelectItem(),
    );
  }
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
          openItemModal();
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

Widget _buildCardRecently(
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

Widget _buildCardRanked(
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
