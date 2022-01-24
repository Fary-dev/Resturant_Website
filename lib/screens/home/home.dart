
import 'package:flutter/material.dart';
import 'package:flutter_app/Buttons/hoverAnimation.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Models/user_mode.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_app/Extension/extensionFile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';



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

  int activeIndex=0;
  final  List <String>backgrondsImages=[
    'images/slide1.jpg',
    'images/slide2.jpg',
    'images/slide3.jpg',
  ];
  Widget buildIndicater(List list)=>ListView.builder(
    scrollDirection: Axis.horizontal,
  itemCount: list.length,
    itemBuilder: (context,index){
      double unSelect=activeIndex==index?14:7;
     return Row(
       children: [
         AnimatedContainer(
           duration: Duration(milliseconds: 500),
           decoration: BoxDecoration(
           color:Color(0xffffffff),
           shape:BoxShape.circle ,
         ),height:unSelect,width: unSelect,),
         SizedBox(width:10,),
       ],
     );

    },
  );
  Widget buildImage(String backgrondsImage,int index )=>Stack(
    children: [
      SizedBox(
          height: context.heightScreen,
          width: context.widthScreen,
          child: Image.asset(backgrondsImage,fit: BoxFit.cover,)),
      Container(
        height: context.heightScreen,
        width: context.widthScreen,
        color: Color(0xff000000).withOpacity(0.3),
      ),
    ],);

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
          user: widget.user!,
          height: cWidth > 20 ? 75 : 110,
          color: cWidth > 20 ? Color(0xff252526) : Colors.transparent,
        ),
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Container(
              height: context.heightScreen,
              width: context.widthScreen,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CarouselSlider.builder(
                    itemCount:backgrondsImages.length,
                      itemBuilder: (context,index,realIndex){
                      final backgrondsImage=backgrondsImages[index];
                      return Container(
                          color: Color(0xff000000).withOpacity(0.5),
                          child: buildImage(backgrondsImage,index));
                      },
                      options: CarouselOptions(
                        height: context.heightScreen,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 10),
                        autoPlayAnimationDuration: Duration(milliseconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index,val)=>setState(()=>activeIndex=index),
                        scrollDirection: Axis.horizontal,
                      )
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Foodo',
                        style: GoogleFonts.cormorant(
                            fontSize: 80, color: Colors.white),
                      ),
                      Text(
                        'Östrreichische Küche',
                        style: GoogleFonts.halant(
                            fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AnimatedOpacity(
                        opacity: pixels <= 50 ? 1 : 0,
                        duration: Duration(milliseconds: 400),
                        child: AnimateSearch(),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    bottom: 30,
                    left: context.widthScreen/2-23.5,
                    child: Align(alignment:Alignment.bottomCenter,
                      child: SizedBox(
                          height: 14,
                          child: buildIndicater(backgrondsImages)),
                    ),
                  ),

                ],),
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
                                      image: 'images/timer_icon.svg',
                                      title: 'FAST DILIVERY',
                                      discription:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.')
                                  .expanded,
                              IconDiscription(
                                      image: 'images/star_icon.svg',
                                      title: 'FAMOUS CHEFS',
                                      discription:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.')
                                  .expanded,
                              IconDiscription(
                                      image: 'images/bio_icon.svg',
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
                                  image: 'images/timer_icon.svg',
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
                                      image: 'images/star_icon.svg',
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
                                  image: 'images/bio_icon.svg',
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
                              child: SizedBox(
                                  height:400,
                                  width: 400,
                                  child:Image.asset(
                                'images/burger.jpg',
                                fit: BoxFit.cover,
                              )),
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
                              ),
                            ),
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
                              child: Image.asset(
                                'images/burger.jpg',
                                fit: BoxFit.cover,
                              ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 400,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Get in Touch',
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        MEasyTextField(
                                          hint: 'Name',
                                          validator: (val) {
                                            if ((val ?? '').isEmpty)
                                              return 'can not be empety';
                                            return null;
                                          },
                                        ).expanded,
                                        SizedBox(
                                          width: 25,
                                        ),
                                        MEasyTextField(
                                          hint: 'Email',
                                          validator: (val) {
                                            if ((val ?? '').isEmpty)
                                              return 'can not be empety';
                                            return null;
                                          },
                                        ).expanded,
                                        SizedBox(
                                          width: 25,
                                        ),
                                        MEasyTextField(
                                          hint: 'Phone',
                                          validator: (val) {
                                            if ((val ?? '').isEmpty)
                                              return 'can not be empety';
                                            return null;
                                          },
                                        ).expanded,
                                      ],
                                    ),
                                    MEasyTextField(
                                      maxLines: 5,
                                      hint: 'You Massage',
                                      validator: (val) {
                                        if ((val ?? '').isEmpty)
                                          return 'can not be empety';
                                        return null;
                                      },
                                    ),
                                    HoverAnimation(
                                      height: 50,
                                      width: 160,
                                      thickness: 2,
                                      milliseconde: 500,
                                      curve: Curves.easeInOutSine,
                                      child: Text(
                                        'BOOK NOW',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ).center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                padding: EdgeInsets.all(25),
                                color: Color(0xff000000),
                                child: SizedBox(
                                  width: 400,
                                  height: 400,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Contact Info',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 40,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'ADDRESS',
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '58 Ralph Ave New York, New York',
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 14),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 40,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'PHONE',
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '+1 800 000 000',
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 14),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ).vPadding(25),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.email_outlined,
                                            size: 40,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'EMAIL',
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'contact@example.com',
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 14),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 80,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                    children: [
                      SizedBox(
                        width: context.widthScreen * 0.9,
                        child:  Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get in Touch',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        MEasyTextField(
                          hint: 'Name',
                          validator: (val) {
                            if ((val ?? '').isEmpty)
                              return 'can not be empety';
                            return null;
                          },
                        ).vPadding(25),

                        MEasyTextField(
                          hint: 'Email',
                          validator: (val) {
                            if ((val ?? '').isEmpty)
                              return 'can not be empety';
                            return null;
                          },
                        ),

                        MEasyTextField(
                          hint: 'Phone',
                          validator: (val) {
                            if ((val ?? '').isEmpty)
                              return 'can not be empety';
                            return null;
                          },
                        ).vPadding(25),
                        MEasyTextField(
                          maxLines: 5,
                          hint: 'You Massage',
                          validator: (val) {
                            if ((val ?? '').isEmpty)
                              return 'can not be empety';
                            return null;
                          },
                        ),
                        SizedBox(height: 25,),
                        Center(
                          child: HoverAnimation(
                            height: 50,
                            width: 160,
                            thickness: 2,
                            milliseconde: 500,
                            curve: Curves.easeInOutSine,
                            child: Text(
                              'BOOK NOW',
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),

                      ],
                ),
              ),
                      Container(
                        padding: EdgeInsets.all(25),
                        color: Color(0xff252526),
                        width: context.widthScreen,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Info',
                              style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 40,
                                  color:
                                  Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ADDRESS',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '58 Ralph Ave New York, New York',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 14),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 40,
                                  color:
                                  Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'PHONE',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '+1 800 000 000',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 14),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).vPadding(35),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  size: 40,
                                  color:
                                  Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'EMAIL',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'contact@example.com',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 14),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              SizedBox(
                height: 80,
              ),
              mediumScreenSize < context.widthScreen
                  ? Container(
                      width: context.widthScreen,
                      color: Color(0xff000000),
                      child: SizedBox(
                        width: context.widthScreen * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconDiscription(
                              colorTitle: Color(0xffffffff),
                              colorDiscription: Color(0xff424343),
                              textAlign: TextAlign.left,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              title: 'Foodo',
                              discription:
                                  'For a truly memorable dining experience reserve in advance a table as soon as you can. Come and taste our remarkable food and wine.',
                            ).expanded,
                            IconDiscription(
                              colorTitle: Color(0xffffffff),
                              colorDiscription: Color(0xff424343),
                              textAlign: TextAlign.left,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              title: 'ADDRESS',
                              discription:
                                  '58 Ralph Ave\nNew York, New York 1111\n\nP: +1 800 000 000\nE: contact@example.com',
                            ).expanded,
                            IconDiscription(
                              colorTitle: Color(0xffffffff),
                              colorDiscription: Color(0xff424343),
                              textAlign: TextAlign.left,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              title: 'HOURS',
                              discription:
                                  'Monday – Sunday\nLunch: 12PM – 2PM\nDinner: 6PM – 10PM\n\nHappy Hours: 4PM – 6PM',
                            ).expanded,
                            IconDiscription(
                              colorTitle: Color(0xffffffff),
                              colorDiscription: Color(0xff424343),
                              textAlign: TextAlign.left,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              title: 'MORE INFO',
                              discription:
                                  'Careers\n\nGet in Touch\n\nPrivacy Policy',
                            ).expanded,
                          ],
                        ),
                      ).center,
                    )
                  : Container(
                      width: context.widthScreen,
                      color: Color(0xff000000),
                      child: SizedBox(
                        width: context.widthScreen * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconDiscription(
                              colorTitle: Color(0xffffffff),
                              colorDiscription: Color(0xff424343),
                              textAlign: TextAlign.left,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              title: 'Foodo',
                              discription:
                                  'For a truly memorable dining experience reserve in advance a table as soon as you can. Come and taste our remarkable food and wine.',
                            ),
                            IconDiscription(
                              colorTitle: Color(0xffffffff),
                              colorDiscription: Color(0xff424343),
                              textAlign: TextAlign.left,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              title: 'ADDRESS',
                              discription:
                                  '58 Ralph Ave\nNew York, New York 1111\n\nP: +1 800 000 000\nE: contact@example.com',
                            ),
                            IconDiscription(
                              colorTitle: Color(0xffffffff),
                              colorDiscription: Color(0xff424343),
                              textAlign: TextAlign.left,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              title: 'HOURS',
                              discription:
                                  'Monday – Sunday\nLunch: 12PM – 2PM\nDinner: 6PM – 10PM\n\nHappy Hours: 4PM – 6PM',
                            ),
                            IconDiscription(
                              colorTitle: Color(0xffffffff),
                              colorDiscription: Color(0xff424343),
                              textAlign: TextAlign.left,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              title: 'MORE INFO',
                              discription:
                                  'Careers\n\nGet in Touch\n\nPrivacy Policy',
                            ),
                          ],
                        ),
                      ),
                    ),
              Container(
                height: 60,
                width: context.widthScreen,
                color: Color(0xff000000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
