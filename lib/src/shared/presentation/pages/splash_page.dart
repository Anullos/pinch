import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routes.dart';
import '../../../auth/application/auth_cubit.dart';
import '../utils/pinch_colors.dart';
import '../utils/pinch_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            Navigator.of(context).pushReplacementNamed(gamesRoute);
          }
        },
        child: Container(
          color: PinchColors.background,
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(PinchImages.pinchLogo),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
