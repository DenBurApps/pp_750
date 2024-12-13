import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pp_750/core/services/database/database_service.dart';
import 'package:pp_750/data/models/models/models.dart';
import 'package:pp_750/widgets/custom_elevated_button.dart';
import 'package:pp_750/widgets/support_pop_up.dart';

import '../../core/app_export.dart';
import '../../core/helpers/dialog_helper.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'agreement_screen/agreement_screen.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  static Widget builder(BuildContext context) {
    return SettingsScreen();
  }

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  DatabaseService _databaseService = GetIt.I<DatabaseService>();

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          centerTitle: true,
          height: 80.h,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  decoration: IconButtonStyleHelper.fillPrimaryContainerTL16,
                  onTap: () {
                    context.maybePop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  'Settings',
                  style: CustomTextStyles.displaySmall.copyWith(
                  ),
                ),
                SizedBox(
                  width: 40.h,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  // decoration: AppDecoration.outline.copyWith(
                  //   //color: theme.colorScheme.primary.withOpacity(0.5),
                  //   borderRadius: BorderRadius.circular(16.h),
                  // ),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8.h,
                      mainAxisSpacing: 8.h,
                    ),
                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      _buildButton(context,
                          text: 'Version',
                          onTap: () {
                        DialogHelper.showAppVersionDialog(context);
                      },
                          decoration: AppDecoration.surface,
                          backColor: theme.colorScheme.surface,
                          textColor: theme.colorScheme.onSecondary),
                      // Divider(
                      //   color: theme.colorScheme.onPrimary.withOpacity(0.4),
                      //   thickness: 1.h,
                      //   height: 4.h,
                      // ),
                      _buildButton(
                        context,
                        text: 'Rate us',
                        onTap: () async {
                          if (await InAppReview.instance.isAvailable()) {
                            await InAppReview.instance.requestReview();
                          }
                        },
                        isTextWhite: true,
                        decoration: AppDecoration.surface,
                        backColor: theme.colorScheme.surface,
                        textColor: theme.colorScheme.onSecondary,
                      ),
                      // Divider(
                      //   color: theme.colorScheme.onPrimary.withOpacity(0.4),
                      //   thickness: 1.h,
                      //   height: 4.h,
                      // ),
                      _buildButton(context,
                          text: 'Contact Us', onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => const SupportPopUp(
                            title: 'Contact',
                          ),
                        );
                      },
                          isTextWhite: true,
                          decoration: AppDecoration.surface,
                          backColor: theme.colorScheme.surface,
                          textColor: theme.colorScheme.onSecondary),
                      // Divider(
                      //   color: theme.colorScheme.onPrimary.withOpacity(0.4),
                      //   thickness: 1.h,
                      //   height: 4.h,
                      // ),
                      _buildButton(
                        context,
                        text: 'Privacy Policy',
                        onTap: () {
                          context.pushRoute(AgreementRoute(
                              arguments: AgreementScreenArguments(
                                  agreementType: AgreementType.privacy)));
                        },
                        decoration: AppDecoration.surface,
                        backColor: theme.colorScheme.surface,
                        textColor: theme.colorScheme.onSecondary,
                      ),
                      // Divider(
                      //   color: theme.colorScheme.onPrimary.withOpacity(0.4),
                      //   thickness: 1.h,
                      //   height: 4.h,
                      // ),
                      _buildButton(
                        context,
                        text: 'Terms of Use',
                        onTap: () {
                          context.pushRoute(AgreementRoute(
                              arguments: AgreementScreenArguments(
                                  agreementType: AgreementType.terms)));
                        },
                        decoration: AppDecoration.surface,
                        backColor: theme.colorScheme.surface,
                        textColor: theme.colorScheme.onSecondary,
                      ),
                      // SizedBox(
                      //   height: 8.h,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {String text = '',
      Function()? onTap,
      Decoration? decoration,
      bool isTextWhite = false,
      Color textColor = Colors.black,
      Color backColor = Colors.white,
      String? icon}) {
    return Container(
      decoration: AppDecoration.surface.copyWith(
        // color: backColor,
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: CupertinoButton(
        onPressed: () {
          onTap?.call();
        },
        child: Container(
          // decoration: AppDecoration.outlineGray.copyWith(
          //   // color: backColor,
          //   borderRadius: BorderRadiusStyle.roundedBorder16,
          // ),
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.h),
          // margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 65.h,
                height: 65.h,
                padding: EdgeInsets.all(10.h),
                child: CustomImageView(
                  imagePath: icon,
                  fit: BoxFit.cover,
                  radius: BorderRadiusStyle.roundedBorder10,
                ),
              ),
              Text(
                text,
                style: CustomTextStyles.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }


}
