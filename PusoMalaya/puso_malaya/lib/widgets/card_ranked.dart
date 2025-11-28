import 'package:flutter/material.dart';
import 'package:puso_malaya/screens/select_item.dart';

class buildCardRanked extends StatelessWidget {
  final String title;
  final String imageWidget;
  final String rate;

  const buildCardRanked({
    required this.title,
    required this.imageWidget,
    required this.rate,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 3),
                  Text(
                    rate,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
