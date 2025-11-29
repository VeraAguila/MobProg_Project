import 'package:flutter/material.dart';
import 'package:puso_malaya/model/base_app_movie.dart';
import 'package:puso_malaya/model/base_app_user.dart';
import 'package:puso_malaya/widgets/card.dart';
import 'package:puso_malaya/widgets/card_ranked.dart';
import 'package:puso_malaya/widgets/card_recently.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.inventoryList,
    required this.currentUser,
  });

  final List<BaseAppMovie> inventoryList;
  final BaseAppUser currentUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, ',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    currentUser.username,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  Text(
                    '!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Review film you’ve watched...',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //Movies You Might Like
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Movies You Might Like',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 3),

            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: inventoryList.map((item) {
                      return buildCard(
                        item: item,
                        currentUser: currentUser,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            //Recently Reviewed
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recently Reviewed',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 3),

            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: inventoryList.map((item) {
                      return buildCardRecently(
                        item: item,
                        currentUser: currentUser,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),

            //Ranked Movies
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Ranked Movies',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: inventoryList.map((item) {
                      return buildCardRanked(
                        item: item,
                        currentUser: currentUser,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),
          ],
        ),
      );
  }
}