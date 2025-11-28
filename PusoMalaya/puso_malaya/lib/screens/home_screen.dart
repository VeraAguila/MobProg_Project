import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puso_malaya/model/base_app_movie.dart';
import 'package:puso_malaya/screens/movie_list.dart';
import 'package:puso_malaya/service/movie_service.dart';
import 'package:puso_malaya/widgets/card.dart';
import 'package:puso_malaya/widgets/card_ranked.dart';
import 'package:puso_malaya/widgets/card_recently.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  final movieService = MovieService();
  List<BaseAppMovie> movieList = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    setState(() {
      isLoading = true;
    });

    var tempMovie = await movieService.viewMovies(
      context: context,
    );

    await Future.delayed(Durations.medium1);
    setState(() {
      movieList = tempMovie!;
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
    ];

    Widget mainContent = Center(
      child: Text('No movies found'),
    );

    if (isLoading) {
      mainContent = Center(
        child: CircularProgressIndicator(),
      );
    } else if (movieList.isNotEmpty) {
      mainContent = MovieList(
        inventoryList: movieList,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PUSO MALAYA',
          style: GoogleFonts.khand(),
        ),
      ),
      body: mainContent,
    );
  }
}
