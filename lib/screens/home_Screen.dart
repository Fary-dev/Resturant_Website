// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app/Exeptions/extensionFile.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(context.user!.firstName),
      //   leading: IconButton(
      //     onPressed: () {
      //       context.userBloc.signOut();
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'Images/logo.svg',
                    height: 50,
                    color: Colors.white,
                  ).aPadding(10),
                  Row(children: [
                    TextButton(
                      onPressed: () {},
                      child: 'Resturant'.toLabel(
                        color: Color(0xffffffff),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: 'Food & Beverages'.toLabel(
                        color: Color(0xffffffff),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: 'Abaut'.toLabel(
                        color: Color(0xffffffff),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: 'Contact'.toLabel(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ]),
                  Column(
                    children: [
                      Container(
                        color: Colors.amber,
                        child: TextButton(
                          onPressed: () {},
                          child: 'En'.toLabel(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: 'De'.toLabel(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
