import 'package:flutter/material.dart';
import 'package:wall_pie/model/wallpaper_model.dart';
import 'package:wall_pie/views/image_view.dart';


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
      crossAxisCount: 3,
      childAspectRatio: 0.6,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
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
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      wallpaper.src.portrait,
                      fit: BoxFit.fill,
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
