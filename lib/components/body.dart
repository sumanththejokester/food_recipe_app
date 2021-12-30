import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/splash_content.dart';
import 'package:food_recipe_app/constants.dart';
import 'package:food_recipe_app/screens/splash/signIn/sign_in.dart';
import 'package:food_recipe_app/sizeConfig.dart';

import 'default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentpage = 0;
  List<Map<String, String>> splashData = [
    {'text': 'welcome to app', 'image': 'assets/images/splash_demo1.png'},
    {'text': 'we will help you', 'image': 'assets/images/splash_demo2.png'},
    {'text': 'we show the easy way', 'image': 'assets/images/splash_demo3.png'}
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentpage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]['image'],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getproportionalScreenwidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => BuildDot(index),
                      ),
                    ),
                    Spacer(flex: 3,),
                    defaultButton(
                      text: 'Continue',
                      press: (){
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer BuildDot(int? index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentpage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentpage == index ? kPrimaryColor : Color(0xFFCE93D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
