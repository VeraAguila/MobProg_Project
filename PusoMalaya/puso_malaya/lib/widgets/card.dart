import 'package:flutter/material.dart';
import 'package:puso_malaya/screens/select_item.dart';

class buildCard extends StatelessWidget {
  final String title;
  final String imageWidget;

  const buildCard({
    required this.title,
    required this.imageWidget,
  });

  @override
  Widget build(BuildContext context) {
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
              child: Image.network(
                imageWidget,
                height: 200,
                width: 150,
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
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
