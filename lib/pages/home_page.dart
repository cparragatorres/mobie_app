

import 'package:flutter/material.dart';
import 'package:mobie_app/models/movie_models.dart';
import 'package:mobie_app/services/api_services.dart';
import 'package:mobie_app/ui/widgets/item_filter_widget.dart';
import 'package:mobie_app/ui/widgets/item_movie_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  List<MovieModel> moviesList =[];
  final APIService _apiService = APIService();
  @override
  initState() {
    super.initState();
    // getMovies();
    getData();
  }

  getData()async{
    // _apiService.getMovies().then((value){
    //   moviesList = value;
    //   setState(() {
    //
    //   });
    // });

    moviesList = await _apiService.getMovies();
    setState(() {

    });
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
                      ItemFilterWidget(textFilter: "All",isSelected: true),
                      ItemFilterWidget(textFilter: "All",isSelected: false),
                      ItemFilterWidget(textFilter: "All",isSelected: false),
                      ItemFilterWidget(textFilter: "All",isSelected: false),
                      ItemFilterWidget(textFilter: "All",isSelected: false),
                      ItemFilterWidget(textFilter: "All",isSelected: false),
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
