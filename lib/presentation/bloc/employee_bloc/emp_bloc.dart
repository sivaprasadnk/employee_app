import 'package:employee_app/core/locator.dart';
import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/domain/use_cases/add_update_employee.dart';
import 'package:employee_app/domain/use_cases/delete_employee.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_event.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmpBloc extends Bloc<EmpEvent, EmpState> {
  EmpBloc() : super(EmpState()) {
    on(onAddEmployee);
    on(onGetEmployees);
    on(onUpdateEmployee);
    on(onRemoveEmployee);
    on(onUndoRemoveEmployee);
  }

  onAddEmployee(AddEmployeeEvent event, Emitter<EmpState> emit) async {
    event.employeeModel.id = (state.employeesList ?? []).length;
    var newList = [
      ...state.employeesList ?? <EmployeeModel>[],
      event.employeeModel,
    ];
    await locator<AddOrUpdateEmployee>().call(event.employeeModel);
    emit(state.copyWith(list: newList));
  }

  onGetEmployees(GetEmployeesEvent event, Emitter<EmpState> emit) {
    state.copyWith(loading: true);

    emit(state.copyWith(list: [], loading: false));
  }

  onUpdateEmployee(UpdateEmployeeEvent event, Emitter<EmpState> emit) async {
    var list = state.employeesList ?? [];
debugPrint("emp id ${event.employeeModel.id}");

    var employeeIndex =
        list.indexWhere((employee) => employee.id == event.employeeModel.id);
    await locator<AddOrUpdateEmployee>().call(event.employeeModel);
debugPrint("employeeIndex $employeeIndex");
    list[employeeIndex] = event.employeeModel;
    emit(state.copyWith(list: list));
  }

  onRemoveEmployee(RemoveEmployeeEvent event, Emitter<EmpState> emit) async {
    await locator<DeleteEmployee>().call(event.employeeModel);
    var list = state.employeesList!;
    if (list.length == 1) {
      emit(state.copyWith(loading: true));
    }
    list.removeWhere((element) => element.id == event.employeeModel.id);
    emit(state.copyWith(list: list, loading: false));
  }

  onUndoRemoveEmployee(
    UndoRemoveEmployeeEvent event,
    Emitter<EmpState> emit,
  ) async {
    var list = event.prevList;
    var itemsBefore = list.sublist(0, event.index);
    event.employeeModel.orderIndex = event.index;
    var itemsAfter = list.sublist(event.index);
    var newList = [...itemsBefore, event.employeeModel, ...itemsAfter];
    emit(state.copyWith(list: newList));
    await locator<AddOrUpdateEmployee>().call(event.employeeModel);

  }
}
