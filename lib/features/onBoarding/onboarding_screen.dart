import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/features/onBoarding/controller.dart';
import 'package:newsapp/features/onBoarding/models/onboarding_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return PageviewController();
      },
      builder: (context, child) {
        final controller = context.watch<PageviewController>();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppLightColor.backgroundColor,
            actions: [
              if (controller.currentindex != 2)
                Consumer<PageviewController>(
                  builder: (BuildContext context, value, Widget? child) {
                    return TextButton(
                      onPressed: () {
                        value.navigateandsavefinishing(context);
                      },
                      child: Text("Skip"),
                    );
                  },
                ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSize.r30,
              horizontal: AppSize.w16,
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (int index) {
                      controller.updateindexvalue(index);
                    },
                    itemCount: OnboardingModel.onboardingData.length,
                    itemBuilder: (context, index) {
                      OnboardingModel model =
                          OnboardingModel.onboardingData[index];
                      return Column(
                        children: [
                          Expanded(child: Image.asset(model.imagePath)),
                          SizedBox(height: AppSize.h24),
                          Text(
                            model.title,
                            style: TextTheme.of(context).titleMedium,
                          ),
                          SizedBox(height: AppSize.h12),
                          Text(
                            textAlign: TextAlign.center,
                            model.desc,
                            style: TextTheme.of(context).displayMedium,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.h24),
                Consumer<PageviewController>(
                  builder:
                      (
                        BuildContext context,
                        PageviewController value,
                        Widget? child,
                      ) {
                        return SmoothPageIndicator(
                          controller: value.pageController, // PageController
                          count: 3,
                          effect: SwapEffect(
                            activeDotColor: AppLightColor.primaryColor,
                            dotColor: AppLightColor.border2,
                          ), // your preferred effect
                          onDotClicked: (index) {},
                        );

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: List.generate(
                        //     3,
                        //     (index) => Container(
                        //       height: 16,
                        //       width: 16,
                        //       margin: EdgeInsets.symmetric(horizontal: 3),
                        //       decoration: BoxDecoration(
                        //         color: value.currentindex == index
                        //             ? AppColor.primaryColor
                        //             : AppColor.border2,
                        //         shape: BoxShape.circle,
                        //       ),
                        //     ),
                        //   ),
                        // );
                      },
                ),

                SizedBox(height: AppSize.h40 * 2.825),

                Consumer<PageviewController>(
                  builder: (BuildContext context, value, Widget? child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (value.currentindex != 2) {
                          controller.navigatoToNextPage();
                        } else {
                          value.navigateandsavefinishing(context);
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width,
                          AppSize.h48,
                        ),
                      ),
                      child: value.currentindex != 2
                          ? Text("Next")
                          : Text('Get Started'),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
