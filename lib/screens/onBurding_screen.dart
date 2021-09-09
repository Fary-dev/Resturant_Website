import 'package:flutter/material.dart';
import 'package:flutter_app/Moduls/OnburingModul.dart';
import 'package:flutter_app/Widgets/widgets.dart';

class OnburdingScreen extends StatelessWidget {
   OnburdingScreen({Key? key}) : super(key: key);
final List<OnbordingContent>contents=[
  OnbordingContent("Images/location.svg", 'Enter your location', 'Enter your street address or let us find your location.'),
  OnbordingContent("Images/pay.svg", 'Easy to Order', 'Pay cash or online with Creditcard, Klarna, PayPal, EPS, Bitcoin. Bon appetit!'),
  OnbordingContent("Images/quality.svg", 'Quality', 'Good Agricultural Practices (GAP) are basic food safety principles which aim to minimise biological, chemical and physical hazards from field through to distribution.'),
];
  @override
  Widget build(BuildContext context) {
    return Onbording(contents);
  }
}
