import 'dart:async';
import 'package:custody_rx/base/network/error_handler/error_handler.dart';
import 'package:custody_rx/base/usecases/inventory_usecase.dart/inventory_usecase.dart';
import 'package:custody_rx/bloc/inventory_bloc/inventory_events.dart';
import 'package:custody_rx/bloc/inventory_bloc/inventory_states.dart';
import 'package:custody_rx/di.dart';
import 'package:custody_rx/domain/entities/inventory/inventory_entity.dart';
import 'package:custody_rx/repository/inventory_repo/i_inventory_repo.dart';
import 'package:custody_rx/utils/toast/custom_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  //News repo instance
  late final IInventoryRepo inventoryRepo;

  InventoryBloc() : super(InventoryInitial()) {
    inventoryRepo = inject<IInventoryRepo>();

    on<InventoryFetchDataEvent>(_fetchInventory);
  }
  FutureOr<void> _fetchInventory(
      InventoryEvent event, Emitter<InventoryState> emit) async {
    InventoryUsecase inventoryUsecase = InventoryUsecase(inventoryRepo);
    if (event is InventoryFetchDataEvent) {
      emit(InventoryPageLoading());
      InventoryEntity inventoryEntity = InventoryEntity();
      final userRes = await inventoryUsecase(inventoryEntity);
      userRes.fold((l) {
        SectionToast.show(ErrorMessage.fromError(l).message);
        emit(InventoryPageError(ErrorMessage.fromError(l).message!));
      }, (res) {
        SectionToast.show(res.msg);
        emit(InventoryPageLoaded(res));
      });
    }
  }
}
