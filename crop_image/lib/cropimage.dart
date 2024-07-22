import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CropImage extends StatefulWidget {
  const CropImage({Key? key}) : super(key: key);

  @override
  State<CropImage> createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        enableRotation: true,
        imageProvider: AssetImage("assets/astron.jpg"),
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
