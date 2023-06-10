import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/utils/assets_images.dart';


class EmptyStateScreen extends StatelessWidget {
  EmptyStateScreen(
      {this.title = "",
        this.description = "",
        this.assetImageColor = Colors.red,
        this.assetImagePath = "",
        Key? key})
      : super(key: key);
  String title;
  String description;
  String assetImagePath;
  Color assetImageColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(vertical: 32),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [

          Lottie.asset(AssetsImages.koala, repeat: true, fit: BoxFit.scaleDown),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              )),

        ],
      ),
    );
  }
}