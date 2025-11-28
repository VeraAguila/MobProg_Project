import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puso_malaya/model/base_app_favorites.dart';
import 'package:puso_malaya/screens/favorite_list.dart';
import 'package:puso_malaya/screens/select_item.dart';
import 'package:puso_malaya/service/favorite_service.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var isLoading = false;
  final favoriteService = FavoriteService();
  List<BaseAppFavorite> favoriteList = [];
  var userId = 'U#37893c14-7d9b-404d-95db-fcc24dbb657d';

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    setState(() {
      isLoading = true;
    });

    var tempMovie = await favoriteService.viewFavorites(
      context: context,
      userId: userId,
    );

    await Future.delayed(Durations.medium1);
    setState(() {
      favoriteList = tempMovie!;
      isLoading = false;
    });
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
    
    Widget mainContent = Center(
      child: Text('No favorites found'),
    );

    if (isLoading) {
      mainContent = Center(
        child: CircularProgressIndicator(),
      );
    } else if (favoriteList.isNotEmpty) {
      mainContent = FavoriteList(
        favoriteList  : favoriteList,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.filter_list_rounded,
              size: 30,
            ),
            onSelected: (value) {
              if (value == 'newest') {
                print('Sort by newest');
              } else if (value == 'descending') {
                print('Sort descending');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'newest',
                child: Text('Newest'),
              ),
              PopupMenuItem(
                value: 'descending',
                child: Text('Descending'),
              ),
            ],
          ),
          SizedBox(width: 15),
        ],
      ),
      body: mainContent
    );
  }
}

