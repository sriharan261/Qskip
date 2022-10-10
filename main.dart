import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_search_bar/expandable_search_bar.dart';
import 'package:free2go/account.dart';
import 'package:free2go/cart.dart';
import 'package:free2go/checklist.dart';
import 'qr_scanner.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Free2Go",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController = TextEditingController();

  final int currentIndex = 0;
  static const screens = [
    Expanded(
      child: Text("hello"),
    ),
    Expanded(
      child: Text("h"),
    ),
    Expanded(
      child: Text("e"),
    ),
    Expanded(
      child: Text("l"),
    ),
    Expanded(
      child: Text("l"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Free2Go",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontFamily: 'Sans-Serif', fontSize: 30),
        ),
        // leading: IconButton(
        //   onPressed: null,
        //   icon: Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: AnimSearchBar(
              width: 400,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Scanner()));
            },
            label: Text(
              "Scan and Pay",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal),
            ),
            backgroundColor: Colors.green[900],
            hoverColor: Colors.white,
            icon: Icon(
              Icons.qr_code_outlined,
              size: 30.0,
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Text(
                  "Deals for you",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 500,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Text(
                              'text $i',
                              style: TextStyle(
                                fontSize: 16.0,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: FloatingActionButton(child: Icon(Icons.home),onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
              ),
              Expanded(
                child: FloatingActionButton(child: Icon(Icons.checklist),onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Checklist()));
                }),
              ),
              Expanded(
                child: FloatingActionButton(child: Icon(Icons.qr_code_outlined),onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Scanner()));
                }),
              ),
              Expanded(
                child: FloatingActionButton(child: Icon(Icons.shopping_cart),onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                }),
              ),
              Expanded(child: FloatingActionButton(child: Icon(Icons.person),onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Account()));
              }))
            ],
          ))
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(top: 100.0),
      //   child: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     elevation: 8,
      //     selectedItemColor: Colors.white,
      //     selectedIconTheme: IconThemeData(color: Colors.white, size: 40),
      //     backgroundColor: Colors.green[900],
      //     iconSize: 30.0,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: "",
      //
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.checklist,
      //         ),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.qr_code_outlined),
      //         label: '',
      //
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: '',
      //
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.audio_file),
              title: Text("Categories"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            )
          ],
        ),
      ),
    );
  }
}
