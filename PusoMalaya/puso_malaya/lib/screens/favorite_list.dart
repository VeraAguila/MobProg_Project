import 'package:flutter/material.dart';
import 'package:puso_malaya/model/base_app_favorites.dart';
import 'package:puso_malaya/model/base_app_movie.dart';
import 'package:puso_malaya/screens/select_item.dart';
import 'package:puso_malaya/widgets/card.dart';
import 'package:puso_malaya/widgets/card_ranked.dart';
import 'package:puso_malaya/widgets/card_recently.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
    required this.favoriteList,
  });

  final List<BaseAppFavorite> favoriteList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  children: favoriteList.map((item) {
                    return _buildCard(
                      context,
                      title: item.movieId,
                      imageWidget: item.movieId,
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
      );
  }
}

Widget _buildCard(
  BuildContext context, {
  required String title,
  required String imageWidget,
}) {
  // void openItemModal() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (ctx) => SelectItem(),
  //   );
  // }

  return InkWell(
    onTap: () {
      // openItemModal();
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => SelectItem())
      //   );
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
