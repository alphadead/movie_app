import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:port_folio/model/movieModel.dart';

class MovieService extends ChangeNotifier {
  List<Result> _movies = [];
  MovieResponse _movieResponse;
  MovieResponse get movieResponse => _movieResponse;
  List<Result> get movies => _movies;

  set movies(value) {
    _movies = value;
    notifyListeners();
  }

  set movieResponse(value) {
    _movieResponse = value;
    notifyListeners();
  }

  void movieList(String val) async {
    var log = Logger();
    var url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=e5ef35b8dd4155623b4c1a3d6bcc3dbb&language=en-US&query=$val&page=1&include_adult=false');
    var response = await http.get(url);
    final Map<String, dynamic> parsedData = json.decode(response.body);
    MovieResponse movieResponse = MovieResponse.fromJson(parsedData);
    log.d(movieResponse);
    movies = movieResponse.results;
  }
}
