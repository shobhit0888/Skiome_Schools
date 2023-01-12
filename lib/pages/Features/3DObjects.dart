import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class Objects_3D extends StatefulWidget {
  const Objects_3D({super.key});

  @override
  State<Objects_3D> createState() => _Objects_3DState();
}

class _Objects_3DState extends State<Objects_3D> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(
        title: "Subjects".text.color(Colors.white).xl.make(),
        backgroundColor: Colors.transparent,
        elevation: 10,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
            children: [
              Card(
                elevation: 50,
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/3D_image.jpg',
                      width: 100,
                      height: 120,
                    ),
                    ListTile(
                      title: Text(
                        "Physics",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/3D_image.jpg',
                      width: 100,
                      height: 120,
                    ),
                    ListTile(
                      title: Text(
                        "Chemistry",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/3D_image.jpg',
                      width: 100,
                      height: 120,
                    ),
                    ListTile(
                      title: Text(
                        "Math",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/3D_image.jpg',
                      width: 100,
                      height: 120,
                    ),
                    ListTile(
                      title: Text(
                        "Biology",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/3D_image.jpg',
                      width: 100,
                      height: 120,
                    ),
                    ListTile(
                      title: Text(
                        "History",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/3D_image.jpg',
                      width: 100,
                      height: 120,
                    ),
                    ListTile(
                      title: Text(
                        "Geography",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//     );
//   }
// }
