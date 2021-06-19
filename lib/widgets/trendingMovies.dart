import 'package:flutter/material.dart';
import 'package:port_folio/description.dart';
import 'package:port_folio/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifiedText(
              text: "Trending Movies",
              size: 26,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 270.0,
                child: ListView.builder(
                  itemCount: trending.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: trending[index]['title'],
                                      bannerURL:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      posterURL:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      description: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launchon: trending[index]['release_date'],
                                    )));
                      },
                      child: trending[index]['title'] != null
                          ? Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending[index]
                                                      ['poster_path'])),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ModifiedText(
                                        text: trending[index]['title'] != null
                                            ? trending[index]['title']
                                            : 'Loading',
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
