import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];

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
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: double.infinity,
                        height: height*0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "http://image.tmdb.org/t/p/w500${movies[index]["poster_path"]}",
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
