// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app/Models/Onboarding_model.dart';
import 'package:flutter_app/Widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  final List<OnboardingContent> contents = [
    OnboardingContent(
      "images/location.svg",
      'Enter your location',
      'Enter your street address or let us find your location.',
    ),
    OnboardingContent(
      "images/pay.svg",
      'Easy to Order',
      'Pay cash or online with Creditcard, Klarna, PayPal, EPS, Bitcoin. Bon appetit!',
    ),
    OnboardingContent(
      "images/quality.svg",
      'Quality',
      'Good Agricultural Practices (GAP) are basic food safety principles which aim to minimise biological, chemical and physical hazards from field through to distribution.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Onbording(contents);
  }
}
