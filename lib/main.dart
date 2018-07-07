import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new app()));

class app extends StatefulWidget {
  @override
  _appState createState() => new _appState();
}

class _appState extends State<app> {
  PageController pageController;
  Widget leftIcon;
  Widget rightIcon;

  List<Widget> leftrightButtons;

  var pages = <Widget>[
    Container(
      color: Colors.tealAccent,
      child: Center(
        child: Text(
          "Welcome !",
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    ),
    Container(
      color: Colors.pinkAccent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "This is a simple walkthrough Example",
            style: TextStyle(fontSize: 40.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
    Container(
      color: Colors.deepOrangeAccent,
      child: Center(
        child: Text(
          "Using PageView",
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    ),
    Container(
      color: Colors.amberAccent,
      child: Center(
        child: Text(
          "And two FABs",
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    ),
  ];
  @override
  void initState() {
    super.initState();

    leftIcon = FloatingActionButton(
      onPressed: previouspage,
      child: Icon(Icons.arrow_left),
    );
    rightIcon = FloatingActionButton(
      onPressed: nextpage,
      child: Icon(Icons.arrow_right),
    );
    leftrightButtons = [SizedBox(), rightIcon];
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  nextpage() {
    pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
  }

  previouspage() {
    pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: leftrightButtons,
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          print(pages.length);
          print(pages.length);
          if (index == 0) {
            setState(() {
              leftrightButtons = [SizedBox(), rightIcon];
            });
          } else if (index == pages.length - 1) {
            setState(() {
              leftrightButtons = [
                leftIcon,
                FlatButton.icon(
                    onPressed: () {}, icon: Icon(Icons.get_app), label: Text("Get Started"))
              ];
            });
          } else if (index != 0 && index != pages.length - 1) {
            setState(() {
              leftrightButtons = [leftIcon, rightIcon];
            });
          }
        },
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: pages,
      ),
    );
  }
}
