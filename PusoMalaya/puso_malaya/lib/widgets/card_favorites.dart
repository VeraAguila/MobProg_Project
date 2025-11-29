import 'package:flutter/material.dart';
import 'package:puso_malaya/model/base_app_movie.dart';
import 'package:puso_malaya/model/base_app_user.dart';
import 'package:puso_malaya/screens/select_item.dart';

class buildCardFavorites extends StatelessWidget {
  // final String imageWidget;
  final BaseAppMovie item;
  final BaseAppUser currentUser;

  const buildCardFavorites({
    // required this.imageWidget,
    required this.item,
    required this.currentUser
  });

  @override
  Widget build(BuildContext context) {
    void openItemModal() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => SelectItem(item: item, currentUser: currentUser,),
      );
    }

     return InkWell(
      onTap: () {
        // openItemModal();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectItem(item: item, currentUser: currentUser,))
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
                item.s3Image!,
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
