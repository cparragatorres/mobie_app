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
      backgroundColor: Color(0xff161823),
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
                      return ClipRRect(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                          width: double.infinity,
                          height: height*0.7,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 12.0,
                                offset: const Offset(4, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(24.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "http://image.tmdb.org/t/p/w500${movies[index]["poster_path"]}",
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.9),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(22.0),
                                      bottomRight: Radius.circular(22.0),
                                    )
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        movies[index]["original_title"],
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        movies[index]["overview"],
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
