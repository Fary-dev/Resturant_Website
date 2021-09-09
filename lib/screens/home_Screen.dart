import 'package:flutter/material.dart';
import 'package:flutter_app/Exeptions/exeptionsFile.dart';

import 'login_width_web.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pageRoute(LoginWeb()),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: 'Home Screen'.toLabel(fontSize: 40).center,
      ),
    );
  }
}
