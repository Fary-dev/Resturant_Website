import 'package:flutter/material.dart';
import 'constant.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          if (widthSize > 900)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/banner.jpg',
                    ),
                  ),
                ),
              ),
            ),
          Spacer(),
          Column(
            crossAxisAlignment: widthSize > 600
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Text(
                'Foodo'.toUpperCase(),
                style: Theme.of(context).textTheme.headline1.copyWith(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Schluss mit lästigen Flyersammlungen! \nBei Mjam findest Du all Deine Lieblingsrestaurants \nund kannst so ganz einfach online Essen \nbestellen– egal ob Pizza, Burger, Sushi \noder Schnitzel. Entscheide Dich für eines \nvon zahlreichen Restaurants in Deiner Nähe, \nbestelle ein Essen Deiner Wahl, bezahle \nonline oder bar bei Erhalt und lass Dir \nDein Essen einfach zu Dir liefern. Lieferservice \nnutzen und Lieblingsgericht genießen!',
                style: TextStyle(
                    fontFamily: 'Tina',
                    color: titleColor.withOpacity(0.50),
                    fontSize: 18.0),
              ),
              FittedBox(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: buttonColor,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: buttonColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Get Started'.toUpperCase(),
                          style: TextStyle(
                            color: menuTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
