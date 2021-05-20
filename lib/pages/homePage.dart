import 'package:flutter/material.dart';
import 'package:port_folio/utils/text.dart';
import 'package:port_folio/widgets/topRated.dart';
import 'package:port_folio/widgets/trendingMovies.dart';
import 'package:port_folio/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topratedmovies = [];
  List tvshows = [];
  
  final String apiKey = 'e5ef35b8dd4155623b4c1a3d6bcc3dbb';
  final accestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNWVmMzViOGRkNDE1NTYyM2I0YzFhM2Q2YmNjM2RiYiIsInN1YiI6IjYwYTRkNGQzNGIwYzYzMDA1Nzk0NGU0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qQDYplu8zNn-PJnWfaqZ7rKJpn1pkpNRA_Kf_gy6iPg';

  @override
  void initState() {
    loadMovie();
    super.initState();
  }

  loadMovie() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, accestoken));
    logConfig:
    ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    );
    
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tvshows = tvresult['results'];
    });
    print(tvshows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modifiedText(
          text: "Alpha's Movie Center",
          size: 28,
        ),
      ),
      body: ListView(
        children: [
          TV(tvs: tvshows),
          Toprated(toprated: topratedmovies),
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}
