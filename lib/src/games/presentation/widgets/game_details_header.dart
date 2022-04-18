import 'package:flutter/material.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/pinch_colors.dart';
import '../../../shared/presentation/utils/pinch_images.dart';
import '../../domain/models/game_lite_model.dart';
import '../extensions/game_category_type_extension.dart';
import 'custom_image_network.dart';

class GameDetailsHeader extends StatelessWidget {
  const GameDetailsHeader({Key? key, required this.gameLite}) : super(key: key);
  final GameLiteModel gameLite;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: PinchColors.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 220,
            padding: const EdgeInsets.only(left: 20.0, top: 8.0, right: 8.0),
            child: Hero(
              tag: 'game_picture_${gameLite.id}',
              child: (gameLite.cover == null)
                  ? Image.asset(
                      PinchImages.pinchLogo,
                      width: 100,
                    )
                  : CustomImagenetwork(url: gameLite.cover!.url),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      gameLite.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    gameLite.summary != null
                        ? Text(
                            gameLite.summary!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                        : Container(),
                    const SizedBox(height: 12),
                    Text(
                      S.of(context).categoryPlus(
                          gameLite.category.toTranslation(context)),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
