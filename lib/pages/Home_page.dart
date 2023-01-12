import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skiome/models/cart.dart';
import 'package:skiome/pages/Features/3DObjects.dart';
import 'package:skiome/pages/Features/Clubs.dart';
import 'package:skiome/pages/Features/Experiments.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/skim.dart';
import '../utils/routes.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/add_to_cart.dart';
import '../widgets/home_widgets/skim_header.dart';
import '../widgets/home_widgets/skim_image.dart';
import '../widgets/home_widgets/skim_list.dart';
import 'Home_details.dart';

class HomePage extends StatefulWidget {
  @override
  // late User user;
  // HomePage(this.user);
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  bool load = false;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  // final url="http"
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    loadData();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        User loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    // final response = await http.get(Uri.parse(url));
    // final skimJson = response.body;
    final skimJson = await rootBundle.loadString("assets/files/Skim.json");
    final decodeData = jsonDecode(skimJson);
    var productsData = decodeData["products"];
    SkimModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {
      load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummylist = List.generate(10, (index) => SkimModel.items[0]);
    return Scaffold(
      // appBar: AppBar(
      // title: "Skiome".text.make(),
      // backgroundColor: Colors.purple[300],

      // actions: [IconButton(onPressed: null, icon: Icon(Icons.search))],
      // ),
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _, _HomePageState) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          // ignore: deprecated_member_use
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.amber400,
            size: 20,
            count: _cart.items.length,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Visibility(
          visible: load,
          child: ListView(
            shrinkWrap: true,

            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: "Skiome".text.color(Colors.white).make(),
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(onPressed: null, icon: Icon(Icons.search))
                ],
              ),
              SkimHeader(),
              CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/3D_image.jpg"),
                            fit: BoxFit.cover,
                          )),
                    )
                  ],
                  options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 180,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8)),
              // if (SkimModel.items != null && SkimModel.items.isNotEmpty)
              //   Container(child: SkimList().py16().expand())
              // else
              //   CircularProgressIndicator().centered().expand(),
              // ListView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: SkimModel.items.length,
              //     itemBuilder: ((context, index) {
              // final skim = SkimModel.items[index];
              //       return InkWell(
              //           onTap: () => Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => HomeDetailPage(
              //                         skim: skim,
              //                         index: index,
              //                       ))),
              //           child: SkimItem(skim: skim));
              //     })),
              Card(
                elevation: 60,
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Objects_3D())),
                      leading: Image.asset(
                        width: 150,
                        height: 250,
                        'assets/images/3D_image.jpg',
                      ),
                      title: Text(
                        "3D Objects",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "3D objects of all subjects and vast category of concepts",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 40,
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Experiments())),
                      leading: Image.asset(
                        'assets/images/experiment_image.jpeg',
                        width: 150,
                        height: 150,
                      ),
                      title: Text(
                        "Experiments",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Experiments(especially designed ) from basic to advanced   level.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 40,
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      leading: Image.asset(
                        'assets/images/club_image.jpg',
                        width: 150,
                        height: 150,
                      ),
                      title: Text(
                        "Clubs",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Info of Active clubs in the school and their status",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Card(
              //   child: ListTile(
              //     leading: Image.asset("assets/images/3D_image.jpg"),
              // onTap: () =>Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => Objects_3D())),

              //   ),
              // ),
              // InkWell(
              //   onTap: () => Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => Objects_3D())),
              //   child: SkimItem(skim: SkimModel.items[0]),
              // ),
              // InkWell(
              //   onTap: () => Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => Experiments())),
              //   child: SkimItem(skim: SkimModel.items[1]),
              // ),
              // InkWell(
              //   onTap: () => Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => Clubs())),
              //   child: SkimItem(skim: SkimModel.items[2]),
              // ),
            ],
          ),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
