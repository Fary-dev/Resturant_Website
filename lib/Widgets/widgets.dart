// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Buttons/hoverAnimation.dart';
import 'package:flutter_app/Buttons/menu_icon.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Extension/extensionFile.dart';
import 'package:flutter_app/Models/Onboarding_model.dart';
import 'package:flutter_app/Models/user_mode.dart';
import 'package:flutter_app/screens/login_width_mobile_app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

class MBloc<t> {
  BehaviorSubject<t> _bloc = BehaviorSubject();

  Stream<t> get stream => _bloc.stream;

  t get value => _bloc.value;

  void setValue(t val) => _bloc.add(val);
}

class MButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;
  final double? padding;
  final double? radius;
  final double? borderWidth;
  final Color? borderColor;
  final bool? isTextButton;
  final double? fontSize;

  const MButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon,
    this.color,
    this.radius,
    this.padding,
    this.borderWidth,
    this.borderColor,
    this.isTextButton = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: isTextButton!
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  color ?? Theme.of(context).primaryColor,
                ),
                padding:
                    MaterialStateProperty.all(EdgeInsets.all(padding ?? 0)),
              )
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  color ?? Theme.of(context).primaryColor,
                ),
                padding:
                    MaterialStateProperty.all(EdgeInsets.all(padding ?? 0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 0),
                    side: BorderSide(
                      color: borderColor ?? Theme.of(context).primaryColor,
                      width: borderWidth ?? 0,
                    ),
                  ),
                ),
              ),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: color == const Color(0xffffffff)
                        ? Theme.of(context).primaryColor
                        : const Color(0xffffffff),
                    size: 18,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  title.toLabel(
                    color: color == const Color(0xffffffff)
                        ? Theme.of(context).primaryColor
                        : const Color(0xffffffff),
                  ),
                ],
              )
            : title
                .toLabel(
                  color: color == const Color(0xffffffff)
                      ? Theme.of(context).primaryColor
                      : const Color(0xffffffff),
                  fontSize: fontSize,
                )
                .hPadding(20),
      ),
    );
  }
}

class MText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool? bold;
  final TextAlign? alignment;
  final TextStyle? textStyle;
  final double? opacity;

  const MText(
    this.title, {
    this.fontSize,
    this.color,
    this.bold,
    this.alignment,
    this.textStyle,
    this.opacity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity == null ? 1.0 : opacity!,
      child: Text(
        title,
        textAlign: alignment,
        style: textStyle ??
            TextStyle(
              fontSize: fontSize,
              fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
      ),
    );
  }
}

class MTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? lable;
  final Function(String?)? onChange;
  final Function(String?)? onSave;
  final FormFieldValidator<String>? validator;
  final bool autoFocus;
  final bool? obscureText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final bool isEmpety;

  const MTextField({
    this.prefixIcon,
    this.suffixIcon,
    required this.lable,
    this.validator,
    this.controller,
    this.autoFocus = false,
    this.onChange,
    this.onSave,
    this.obscureText = false,
    this.inputFormatters,
    this.textInputType,
    this.isEmpety = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      controller: controller,
      style: Theme.of(context).textTheme.button,
      obscureText: obscureText!,
      validator: validator,
      onSaved: onSave,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: lable,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}

class MEasyTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hint;
  final Function(String?)? onChange;
  final Function(String?)? onSave;
  final FormFieldValidator<String>? validator;
  final bool autoFocus;
  final bool? obscureText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final bool isEmpety;
  final int maxLines;

  const MEasyTextField({
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
     this.maxLines=1,
    this.validator,
    this.controller,
    this.autoFocus = false,
    this.onChange,
    this.onSave,
    this.obscureText = false,
    this.inputFormatters,
    this.textInputType,
    this.isEmpety = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(

        minLines: 1,
        // scrollPadding: const EdgeInsets.symmetric(vertical: 15.0,),
        maxLines: maxLines,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        controller: controller,
        style: Theme.of(context).textTheme.button,
        obscureText: obscureText!,
        validator: validator,
        onSaved: onSave,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 10,),
          // isDense: true,
          border: InputBorder.none,
          fillColor: Colors.grey.shade200,
          filled: true,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(0),
          // ),
          hintStyle: TextStyle(color:Color(0xff000000),),
          hintText: hint,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),

      ),
    );
  }
}

