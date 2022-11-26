import 'package:skiome/models/skim.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  late SkimModel _skim;
  final List<int> _itemIds = [];
  SkimModel get skim => _skim;
  set skim(SkimModel newSkim) {
    assert(newSkim != null);
    _skim = newSkim;
  }

  List<Item> get items => _itemIds.map((id) => _skim.getById(id)).toList();
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
