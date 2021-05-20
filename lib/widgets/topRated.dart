import 'package:flutter/material.dart';
import 'package:port_folio/description.dart';
import 'package:port_folio/utils/text.dart';

class Toprated extends StatelessWidget {
  final List toprated;

  const Toprated({Key key, this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modifiedText(
              text: "Top Rated Movies",
              size: 26,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 270.0,
                child: ListView.builder(
                  itemCount: toprated.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: toprated[index]['title'],
                                      bannerURL:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['backdrop_path'],
                                      posterURL:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                      description: toprated[index]['overview'],
                                      vote: toprated[index]['vote_average']
                                          .toString(),
                                      launchon: toprated[index]['release_date'],
                                    )));
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path'])),
                              ),
                            ),
                            Container(
                              child: modifiedText(
                                text: (toprated[index]['title'] != null)
                                    ? toprated[index]['title']
                                    : 'Loading',
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