class Onbording extends StatelessWidget {
  final List<OnboardingContent> contents;

  Onbording(this.contents, {Key? key}) : super(key: key);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final RxInt currentIndex = 0.obs;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: contents.length,
            onPageChanged: (int index) => currentIndex.value = index,
            itemBuilder: (_, index) => Column(
              children: [
                SvgPicture.asset(
                  contents[index].image,
                  height: 300,
                ),
                contents[index]
                    .title
                    .toLabel(fontSize: 25, bold: true)
                    .vPadding(15),
                contents[index].description.toLabel(
                      fontSize: 18,
                      color: Colors.grey,
                      alignment: TextAlign.left,
                    ),
              ],
            ).aPadding(30),
          ).expanded,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              contents.length,
              (index) => Obx(
                () => Container(
                  height: 10,
                  width: currentIndex.value == index ? 25 : 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ).aMargin(5),
              ),
            ),
          ),
          Obx(
            () => MButton(
              // ignore: unrelated_type_equality_checks
              title: currentIndex == contents.length - 1 ? 'Continue' : 'Next',
              onTap: () {
                // ignore: unrelated_type_equality_checks
                if (currentIndex == contents.length - 1) {
                  Get.to<Widget>(MobileApp());
                }
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.bounceIn,
                );
              },
              color: Theme.of(context).primaryColor,
              radius: 18,
            ).vPadding(25),
          ),
        ],
      ),
    );
  }
}

class MSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String? hint;

  MSwitch({required this.value, required this.onChanged, this.hint, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBloc<bool> _value = MBloc<bool>()..setValue(value);
    return StreamBuilder<bool>(
      stream: _value.stream,
      builder: (_, snapshot) {
        if (snapshot.hasData)
          return hint != null
              ? Tooltip(
                  message: hint!,
                  child: Switch(
                    onChanged: (val) {
                      onChanged(val);
                      _value.setValue(val);
                    },
                    value: snapshot.data!,
                  ),
                )
              : Switch(
                  onChanged: (val) {
                    onChanged(val);
                    _value.setValue(val);
                  },
                  value: snapshot.data!,
                );
        return Container();
      },
    );
  }
}

class MError extends StatelessWidget {
  final Exception exception;

  const MError({required this.exception, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: exception.toString().toLabel(
              color: Color(0xffffffff),
              bold: true,
            ),
      );
}

class MIndicator extends StatelessWidget {
  MIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LinearProgressIndicator().center;
}

class AnimateButton extends StatefulWidget {
  final bool mobilePage;

  AnimateButton({
    required this.mobilePage,
  });

