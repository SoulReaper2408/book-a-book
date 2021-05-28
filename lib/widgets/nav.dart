import 'package:catalog_app/screens/MyAds.dart';
import 'package:catalog_app/screens/display_page.dart';
import 'package:catalog_app/screens/sell.dart';
import 'package:catalog_app/services/ChatRoomScreen.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';


var tstyle = TextStyle(color: Colors.white.withOpacity(0.6),
    fontSize: 50
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var padding = EdgeInsets.symmetric(horizontal: 18,vertical: 5);
  double gap =10;

  int _index = 0;
  List<Color?> colors = [
    Colors.purple,
    Colors.pink,
    Colors.grey[600],
    Colors.teal
  ];

  final List<Widget> pages = [
    HomePage(),
    AdPage(),
    Seller(),
    Home1(),
  ];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Padding(padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text("Book-a-Book",style: TextStyle(color: Colors.deepOrangeAccent,fontFamily: "Poppins",fontSize: 28,fontWeight: FontWeight.bold),)),


          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: ColorMe.cadetgrey,

          ),
        ),
        drawer: MyDrawer(),
        extendBody: true,

        body:PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: pages,
            onPageChanged: (int index) {
              setState(() {
                controller.jumpToPage(index);
              });
            }),

        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0,25),
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
              child: GNav(
                curve: Curves.easeInQuad,
                duration: Duration(milliseconds: 900),
                tabs: [
                  GButton(
                    gap: gap,
                    icon: LineIcons.home,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    text: 'Home',
                    textColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.heart,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    text: "My Ads",
                    textColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.plusCircle,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    text: 'Sell',
                    textColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: LineIcons.facebookMessenger,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    text: 'Chats',
                    textColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                ],
                onTabChange: (index) {
                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}