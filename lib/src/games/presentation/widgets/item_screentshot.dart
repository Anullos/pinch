import 'package:flutter/material.dart';

import 'custom_image_network.dart';

class ItemScreenshot extends StatelessWidget {
  const ItemScreenshot({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: CustomImagenetwork(url: url),
    );
  }
}
