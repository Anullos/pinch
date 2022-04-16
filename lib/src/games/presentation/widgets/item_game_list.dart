import 'package:flutter/material.dart';

import '../../../shared/presentation/utils/pinch_colors.dart';
import '../../../shared/presentation/utils/pinch_images.dart';
import '../../domain/models/game_lite_model.dart';
import '../extensions/game_category_type_extension.dart';
import '../extensions/game_status_type_extension.dart';

class ItemGameList extends StatelessWidget {
  const ItemGameList(
      {Key? key, required this.index, required this.game, required this.onTap})
      : super(key: key);
  final int index;
  final GameLiteModel game;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.0, vertical: index == 0 ? 20.0 : 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 450,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: PinchColors.background,
            borderRadius: const BorderRadius.all(
              Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                color: PinchColors.black,
                blurRadius: 6,
                spreadRadius: 3,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              (game.cover == null)
                  ? Hero(
                      tag: 'game_picture_${game.id}',
                      child: Image.asset(
                        PinchImages.pinchLogo,
                      ),
                    )
                  : Hero(
                      tag: 'game_picture_${game.id}',
                      child: Image.network(
                        game.cover!.url,
                        fit: BoxFit.fill,
                      ),
                    ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              game.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              game.category.toTranslation(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      if (game.summary != null) ...[
                        const SizedBox(height: 10),
                        Text(
                          game.summary!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              (game.status != null)
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(top: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                          color: game.status!.getColor(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          game.status!.toTranslation(context),
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
