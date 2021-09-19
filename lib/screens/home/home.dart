import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Buttons/hoverAnimation.dart';
import 'package:flutter_app/Buttons/menu_icon.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Moduls/user_mode.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_app/Exeptions/extensionFile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final User? user;

  HomePage({this.user, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = ScrollController();

  double cWidth = 0.0;
  double itemHeight = 28.0;
  double itemsCount = 20;
  double? screenWidth;
  double pixels = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        pixels = controller.position.pixels;
        print('${controller.position.pixels}');
      });
      onScroll();
    });
  }

  void onScroll() {
    setState(() {
      cWidth = controller.offset * screenWidth! / (itemHeight * itemsCount);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(() {
      onScroll();
    });
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          height: cWidth > 20 ? 75 : 110,
          color: cWidth > 20 ? Color(0xff111010) : Colors.transparent,
        ),
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: context.heightScreen,
                width: context.widthScreen,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // alignment: Alignment(0,relativePosition-0.5),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://otb.cachefly.net/wp-content/uploads/2014/07/restaurant-wine-steak-570x320.png',
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedPadding(
                        padding:
                            EdgeInsets.only(left: pixels <= 50 ? 0.0 : 200.0),
                        duration: Duration(milliseconds: 400),
                        child: AnimatedOpacity(
                          opacity: pixels <= 50 ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            'Foodo',
                            style: GoogleFonts.cormorant(
                                fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                      AnimatedPadding(
                        padding:
                            EdgeInsets.only(right: pixels <= 50 ? 0.0 : 200.0),
                        duration: Duration(milliseconds: 400),
                        child: AnimatedOpacity(
                          opacity: pixels <= 50 ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            'Östrreichische Küche',
                            style: GoogleFonts.halant(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AnimatedPadding(
                        padding:
                            EdgeInsets.only(left: pixels <= 50 ? 0.0 : 200.0),
                        duration: Duration(milliseconds: 400),
                        child: AnimatedOpacity(
                          opacity: pixels <= 50 ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: AniSearch(),
                        ),
                      ),
                    ],
                  ),
                ).center,
              ),
              SizedBox(
                height: 80,
              ),
              mediumScreenSize < context.widthScreen
                  ? SizedBox(
                      width: context.widthScreen * 0.8,
                      child: AnimatedOpacity(
                        opacity: pixels >= 100 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: AnimatedPadding(
                          padding: EdgeInsets.only(
                            left: pixels >= 100 ? 0.0 : 500.0,
                          ),
                          duration: Duration(
                            milliseconds: 600,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconDiscription(
                                      image: 'Images/timer_icon.svg',
                                      title: 'FAST DILIVERY',
                                      discription:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.')
                                  .expanded,
                              IconDiscription(
                                      image: 'Images/star_icon.svg',
                                      title: 'FAMOUS CHEFS',
                                      discription:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.')
                                  .expanded,
                              IconDiscription(
                                      image: 'Images/bio_icon.svg',
                                      title: 'EXOTIC FLAVORS',
                                      discription:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.')
                                  .expanded,
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: context.widthScreen * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: pixels >= 100 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 400),
                            child: AnimatedPadding(
                              padding: EdgeInsets.only(
                                left: pixels >= 100 ? 0.0 : 500.0,
                              ),
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              child: IconDiscription(
                                  image: 'Images/timer_icon.svg',
                                  title: 'FAST DILIVERY',
                                  discription:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.'),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: pixels >= 400 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 400),
                            child: AnimatedPadding(
                              padding: EdgeInsets.only(
                                left: pixels >= 400 ? 0.0 : 500.0,
                              ),
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              child: IconDiscription(
                                      image: 'Images/star_icon.svg',
                                      title: 'FAMOUS CHEFS',
                                      discription:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.')
                                  .vPadding(80),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: pixels >= 700 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 400),
                            child: AnimatedPadding(
                              padding: EdgeInsets.only(
                                left: pixels >= 700 ? 0.0 : 500.0,
                              ),
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              child: IconDiscription(
                                  image: 'Images/bio_icon.svg',
                                  title: 'EXOTIC FLAVORS',
                                  discription:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.'),
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 80,
              ),
              mediumScreenSize < context.widthScreen
                  ? SizedBox(
                      width: context.widthScreen * 0.8,
                      child: Row(
                        children: [
                          AnimatedOpacity(
                            opacity: pixels >= 500 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 400),
                            child: AnimatedPadding(
                              padding: EdgeInsets.only(
                                right: pixels >= 500 ? 0.0 : 200.0,
                              ),
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              child: IconDiscription(
                                title: 'Dining at Caverta',
                                discription:
                                    'For a truly memorable dining experience, cuisine and atmosphere are paired as thoughtfully as food and wine. Ut enim ad minim veniam, quis nostrud exercitation ullamco. Quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Animi, id est laborum et dolorum fuga. Nam libero tempore.',
                                titleSize: 30,
                                header: '-WELCOME-',
                                buttonTitle: 'BOOK A TABLE',
                              ),
                            ),
                          ).expanded,
                          AnimatedOpacity(
                            opacity: pixels >= 500 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 400),
                            child: AnimatedPadding(
                              padding: EdgeInsets.only(
                                left: pixels >= 500 ? 0.0 : 200.0,
                              ),
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              child: Image.network(
                                'https://static01.nyt.com/images/2021/05/17/dining/kc-korean-bulgogi-burger/kc-korean-bulgogi-burger-mediumSquareAt3X.jpg',
                                width: 400,
                                height: 400,
                              ),
                            ),
                          ).expanded,
                        ],
                      ),
                    )
                  : SizedBox(
                      width: context.widthScreen * 0.9,
                      child: Column(
                        children: [
                          AnimatedOpacity(
                            opacity: pixels >= 900 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 400),
                            child: AnimatedPadding(
                              padding: EdgeInsets.only(
                                left: pixels >= 900 ? 0.0 : 500.0,
                              ),
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              child: IconDiscription(
                                title: 'Dining at Caverta',
                                discription:
                                'For a truly memorable dining experience, cuisine and atmosphere are paired as thoughtfully as food and wine. Ut enim ad minim veniam, quis nostrud exercitation ullamco. Quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Animi, id est laborum et dolorum fuga. Nam libero tempore.',
                                titleSize: 30,
                                header: '-WELCOME-',
                                buttonTitle: 'BOOK A TABLE',
                              ),),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          AnimatedOpacity(
                            opacity: pixels >= 1400 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 400),
                            child: AnimatedPadding(
                              padding: EdgeInsets.only(
                                left: pixels >= 1400 ? 0.0 : 500.0,
                              ),
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              child: Image.network(
                                'https://static01.nyt.com/images/2021/05/17/dining/kc-korean-bulgogi-burger/kc-korean-bulgogi-burger-mediumSquareAt3X.jpg',
                                fit: BoxFit.cover,
                              ),),
                          ),




                        ],
                      ),
                    ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
