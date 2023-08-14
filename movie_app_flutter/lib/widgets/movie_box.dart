import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/movie_detail.dart';

class MovieBox extends StatelessWidget {
  final String url;
  const MovieBox({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => MovieDetail(url: url),
          ),
        ),
      },
      child: SizedBox(
        child: Card(
          child: Image(
            image: CachedNetworkImageProvider(url),
          ),
        ),
      ),
    );
  }
}
