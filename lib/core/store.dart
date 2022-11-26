import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/skim.dart';

class MyStore extends VxStore {
  late SkimModel skim;
  late CartModel cart;
  MyStore()
   {
    skim = SkimModel();
    cart = CartModel();
    cart.skim = skim;
  }
}
