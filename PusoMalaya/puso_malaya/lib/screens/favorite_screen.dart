import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puso_malaya/screens/select_item.dart';

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
      {
        'title': 'Mangoasdfafdsfadsfdasdfs',
        'imagepath': 'assets/images/movie1.png',
        'date': 'Jul 24, 2024',
        'rate': '4.7',
      },

      {
        'title': 'Banana',
        'imagepath': 'assets/images/movie1.png',
        'date': 'Jun 20, 2024',
        'rate': '3.7',
      },

      {
        'title': 'Apple',
        'imagepath': 'assets/images/movie1.png',
        'date': 'Jun 26, 2024',
        'rate': '4.5',
      },

      {
        'title': 'Mangoasdfafdsfadsfdasdfs',
        'imagepath': 'assets/images/movie1.png',
        'date': 'Jul 24, 2024',
        'rate': '4.7',
      },

      {
        'title': 'Banana',
        'imagepath': 'assets/images/movie1.png',
        'date': 'Jun 20, 2024',
        'rate': '3.7',
      },

      {
        'title': 'Apple',
        'imagepath': 'assets/images/movie1.png',
        'date': 'Jun 26, 2024',
        'rate': '4.5',
      },
    ];

    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(
    //         horizontal: 10.0,
    //         vertical: 15.0,
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(height: 60),
    //           Row(
    //             children: [
    //               Text(
    //                 'Favorites',
    //                 style: Theme.of(context).textTheme.titleLarge,
    //               ),
    //               Spacer(),
    //               IconButton(
    //                 onPressed: () {},
    //                 icon: Icon(Icons.filter_list),
    //                 // /color: Colors.lightGreen,
    //               ),
    //             ],
    //           ),

    //           SizedBox(height: 5),

    //           SizedBox(
    //             height: 400,
    //             child: GridView.count(
    //               crossAxisCount: 4,
    //               crossAxisSpacing: 5,
    //               mainAxisSpacing: 5,
    //               padding: EdgeInsets.all(10),
    //               children: items.map((item) {
    //                   return buildCard(
    //                     title: item['title']!,
    //                     imageWidget: item['imagepath']!,
    //                   );
    //                 }).toList(),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(appBar: AppBar(
        title: Text(
          'Favorites',
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.filter_list_rounded,
              size: 30,
            ),
            onSelected: (value) {
              if (value == 'newest') {
                print('Sort by newest');
              } else if (value == 'descending') {
                print('Sort descending');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'newest',
                child: Text('Newest'),
              ),
              PopupMenuItem(
                value: 'descending',
                child: Text('Descending'),
              ),
            ],
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                //height: 400,
                width: 400,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  //crossAxisSpacing: 5,
                  //mainAxisSpacing: 5,
                  padding: EdgeInsets.all(10),
                  children: items.map((item) {
                    return _buildCard(
                      context,
                      title: item['title']!,
                      imageWidget: item['imagepath']!,
                    );
                  }).toList(),
                ),
              ),

              // SizedBox(height: 5),

              // SizedBox(
              //   height: 400,
              //   child: GridView.count(
              //     crossAxisCount: 4,
              //     crossAxisSpacing: 5,
              //     mainAxisSpacing: 5,
              //     padding: EdgeInsets.all(10),
              //     children: items.map((item) {
              //         return buildCard(
              //           title: item['title']!,
              //           imageWidget: item['imagepath']!,
              //         );
              //       }).toList(),
              //   ),
              // ),
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
  required String imageWidget,
}) {
  void openItemModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SelectItem(),
    );
  }

  return InkWell(
    onTap: () {
      // openItemModal();
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectItem())
        );
    },
    child: Container(
      width: 150,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(
              imageWidget,
              height: 95,
              width: 65,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
