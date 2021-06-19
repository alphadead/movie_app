import 'package:flutter/material.dart';
import 'package:port_folio/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerURL, posterURL, vote, launchon, genre;

  const Description(
      {Key key,
      this.name,
      this.description,
      this.bannerURL,
      this.posterURL,
      this.vote,
      this.launchon,
      this.genre})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          child: ListView(
            children: [
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          bannerURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        child: ModifiedText(
                          text: "  Average Rating - " + vote,
                          size: 20,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ModifiedText(
                  text: name != null ? name : 'Not Loaded',
                  size: 28,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: ModifiedText(
                  text: 'Releasing on - ' + launchon,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 200,
                      width: 100,
                      child: Image.network(posterURL),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Container(
                        child: ModifiedText(
                          text: description,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
