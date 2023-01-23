import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobie_app/models/genre_models.dart';
import 'package:mobie_app/models/movie_models.dart';
import 'package:mobie_app/utils/constants.dart';

class APIService{
  Future<List<MovieModel>> getMovies() async {
    Uri _uri = Uri.parse(
        "$pathProduction/discover/movie?api_key=$apiKey");
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

  getGenres()async{
    String path ="$pathProduction/genre/movie/list?api_key=$apiKey&language=es-ES";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String,dynamic> myMap = json.decode(response.body);
      List genres = myMap["genres"];
      List<GenreModel> genreModeList = genres.map((e) => GenreModel.fromJson(e)).toList();
      return genreModeList;
    }
    return [];
  }
}