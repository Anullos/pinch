import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../shared/presentation/utils/pinch_colors.dart';
import '../../../shared/presentation/utils/pinch_images.dart';
import '../../domain/models/game_lite_model.dart';
import 'custom_image_network.dart';

class ItemSimilarGame extends StatefulWidget {
  const ItemSimilarGame({Key? key, required this.gameLite}) : super(key: key);
  final GameLiteModel gameLite;

  @override
  State<ItemSimilarGame> createState() => _ItemSimilarGameState();
}

class _ItemSimilarGameState extends State<ItemSimilarGame> {
  bool isBack = false;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + math.pi) % (2 * math.pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: angle),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, _) {
        if (value >= (math.pi / 2)) {
          isBack = true;
        } else {
          isBack = false;
        }
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(value),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: !isBack
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      GestureDetector(
                        onTap: _flip,
                        child: widget.gameLite.cover != null
                            ? CustomImagenetwork(
                                url: widget.gameLite.cover!.url)
                            : Container(
                                color: PinchColors.primary,
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(PinchImages.pinchLogo),
                              ),
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: _flip,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(math.pi),
                      child: Stack(
                        children: [
                          Container(
                            color: PinchColors.lightPrimary,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    widget.gameLite.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    widget.gameLite.summary ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
