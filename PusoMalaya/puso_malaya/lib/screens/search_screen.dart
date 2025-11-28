import 'package:flutter/material.dart';
import 'package:puso_malaya/widgets/card.dart';

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
                  // color: Colors.grey[200],
                  gradient: LinearGradient(
                      colors: [
                        Color(0x00FFFFFF).withOpacity(0.5),
                        Color(0x00FFFFFF).withOpacity(0.5),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Latest',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 8.0,
                    ),
                    // child: Row(
                    //   children: items.map((item) {
                    //     return buildCard(
                    //       item: item,
                    //     );
                    //   }).toList(),
                    // ),
                    child: Text('data'),
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
