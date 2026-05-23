import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,

        title: Text(
          'Terms & Conditions',
          style: TextTheme.of(context).titleMedium!.copyWith(
            fontSize: AppSize.sp16,
            color: AppLightColor.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.dg20,
          vertical: AppSize.dg12,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Opacity(
                  opacity: 0.9,
                  // درجة الشفافية (0.05 أو 0.1 ممتازة للعلامة المائية)
                  child: Image.asset(
                    "assets/images/background_image.png",
                    width: double.infinity,
                    height: double.infinity,

                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Section(
                  title: '1. Introduction',
                  body:
                      'Welcome to NEWST. By accessing or using our news application, you agree to be bound by these Terms & Conditions. Please read them carefully before continuing to use the app. If you do not agree with any part of these terms, you should discontinue use of the service immediately.',
                ),
                _Section(
                  title: '2. User Responsibilities',
                  body:
                      'As a user of NEWST, you agree to use the application only for lawful purposes and in a manner that does not infringe on the rights of others. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.',
                ),
                _Section(
                  title: '3. Copyrights',
                  body:
                      'All content provided through NEWST, including articles, images, logos, and trademarks, is the property of NEWST or its content partners and is protected by applicable copyright laws. You may not reproduce, distribute, or create derivative works from any content without prior written permission.',
                ),
                _Section(
                  title: '4. Privacy',
                  body:
                      'Your privacy is important to us. NEWST collects and processes personal data in accordance with our Privacy Policy. By using the app, you consent to such processing and warrant that all data provided by you is accurate and up to date.',
                ),
                _Section(
                  title: '5. Changes to Terms',
                  body:
                      'NEWST reserves the right to modify these Terms & Conditions at any time. Updated terms will be posted within the application, and continued use after such changes constitutes your acceptance of the revised terms.',
                ),
                SizedBox(height: AppSize.h24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String body;

  const _Section({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppSize.dg16, bottom: AppSize.dg8),
          child: Text(
            title,
            style: TextTheme.of(
              context,
            ).titleMedium!.copyWith(color: AppLightColor.primaryColor),
          ),
        ),
        Text(
          body,
          style: TextTheme.of(
            context,
          ).displayMedium!.copyWith(color: AppLightColor.textPrimary),
        ),
      ],
    );
  }
}
