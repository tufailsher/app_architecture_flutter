import 'package:custody_rx/base/network/failure/failure.dart';
import 'package:custody_rx/base/usecases/usecase.dart';
import 'package:custody_rx/domain/entities/inventory/inventory_entity.dart';
import 'package:custody_rx/models/inventory/inventory_model.dart';
import 'package:custody_rx/repository/inventory_repo/i_inventory_repo.dart';
import 'package:dartz/dartz.dart';

class InventoryUsecase implements UseCase<InventoryModel, InventoryEntity> {
  InventoryUsecase(this.repository);
  final IInventoryRepo repository;

  @override
  Future<Either<Failure, InventoryModel>> call(InventoryEntity params) async {
    return repository.getInventory(params.toJson());
  }
}