  @override
  _AnimateButtonState createState() => _AnimateButtonState();
}

class _AnimateButtonState extends State<AnimateButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation _colorAnimation;

  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.2, end: 4.0).animate(
      CurvedAnimation(curve: Curves.linear, parent: _controller),
    );
    _colorAnimation =
        ColorTween(begin: Colors.white, end: Colors.black).animate(
      CurvedAnimation(curve: Curves.linear, parent: _controller),
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          height = 200.0;
          width = 200.0;
          _controller.forward();
        });
      },
      onExit: (value) {
        setState(() {
          height = 0.0;
          width = 0.0;
          _controller.reverse();
        });
      },
      child: Container(
        height: 50.0,
        width: 160.0,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.transparent, width: 2.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Stack(
            children: [
              OverflowBox(
                maxHeight: 200.0,
                maxWidth: 200.0,
                child: AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 375),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(200.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'EXPLORE',
                  style: TextStyle(
                    letterSpacing: _animation.value,
                    color: _colorAnimation.value as Color,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimateButtonWithBorder extends StatefulWidget {
  final bool mobilePage;
  final String titleButton;

  AnimateButtonWithBorder({
    required this.mobilePage,
    required this.titleButton,
  });

  @override
  _AnimateButtonWithBorderState createState() =>
      _AnimateButtonWithBorderState();
}

class _AnimateButtonWithBorderState extends State<AnimateButtonWithBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation _colorAnimation;

  double height = 0.0;
  double width = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation = Tween<double>(begin: 1.2, end: 1.2).animate(
      CurvedAnimation(curve: Curves.linear,parent: _controller),
    );
    _colorAnimation =
        ColorTween(begin: Colors.white, end: primaryColor).animate(
      CurvedAnimation(curve: Curves.linear, parent: _controller),
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          height = 50.0;
          width = 160.0;
          _controller.forward();
        });
      },
      onExit: (value) {
        setState(() {
          height = 0.0;
          width = 0.0;
          _controller.reverse();
        });
      },
      child: Container(
        height: 50.0,
        width: 160.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          // border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Stack(
            children: [
              OverflowBox(
                maxHeight: 160.0,
                maxWidth: 160.0,
                child: AnimatedContainer(
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 100),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.circular(200.0),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.titleButton,
                  style: TextStyle(
                    letterSpacing: _animation.value,
                    color: _colorAnimation.value as Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopLeftButton extends StatefulWidget {
  final bool mobilePage;

  TopLeftButton({required this.mobilePage});

  @override
  _TopLeftButtonState createState() => _TopLeftButtonState();
}

class _TopLeftButtonState extends State<TopLeftButton> {
  double height1 = 15.0;
  double width1 = 15.0;
  double height2 = 8.0;
  double width2 = 8.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          height1 = 8.0;
          width1 = 8.0;
          height2 = 15.0;
          width2 = 15.0;
        });
      },
      onExit: (value) {
        setState(() {
          height1 = 15.0;
          width1 = 15.0;
          height2 = 8.0;
          width2 = 8.0;
        });
      },
      child: Container(
        height: widget.mobilePage ? 75 : 130,
        width: widget.mobilePage ? 80 : 130,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: widget.mobilePage ? 40.8 : 65.8,
              left: widget.mobilePage ? 40 : 65,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: height2,
                width: width2,
                color: Colors.black,
                transform: Matrix4.identity()..rotateZ(2.4),
              ),
            ),
            Positioned(
              top: widget.mobilePage ? 41 : 66,
              left: widget.mobilePage ? 36 : 61,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: height1,
                width: width1,
                color: Colors.black,
                transform: Matrix4.identity()..rotateZ(-0.8),
              ),
            ),
            Positioned(
              top: widget.mobilePage ? 38.8 : 63.8,
              left: widget.mobilePage ? 38 : 63,
              child: Container(
                height: 3.0,
                width: 3.0,
                color: Colors.white,
                transform: Matrix4.identity()..rotateZ(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class TopButton extends StatefulWidget {
  late String text;
  late final bool selected;

  TopButton(this.text, this.selected);

  @override
  _TopButtonState createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  double height = 1.0;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        double space = widget.text.length * 7;
        setState(() {
          width = space;
          widget.selected = true;
        });
      },
      onExit: (value) {
        setState(() {
          width = 0.0;
          widget.selected = false;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            widget.text,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: widget.selected
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  fontSize: 12,
                ),
          ).vPadding(5),
          AnimatedContainer(
            margin: EdgeInsets.only(bottom: 8.0),
            duration: Duration(milliseconds: 200),
            curve: Curves.easeOut,
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: widget.selected
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimateSearch extends StatefulWidget {
  @override
  _AnimateSearchState createState() => _AnimateSearchState();
}

class _AnimateSearchState extends State<AnimateSearch>
    with SingleTickerProviderStateMixin {
  late AnimationController _con;
  late TextEditingController _textEditingController;
  int toggle = 0;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: (toggle == 0) ? 48 : 300.0,
      alignment: Alignment(-1.0, 0.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 48.0,
        width: (toggle == 0) ? 48.0 : 300.0,
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: -10.0,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Stack(
          children: [
            // AnimatedPositioned(
            //   duration: Duration(milliseconds: 375),
            //   top: 6.0,
            //   right: 7.0,
            //   curve: Curves.easeOut,
            //   child: AnimatedOpacity(
            //     opacity: (toggle == 0) ? 0.0 : 1.0,
            //     duration: Duration(milliseconds: 200),
            //     child: Container(
            //       padding: EdgeInsets.all(8.0),
            //       decoration: BoxDecoration(
            //         color: Color(0xffF2F3F7),
            //         borderRadius: BorderRadius.circular(30.0),
            //       ),
            //       child: AnimatedBuilder(
            //         child: Icon(
            //           Icons.mic,
            //           size: 20.0,
            //         ),
            //         builder: (context, widget) {
            //           return Transform.rotate(
            //             angle: _con.value * 2.0 * pi,
            //             child: widget,
            //           );
            //         },
            //         animation: _con,
            //       ),
            //     ),
            //   ),
            // ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 375),
              left: (toggle == 0) ? 20.0 : 40.0,
              curve: Curves.easeOut,
              top: 11.0,
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: Duration(milliseconds: 200),
                child: Container(
                  height: 23.0,
                  width: 180.0,
                  child: TextField(
                    controller: _textEditingController,
                    cursorRadius: Radius.circular(10.0),
                    cursorWidth: 2.0,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Search...',
                      labelStyle: TextStyle(
                        color: Color(0xff5B5B5B),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 48,
              width: 48,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                child: IconButton(
                  splashRadius: 19.0,
                  icon: Icon(
                    CupertinoIcons.search,
                    size: 25,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        if (toggle == 0) {
                          toggle = 1;
                          _con.forward();
                        } else {
                          toggle = 0;
                          _textEditingController.clear();
                          _con.reverse();
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final User? user;
  final Color? color;

  CustomAppBar({
    this.height,
    this.user,
    this.color,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          toolbarHeight: preferredSize.height,
          // shape: ContinuousRectangleBorder(
          //   borderRadius: const BorderRadius.all(Radius.circular(18)),
          // ),
          backgroundColor: color,
          automaticallyImplyLeading: false,
          elevation: 0,
          titleSpacing: 0,
          centerTitle: true,
          title: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: context.widthScreen > mediumScreenSize == true
                      ? Text(RESTURANT_NAME,
                              style: GoogleFonts.playfairDisplay(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                          .hPadding(10)
                      : MenuIcon(color: Color(0xffffffff),),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      context.widthScreen < mediumScreenSize
                          ? SvgPicture.asset(
                              'images/logo.svg',
                              height: 50,
                              color: Colors.white,
                            ).center.expanded
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TopButton('HOME', false),
                                SizedBox(
                                  width: 20,
                                ),
                                TopButton('MENU', false),
                                SizedBox(
                                  width: 20,
                                ),
                                TopButton('RESERVATION', false),
                                SizedBox(
                                  width: 20,
                                ),
                                TopButton('GALLERY', false),
                                SizedBox(
                                  width: 20,
                                ),
                                TopButton('CONTACT', false),
                              ],
                            ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (context.widthScreen > mediumScreenSize)
                        Row(
                          children: [
                            user != null
                                ? 'Hi ${user!.firstName}'.toLabel(
                                    color: Colors.white,
                              fontSize: 14
                                  )
                                : 'LOGIN'.toLabel(fontSize: 14),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'images/person(4).svg',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      if (context.widthScreen > smallScreenSize)
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'images/shopping_bag(2).svg',
                            color: Colors.white,
                          ),
                        ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class IconDiscription extends StatelessWidget {
  final String? header;
  final String? image;
  final String title;
  final String discription;
  final Color? colorTitle;
  final Color? colorHeader;
  final Color? colorDiscription;
  final String? buttonTitle;
  final double? titleSize;
  final TextAlign? textAlign;
  final MainAxisAlignment?mainAxisAlignment;
  final CrossAxisAlignment?crossAxisAlignment;

  const IconDiscription({
    Key? key,
    this.image,
    this.header,
    this.titleSize,
    required this.title,
     this.colorDiscription,
     this.colorHeader,
     this.colorTitle,
    required this.discription,
    this.buttonTitle,
    this.textAlign,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment:mainAxisAlignment?? MainAxisAlignment.start,
        crossAxisAlignment:crossAxisAlignment?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null)
            Text(
              header!,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 16,
                    letterSpacing: 2,
                    color:colorHeader?? Theme.of(context).primaryColor,
                  ),
            ),
          if (image != null)
            SvgPicture.asset(
              image!,
              color: Theme.of(context).primaryColor,
              height: 60,
              width: 60,
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: titleSize ?? 16,
                  letterSpacing: 2,
              color: colorTitle??Color(0xff000000),
                ),
          ).vPadding(30),
          Text(
            discription,
            textAlign:textAlign?? TextAlign.center,
            overflow: TextOverflow.clip,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 14, letterSpacing: 1, height: 2,color: colorDiscription??Color(0xff000000),),
          ),
          if (buttonTitle != null)
            HoverAnimation(
              height: 50,
              width: 160,
              thickness: 2,
              milliseconde: 500,
              curve: Curves.easeInOutSine,
              child: Text(
                'BOOK A TABLE',
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ).center,
            ).vPadding(30),
        ],
      ).hPadding(15);
}
