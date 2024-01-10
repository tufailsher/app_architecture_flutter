import 'package:flutter/material.dart';

@immutable
abstract class InventoryEvent {}

class InventoryFetchDataEvent extends InventoryEvent {
  final Map<String, dynamic> inventory;
 
  InventoryFetchDataEvent(this.inventory);
}
