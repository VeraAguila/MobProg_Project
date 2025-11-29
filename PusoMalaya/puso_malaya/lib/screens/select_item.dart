import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puso_malaya/model/base_app_movie.dart';
import 'package:puso_malaya/model/base_app_review.dart';
import 'package:puso_malaya/screens/add_rating_screen.dart';
import 'package:puso_malaya/screens/ratings_screen.dart';
import 'package:puso_malaya/screens/review_select.dart';
import 'package:puso_malaya/service/review_service.dart';

class SelectItem extends StatefulWidget {
  const SelectItem({super.key, required this.item});

  final BaseAppMovie item;

  @override
  State<StatefulWidget> createState() {
    return _SelectItemState();
  }
}

class _SelectItemState extends State<SelectItem> { 
  bool isFavorite = false;
  var isLoading = false;
  final reviewService = ReviewService();
  List<BaseAppReview> reviewList = [];

  @override
  void initState() {
    super.initState();
    loadReviews();
  }

  void loadReviews() async {
    setState(() {
      isLoading = true;
    });

    var tempReview = await reviewService.getReview(
      context: context,
      userId: widget.item.SK,
    );

    await Future.delayed(Durations.medium1);
    setState(() {
      reviewList = tempReview!;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'name': 'Marga', 'rate': '3.7', 'content': 'asdacsacascasc'},

      {'name': 'leanne', 'rate': '4.3', 'content': 'asdacsacascasc'},
    ];
    void editFavorite() {
      setState(() {
        isFavorite = !isFavorite;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: GoogleFonts.khand(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 5),
                  Image.network(
                    widget.item.s3Image!,
                    height: 180,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                  // SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize:22,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                          
                        ],
                      ),
                      Text(
                           '        ${widget.item.director}',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
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
                          
                        ],
                      ),
                      Text(
                        '        ${widget.item.genres.join(", ")}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      
                      
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15,),
                          Text(
                            ' Casts ',
                            style:
                                Theme.of(
                                  context,
                                ).textTheme.titleSmall!.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                          
                        ],
                      ),
                      Text(
                        '${widget.item.cast.join(", ")}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: editFavorite,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
                      color: isFavorite ? Colors.red : null,
                    ),
                    label: Text('Favorite'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddRatingScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text('Rate'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                widget.item.synopsis,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
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
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => RatingsScreen(),
                  //       ),
                  //     );
                  //   },
                  //   child: Text('See All'),
                  // ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: reviewList.map((item) {
                  return _buildCard(
                    context,
                    name: item.userId,
                    rate: item.rating,
                    content: item.content,
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
      color: Color(0x00FFFFFF).withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewScreen(),
            ),
          );
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
