import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:skiome/models/3D_Models/Physics_Models/Optics3D.dart';
import 'package:skiome/widgets/3D_Objects_widget/optics_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class Physics3D extends StatefulWidget {
  const Physics3D({super.key});

  @override
  State<Physics3D> createState() => _Physics3DState();
}

class _Physics3DState extends State<Physics3D> {
  // Map<String, dynamic> get map => null;
  late List<dynamic> opj;
  // late List<Optics> list;
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final Phycis3DJson = await rootBundle
        .loadString("assets/files/3D_Objects_names/Physics3D.json");
    final decodedData = jsonDecode(Phycis3DJson);
    List opticsData = decodedData["Physics"];
    opticsData.forEach((element) {
      Map obj = element;
      opj = obj["Optics"];
      OpticsModel.optics =
          List.from(opj).map<Optics>((optic) => Optics.fromMap(optic)).toList();
      // List.from(opj).map<Optics>((optic) => Optics.fromMap(map)).toList as List<Optics>;
      print(opj);

      // print(obj);
    });
    // var op = opticsData[0];
    // print(op);
  }

  // loadData() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   // final response = await http.get(Uri.parse(url));
  //   // final skimJson = response.body;
  //   final skimJson = await rootBundle.loadString("assets/files/Skim.json");
  // final decodeData = jsonDecode(skimJson);
  //   var productsData = decodeData["products"];
  //   SkimModel.items = List.from(productsData)
  //       .map<Item>((item) => Item.fromMap(item))
  //       .toList();
  //   setState(() {
  //     load = true;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Physics Objects".text.color(Colors.white).xl2.bold.make(),
        backgroundColor: Colors.transparent,
        elevation: 10,
      ),
      body: SafeArea(
        child: ListView(shrinkWrap: true, children: [
          "Optics".text.make(),
          // Column(
          //   children: [
          //     "Optics".text.xl.bold.make(),
          //     Divider(
          //       color: Colors.white,
          //     ),
          //     SizedBox(
          //       height: 15,
          //     ),
          //   ],
          // ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: OpticsModel.optics.length,
              itemBuilder: (context, index) {
                final op = OpticsModel.optics[index];
                return InkWell(
                  child: ObjectList(op: op),
                );
              })
        ]),
      ),
    );
  }
}
