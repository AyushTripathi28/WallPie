import 'package:flutter/material.dart';
import 'package:wallpie/model/wallpaper_model.dart';
import 'package:wallpie/views/image_view.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(),
      children: <TextSpan>[
        TextSpan(
          text: 'wall',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(
          text: 'Pie',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 40,
            fontWeight: FontWeight.w900,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map(
        (wallpaper) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgUrl: wallpaper.src.portrait,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: wallpaper.src.portrait,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      wallpaper.src.portrait,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    ),
  );
}
