
import 'package:custody_rx/models/inventory/inventory_model.dart';

import 'package:flutter/material.dart';

@immutable
abstract class InventoryState {}
//This is innitial state of bloc
class InventoryInitial extends InventoryState {}
//This is the loading state of bloc
class InventoryPageLoading extends InventoryState {}
//This is the success state of bloc
class InventoryPageLoaded extends InventoryState {
  late final InventoryModel data;
  InventoryPageLoaded(this.data);
}
//This is the error state of bloc
class InventoryPageError extends InventoryState {
  late final String errorMessage;
  InventoryPageError(this.errorMessage);
}

// class PasswordVisibilityToggled extends InventoryState {
//   final bool isPasswordVisible;

//   PasswordVisibilityToggled(this.isPasswordVisible);
// }


