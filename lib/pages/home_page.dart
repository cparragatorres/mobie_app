import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobie_app/models/movie_models.dart';
import 'package:mobie_app/ui/widgets/item_filter_widget.dart';
import 'package:mobie_app/ui/widgets/item_movie_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  List<MovieModel> moviesList =[];
  @override
  initState() {
    super.initState();
    getMovies();
  }

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
      
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xff161823),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ItemFilterWidget(textFilter: "All"),
                      ItemFilterWidget(textFilter: "All"),
                      ItemFilterWidget(textFilter: "All"),
                      ItemFilterWidget(textFilter: "All"),
                      ItemFilterWidget(textFilter: "All"),
                      ItemFilterWidget(textFilter: "All"),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                    // itemCount: movies.length,
                    itemCount: moviesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemMovieListWidget(movieModel: moviesList[index],);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
