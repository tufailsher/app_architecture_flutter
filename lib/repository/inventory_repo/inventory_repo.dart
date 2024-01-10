import 'package:custody_rx/base/network/error_handler/error_handler.dart';
import 'package:custody_rx/base/network/failure/failure.dart';
import 'package:custody_rx/data/remote/inventory/i_inventory_api.dart';
import 'package:custody_rx/models/inventory/inventory_model.dart';
import 'package:custody_rx/repository/inventory_repo/i_inventory_repo.dart';
import 'package:dartz/dartz.dart';

class InventoryRepo implements IInventoryRepo {
  InventoryRepo({required this.api});
  IInventoryApi api;
  @override
  Future<Either<Failure, InventoryModel>> getInventory(
      Map<String, dynamic> map) async {
    try {
      final result = await api.getInventory(map);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }
}
