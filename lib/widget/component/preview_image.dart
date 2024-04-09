import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PreviewImage extends StatelessWidget {
  final dynamic imageLink;
  const PreviewImage({
    Key? key,
    required this.imageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview Gambar"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Center(
        child: PhotoViewGallery.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageLink.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                imageLink[index].toString()
              ),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.contained * 4,
            );
          }
        ),
      ),
    );
  }
}