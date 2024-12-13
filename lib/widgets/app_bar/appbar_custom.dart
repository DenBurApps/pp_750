import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../custom_icon_button.dart';

class AppbarCustom extends StatelessWidget {
final Widget? rightChild;
final Widget? middleChild;
final bool isBackable;

final String backgroundImage;
  const AppbarCustom({super.key, this.rightChild, this.middleChild, this.isBackable = true, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if(backgroundImage.isNotEmpty)
          CustomImageView(
            width: double.maxFinite,
            imagePath: backgroundImage,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: isBackable ? CustomIconButton(
                    onTap: context.maybePop,
                    child: CustomImageView(
                      imagePath: 'Assets.images.ba',
                    ),
                  ): null,
                ),
                Container(
                  child: middleChild,
                ),
                Container(
                  child: rightChild,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
