// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/Constant/constant.dart';
// import 'package:flutter_app/Exeptions/extensionFile.dart';
// import 'package:flutter_app/Moduls/user_mode.dart';
// import 'package:flutter_app/Widgets/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate  {
//   SliverCustomHeaderDelegate(
//       {required this.collapsedHeight,
//         required this.expandedHeight,
//         required this.paddingTop,
//         required this.coverImgUrl,
//         this.user});
//   final double collapsedHeight;
//   final double expandedHeight;
//   final double paddingTop;
//   final String coverImgUrl;
//   final User? user;
//
//   @override
//   double get minExtent => this.collapsedHeight + this.paddingTop;
//
//   @override
//   double get maxExtent => this.expandedHeight;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
//   // Color makeStickyHeaderBgColor(double shrinkOffset) {
//   //   final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
//   //       .clamp(0, 255)
//   //       .toInt();
//   //   return Color.fromARGB(alpha, 255, 255, 255);
//   // }
//
//   // Color makeStickyHeaderTextColor(double shrinkOffset, bool isIcon) {
//   //   if (shrinkOffset <= 50) {
//   //     return isIcon ? Colors.white : Colors.transparent;
//   //   } else {
//   //     final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
//   //         .clamp(0, 255)
//   //         .toInt();
//   //     return Color.fromARGB(alpha, 0, 0, 0);
//   //   }
//   // }
//
//   double opacityValue(double shrinkOffset) {
//     final double value = 1 - (shrinkOffset / expandedHeight);
//     return value;
//   }
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     double width = MediaQuery.of(context).size.width;
//
//     return Container(
//       height: maxExtent,
//       width: width,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             height: maxExtent,
//             width: width,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 // alignment: Alignment(0,relativePosition-0.5),
//                 fit: BoxFit.cover,
//                 image: NetworkImage(coverImgUrl),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: width,
//             height: 75,
//             child: AppBar(
//               shape: ContinuousRectangleBorder(
//                 borderRadius: const BorderRadius.all(Radius.circular(18)),
//               ),
//               backgroundColor:
//                   shrinkOffset > 10 ? Colors.black87 : Colors.transparent,
//               automaticallyImplyLeading: false,
//               elevation: 0,
//               titleSpacing: 0,
//               centerTitle: true,
//               title: Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       alignment: Alignment.centerLeft,
//                       child: width > mediumScreenSize
//                           ? Text(RESTURANT_NAME,
//                                   style: GoogleFonts.playfairDisplay(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold))
//                               .hPadding(10)
//                           : IconButton(
//                               onPressed: () {},
//                               icon: SvgPicture.asset(
//                                 'images/menu(7).svg',
//                                 height: 28,
//                                 width: 28,
//                                 color: Theme.of(context).iconTheme.color,
//                               ),
//                             ),
//                     ),
//                   ),
//                   Expanded(
//                       flex: 4,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           width < mediumScreenSize
//                               ? SvgPicture.asset(
//                                   'images/logo.svg',
//                                   height: 50,
//                                   color: Theme.of(context).iconTheme.color,
//                                 ).center.expanded
//                               : Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     NavBarItem('HOME', false),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     NavBarItem('MENU', false),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     NavBarItem('RESERVATION', false),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     NavBarItem('GALLERY', false),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     NavBarItem('CONTACT', false),
//  'HOME'.toLabel(fontSize: 14),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     'MENU'.toLabel(fontSize: 14),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     'RESERVATION'.toLabel(fontSize: 14),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     'GALLERY'.toLabel(fontSize: 14),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     'CONTACT'.toLabel(fontSize: 14),
//
//                                   ],
//                                 ),
//                         ],
//                       )),
//                   Expanded(
//                       flex: 2,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           if (width > mediumScreenSize)
//                             Row(
//                               children: [
//                                 user != null
//                                     ? 'Hi ${user!.firstName}'.toLabel()
//                                     : 'LOGIN'.toLabel(),
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: SvgPicture.asset(
//                                     'images/person(4).svg',
//                                     color: Theme.of(context).iconTheme.color,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           if (width > smallScreenSize)
//                             IconButton(
//                               onPressed: () {},
//                               icon: SvgPicture.asset(
//                                 'images/shopping_bag(2).svg',
//                                 color: Theme.of(context).iconTheme.color,
//                               ),
//                             ),
//                         ],
//                       )),
//                 ],
//               ),
//             ).aPadding(10),
//           ),
//           expandedHeight < 220  || opacityValue(shrinkOffset) < 0.3
//             ?  Container()
//               : Opacity(
//                   opacity: opacityValue(shrinkOffset),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Foodo',
//                           style: GoogleFonts.cormorant(
//                               fontSize: 80, color: Colors.white),
//                         ),
//                         Text(
//                           'Östrreichische Küche',
//                           style: GoogleFonts.halant(
//                               fontSize: 20, color: Colors.white),
//                         ),
//                         SizedBox(height: 20,),
//                         AniSearch(),
//                       ],
//                     ),
//                   ),
//                 ).center
//
//         ],
//       ),
//     );
//   }
// }
