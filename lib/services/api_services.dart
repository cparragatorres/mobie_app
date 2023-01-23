import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobie_app/models/movie_models.dart';

class APIService{
  Future<List<MovieModel>> getMovies() async {
    Uri _uri = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=b023410500aafb2c79fe3179a1da5f64");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> myMap = json.decode(response.body);
      List movies = myMap["results"];

      // movies.forEach((element) {
      //   moviesList.add(MovieModel.fromJson(element));
      // });
      // print(moviesList);

      List<MovieModel>moviesList = movies.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
      // print(moviesList);

      // setState(() {}); eliminar setState
      return moviesList;
    }
    return [];
  }
}