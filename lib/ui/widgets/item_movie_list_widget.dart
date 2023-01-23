import 'package:flutter/material.dart';
import 'package:mobie_app/models/movie_models.dart';

class ItemMovieListWidget extends StatelessWidget {
  MovieModel movieModel;
  ItemMovieListWidget({
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

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
              "http://image.tmdb.org/t/p/w500${movieModel.posterPath}",
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
                      // movies[index]["original_title"],
                      movieModel.originalTitle,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      // movies[index]["overview"],
                      movieModel.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              // movies[index]["release_date"],
                              movieModel.releaseDate.toString().substring(0,10),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up_alt,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                              // movies[index]["vote_count"].toString(),
                              movieModel.voteCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(14.0),
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  // movies[index]["vote_average"].toString(),
                  movieModel.voteAverage.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
