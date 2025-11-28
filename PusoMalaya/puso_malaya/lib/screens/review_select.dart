import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReviewScreenState();
  }
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'name': 'Marga', 'rate': '3.7', 'content': 'asdacsacascasc'},

      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review',
        ),
        actions: [
          // PopupMenuButton<String>(
          //   icon: Icon(
          //     Icons.filter_list_rounded,
          //     size: 30,
          //   ),
          //   onSelected: (value) {
          //     if (value == 'newest') {
          //       print('Sort by newest');
          //     } else if (value == 'descending') {
          //       print('Sort descending');
          //     }
          //   },
          //   itemBuilder: (context) => [
          //     PopupMenuItem(
          //       value: 'newest',
          //       child: Text('Newest'),
          //     ),
          //     PopupMenuItem(
          //       value: 'descending',
          //       child: Text('Descending'),
          //     ),
          //   ],
          // ),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     TextButton(
              //       onPressed: () {},
              //       child: Icon(
              //         Icons.arrow_back,
              //         size: 40,
              //         color: Colors.black,
              //       ),
              //     ),
              //     SizedBox(width: 20),
              //     Text(
              //       'Reviews',
              //       style: Theme.of(context).textTheme.titleLarge,
              //     ),
              //     Spacer(),
              //     TextButton(
              //       onPressed: () {},
              //       child: Icon(
              //         Icons.filter_list_rounded,
              //         color: Colors.black,
              //         size: 30,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 10),
              Column(
                children: items.map((item) {
                  return _buildCard(
                    context,
                    name: item['name']!,
                    rate: item['rate']!,
                    content: item['content']!,
                  );
                }).toList(),
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
  required String name,
  required String rate,
  required String content,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: 2.0,
      right: 2.0,
    ),
    child: Card(
      elevation: 3,
      color: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Tapped')));
          //penItemModal();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Review by ',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Text(
                    rate,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
