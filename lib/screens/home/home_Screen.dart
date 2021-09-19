// // ignore_for_file: file_names
// import 'package:flutter_app/Exeptions/extensionFile.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/Bloc/user_bloc.dart';
// import 'package:flutter_app/Moduls/user_mode.dart';
// import 'package:flutter_app/Widgets/widgets.dart';
// import 'package:get/get.dart';
//
// import 'appBar.dart';
//
// class HomeScreen extends StatefulWidget {
//   final User? user;
//
//   HomeScreen({Key? key, this.user}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   final UserBloc controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     double heightScreen = MediaQuery.of(context).size.height;
//
//     return SafeArea(
//       child: Scaffold(
//         body: CustomScrollView(
//
//           slivers: [
//             SliverPersistentHeader(
//               pinned: heightScreen > 250 ? true : false,
//               floating: false,
//               delegate: SliverCustomHeaderDelegate(
//                 user: widget.user,
//                 collapsedHeight: heightScreen > 75 ? 75 : 0,
//                 expandedHeight: heightScreen,
//                 paddingTop: 0,
//                 coverImgUrl:
//                     'https://otb.cachefly.net/wp-content/uploads/2014/07/restaurant-wine-steak-570x320.png',
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                   (_, i) => Column(
//                         children: [
//                           AniSearch(),
//                           Container(
//                             child: AniButton(mobilePage: false),
//                           ).center.vPadding(30),
//                           TopLeftButton(mobilePage: false).vPadding(20),
//
//                         ],
//                       ),
//
//
//                   childCount: 1),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
