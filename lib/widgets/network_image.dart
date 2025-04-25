import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../resources/app_colors.dart';

class DisplayNetworkImage extends StatelessWidget {
  final String image;
  final double height, width;
  const DisplayNetworkImage(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: image,
      height: height,
      width: width,
      duration: 1500,
      curve: Curves.easeIn,
      onPointer: true,
      debugPrint: false,
      fitAndroidIos: BoxFit.cover,
      fitWeb: BoxFitWeb.cover,
      onLoading: CircularProgressIndicator(color: AppColors.black,),
      onError: const Icon(
        Icons.error,
        color: AppColors.red,
      ),
      onTap: () {},
    );
  }
}
