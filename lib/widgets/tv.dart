import 'package:flutter/material.dart';
import 'package:port_folio/description.dart';
import 'package:port_folio/utils/text.dart';

class TV extends StatelessWidget {
  final List tvs;

  const TV({Key key, this.tvs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifiedText(
              text: "Popular Tv Shows",
              size: 26,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 200.0,
                child: ListView.builder(
                  itemCount: tvs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: tvs[index]['original_name'],
                                      bannerURL:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tvs[index]['backdrop_path'],
                                      posterURL:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tvs[index]['poster_path'],
                                      description: tvs[index]['overview'],
                                      vote:
                                          tvs[index]['vote_average'].toString(),
                                      launchon: tvs[index]['first_air_date'],
                                    )));
                      },
                      child: tvs[index]['original_name'] != null
                          ? Container(
                              padding: EdgeInsets.all(5),
                              width: 250,
                              child: Column(
                                children: [
                                  Container(
                                    width: 250,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  tvs[index]['backdrop_path']),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: ModifiedText(
                                      text: tvs[index]['original_name'] != null
                                          ? tvs[index]['original_name']
                                          : 'Loading',
                                      color: Colors.white,
                                      size: 20,
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
