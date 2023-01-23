import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService{
  getMovies() async {
    Uri _uri = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=b023410500aafb2c79fe3179a1da5f64");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> myMap = json.decode(response.body);
      movies = myMap["results"];

      // movies.forEach((element) {
      //   moviesList.add(MovieModel.fromJson(element));
      // });
      // print(moviesList);

      moviesList = movies.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
      // print(moviesList);

      // setState(() {}); eliminar setState
    }
  }
}