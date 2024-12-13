import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_750/core/app_export.dart';
import 'package:pp_750/widgets/custom_elevated_button.dart';
import 'package:pp_750/widgets/custom_icon_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/services/database/database_keys.dart';
import '../../core/services/database/database_service.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static Widget builder(BuildContext context) {
    return OnboardingScreen();
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final _databaseService = GetIt.instance<DatabaseService>();

  // String backImagePath = Assets.images.backgroundOnboarding1.path;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'image': Assets.images.onboarding1.path,
      'head': 'Welcome to Sleep and Energy Diary',
      'body': 'A simple app to track your sleep and energy levels',
    },
    {
      'image': Assets.images.onboarding2.path,
      'head': 'Keep a record of your sleep',
      'body': 'Record the duration and quality of your sleep to understand its impact on your well-being',
    },
    {
      'image': Assets.images.onboarding3.path,
      'head': 'Keep track of your energy levels',
      'body': 'Record your energy and activity levels throughout the day',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 16.h),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            // SmoothPageIndicator(
            //   controller: _pageController,
            //   count: 3,
            //   effect: CustomizableEffect(
            //     activeDotDecoration: DotDecoration(
            //       height: 16.h,
            //       width: 16.h,
            //       borderRadius: BorderRadiusStyle.roundedBorder20,
            //       color: theme.colorScheme.primary,
            //       dotBorder: DotBorder(
            //         color: theme.colorScheme.primary,
            //         width: 1.h,
            //       ),
            //     ),
            //     dotDecoration: DotDecoration(
            //       height: 16.h,
            //       width: 16.h,
            //       borderRadius: BorderRadiusStyle.roundedBorder20,
            //       color: theme.colorScheme.primary.withOpacity(0),
            //       dotBorder: DotBorder(
            //         color: theme.colorScheme.primary,
            //         width: 1.h,
            //       ),
            //     ),
            //     spacing: 8.h,
            //   ),
            // ),
            Expanded(
              child: Container(
                child: PageView(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  // itemCount: _onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    OnboardingPage(
                      image: _onboardingData[0]['image']!,
                      headText: _onboardingData[0]['head']!,
                      bodyText: _onboardingData[0]['body']!,
                      isTop: true,
                    ),
                    OnboardingPage(
                      image: _onboardingData[1]['image']!,
                      headText: _onboardingData[1]['head']!,
                      bodyText: _onboardingData[1]['body']!,
                    ),
                    OnboardingPage(
                      image: _onboardingData[2]['image']!,
                      headText: _onboardingData[2]['head']!,
                      bodyText: _onboardingData[2]['body']!,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 50.h,
        ).copyWith(bottom: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              height: 45.h,
              width: 45.h,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: theme.colorScheme.primary,
              ),
            ),
            SizedBox(width: 16.h),
            Expanded(
              child: CustomElevatedButton(
                buttonStyle: CustomButtonStyles.fillPrimaryContainer,
                buttonTextStyle: CustomTextStyles.displaySmall18,
                text: _currentPage != 2 ? 'Next' : 'Start',
                onPressed: () => _next(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _next() async {
    if (_pageController.page == _onboardingData.length - 1) {
      context.replaceRoute(HomeRoute());
    } else {
      _databaseService.put(DatabaseKeys.seenOnboarding, true);
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
}

class OnboardingPage extends StatelessWidget {
  final String headText;
  final String bodyText;
  final String image;
  final bool isSecond;
  final bool isTop;
  final Widget? textWidget;

  const OnboardingPage(
      {Key? key,
      required this.headText,
      required this.image,
      this.isSecond = false,
      this.isTop = false,
      this.textWidget,
      required this.bodyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: AppDecoration.outline.copyWith(
      //   color: isTop ? appTheme.black900 : theme.colorScheme.surface,
      // ),
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // fit: StackFit.expand,
        children: [
          SizedBox(height: 20.h),

          //Spacer(),
          Flexible(
            child: Container(
              decoration: AppDecoration.surface.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              padding: EdgeInsets.all(8.h),
              child: CustomImageView(
                imagePath: image,
                fit: BoxFit.contain,
              ),
            ),
          ),
         // SizedBox(height: 16.h),
          Container(
            // decoration: AppDecoration.surface.copyWith(
            //   borderRadius: BorderRadiusStyle.roundedBorder2,
            // ),
            // height: 150.h,
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            //padding: EdgeInsets.only(left: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  headText,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.displayLarge.copyWith(
                      //color: isTop ? appTheme.black900 : appTheme.black900,
                      ),
                ),
                if (bodyText.isNotEmpty) ...[
                  SizedBox(height: 8.h),
                  Text(
                    bodyText,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyLarge.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        //  SizedBox(height: 120.h),
        ],
      ),
    );
  }
}
