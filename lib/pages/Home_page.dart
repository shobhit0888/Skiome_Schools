import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skiome/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/skim.dart';
import '../utils/routes.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/skim_header.dart';
import '../widgets/home_widgets/skim_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;

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
    await Future.delayed(Duration(seconds: 2));
    // final response = await http.get(Uri.parse(url));
    // final skimJson = response.body;
    final skimJson = await rootBundle.loadString("assets/files/Skim.json");
    final decodeData = jsonDecode(skimJson);
    var productsData = decodeData["products"];
    SkimModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummylist = List.generate(10, (index) => SkimModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: "Skiome".text.make(),
        backgroundColor: Colors.purple[300],
        // leading: IconButton(
        //   onPressed: () => MyDrawer,
        //   icon: Icon(Icons.menu),
        //   tooltip: 'Navigation bar',
        // ),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.search))],
      ),
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
        child: Container(
          // child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              if (SkimModel.items != null && SkimModel.items.isNotEmpty)
                SkimList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
          // ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
