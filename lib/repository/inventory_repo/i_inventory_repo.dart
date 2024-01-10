import 'package:custody_rx/base/network/failure/failure.dart';
import 'package:custody_rx/models/inventory/inventory_model.dart';
import 'package:dartz/dartz.dart';

abstract class IInventoryRepo {
  Future<Either<Failure, InventoryModel>> getInventory(Map<String, dynamic> map);
  // Future<Either<Failure, NoParams>> forgotPassword(String email);
  // Future<Either<Failure, LoginUserModel>> changePassword(String email);
  // Future<Either<Failure, LoginUserModel>> verifyOtp(VerifyOTPEntity entity);
}