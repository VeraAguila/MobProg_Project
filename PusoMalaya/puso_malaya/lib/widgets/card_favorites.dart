import 'package:flutter/material.dart';
import 'package:puso_malaya/screens/select_item.dart';

class buildCardFavorites extends StatelessWidget {
  final String imageWidget;

  const buildCardFavorites({
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
          ],
        ),
      ),
    );
  }
}
