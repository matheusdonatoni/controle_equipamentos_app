import 'package:cached_network_image/cached_network_image.dart';
import 'package:controle_equipamentos/app/data/models/picture.dart';
import 'package:flutter/material.dart';

class PictureView extends StatelessWidget {
  final Picture picture;

  const PictureView(
    this.picture, {
    Key key,
  })  : assert(picture != null),
        super(key: key);

  Widget get child {
    ImageProvider imageProvider;

    if (picture.hasUrl) {
      imageProvider = CachedNetworkImageProvider(
        picture.url,
      );
    } else {
      imageProvider = FileImage(picture.file);
    }

    return Image(image: imageProvider);
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (picture.hasUrl) {
      imageProvider = CachedNetworkImageProvider(
        picture.url,
      );
    } else {
      imageProvider = FileImage(picture.file);
    }

    return Image(image: imageProvider);
  }
}
