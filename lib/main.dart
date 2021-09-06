import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/widgets.dart';
import 'Constant/Colors/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodo',
      theme: ThemeData(
        primaryColor: primaryColor,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: context.size!.height * 0.20,
          ),
          CustomButton(title: 'Click Me', onTap: () {})
        ],
      )),
    );
  }
}
