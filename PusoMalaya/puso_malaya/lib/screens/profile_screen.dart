import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puso_malaya/model/base_app_user.dart';
import 'package:puso_malaya/screens/review_select.dart';
import 'package:puso_malaya/widgets/card_favorites.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    //required this.currentUser,
    required this.logout,
  });

  final void Function() logout;
  //final BaseAppUser currentUser;

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> proceedLogout() async {
    await Future.delayed(Durations.medium1);
    widget.logout();
  }

  void toLogout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Logout confirmation',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              proceedLogout();
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

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
    ];

    final List<Map<String, String>> users = [
      {'name': 'Marga', 'rate': '3.7', 'content': 'asdacsacascasc'},

      {'name': 'leanne', 'rate': '4.3', 'content': 'asdacsacascasc'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PUSO MALAYA',
          style: GoogleFonts.khand(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              toLogout();
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Color(0x00FFFFFF).withOpacity(0.5),
                        Color(0x00FFFFFF).withOpacity(0.2),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Edit Profile",
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "Morgan",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "@morgan123",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        width: 180,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Color(0x00FFFFFF).withOpacity(0.5),
                              Color(0x00FFFFFF).withOpacity(0.2),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.movie,
                                  size: 15,
                                ),
                                Text(
                                  "  Movies Reviewed",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "5",
                                  style:
                                      Theme.of(
                                        context,
                                      ).textTheme.titleLarge!.copyWith(
                                        fontSize: 18,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        width: 180,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Color(0x00FFFFFF).withOpacity(0.5),
                              Color(0x00FFFFFF).withOpacity(0.2),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.av_timer,
                                  size: 15,
                                ),
                                Text(
                                  "  Time Spent",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Morgan",
                                  style:
                                      Theme.of(
                                        context,
                                      ).textTheme.titleLarge!.copyWith(
                                        fontSize: 18,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                //Favorites
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Favorites',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all >>',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: items.map((item) {
                        return buildCardFavorites(
                          imageWidget: item['imagepath']!,
                        );
                      }).toList(),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Reviews',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(),
                    ),
                  ],
                ),

                Column(
                  children: items.map((item) {
                    return _buildCardReview(
                      context,
                      title: item['title']!,
                      imagepath: item['imagepath']!,
                      rate: item['rate']!,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCardReview(
  BuildContext context, {
  required String title,
  required String imagepath,
  required String rate,
}) {
  return Card(
    elevation: 3,
    color: Color(0x00FFFFFF).withOpacity(0.2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () {
        // ScaffoldMessenger.of(
        //   context,
        // ).showSnackBar(SnackBar(content: Text('Tapped')));
        // //penItemModal();
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
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Review by ',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Morgan',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      rate,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'dsa',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset(
                    imagepath,
                    height: 110,
                    width: 70,
                    fit: BoxFit.cover,
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
