import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF4454DE),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  topHeader(),
                  welcomeCard(),
                  dynamicNote(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Text(
                      "Today Goals",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Text("All tasks"),
                  ),
                  tasks(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            size: 33,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "Hey Harsh,",
            style: TextStyle(fontSize: 24, fontFamily: 'Recoleta'),
          ),
          Spacer(),
          Icon(
            Icons.accessibility,
            size: 27,
          ),
          SizedBox(
            width: 20,
          ),
          FlutterLogo(
            size: 30,
          )
        ],
      ),
    );
  }

  Widget welcomeCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff606eea),
              Color(0xff2130b4),
            ],
          ),
        ),
        height: 200,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text("Quote"),
                  Spacer(),
                  Text("May 01"),
                ],
              ),
            ),
            Expanded(
              child: Text("Check my climb"),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        AutoSizeText("2300"),
                        AutoSizeText("Total Yugen hours"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        AutoSizeText("2300"),
                        AutoSizeText("Total Yugen hours"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        AutoSizeText("2300"),
                        AutoSizeText("Total Yugen hours"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dynamicNote() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFF2E3DF),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        height: 75,
      ),
    );
  }

  Widget tasks() {
    return Container();
  }
}
