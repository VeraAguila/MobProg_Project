import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:puso_malaya/screens/select_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
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
            horizontal: 20,
            vertical: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Latest',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
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

