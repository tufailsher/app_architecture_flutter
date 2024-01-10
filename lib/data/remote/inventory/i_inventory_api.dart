import 'package:custody_rx/models/inventory/inventory_model.dart';

abstract class IInventoryApi{
  Future<InventoryModel> getInventory(Map<String, dynamic> map);
}