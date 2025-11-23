import 'package:flutter/material.dart';

class SelectItem extends StatefulWidget {
  const SelectItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectItemState();
  }
}

class _SelectItemState extends State<SelectItem> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'name': 'Marga', 'rate': '3.7', 'content': 'asdacsacascasc'},

      {'name': 'leanne', 'rate': '4.3', 'content': 'asdacsacascasc'},
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/movie1.png',
                  height: 172,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mango',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.movie),
                          Text(
                            ' Directed by ',
                            style:
                                Theme.of(
                                  context,
                                ).textTheme.titleSmall!.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                          Text(
                            'Alfonso Cuaron',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.movie),
                          Text(
                            ' Genre ',
                            style:
                                Theme.of(
                                  context,
                                ).textTheme.titleSmall!.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                          Text(
                            'Fiction',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.timer),
                          Text(
                            ' 2 hr 21 min',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                            label: Text('Favorite'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            label: Text('Rate'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'asdasdasdasd',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Reviews',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('See All'),
                ),
              ],
            ),
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
