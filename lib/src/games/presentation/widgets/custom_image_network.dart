import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';

class CustomImagenetwork extends StatelessWidget {
  const CustomImagenetwork({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageBuilder(
      url: url,
      imageExtensions: const ['jpg', 'png'],
      builder: (image) {
        return Image.file(
          image,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Center(
                child: Text(
              S.of(context).notConnectedInternet,
              style: const TextStyle(color: Colors.white),
            ));
          },
        );
      },
    );
  }
}
