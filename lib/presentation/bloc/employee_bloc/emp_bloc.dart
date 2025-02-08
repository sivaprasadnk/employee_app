import 'package:employee_app/core/locator.dart';
import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/domain/use_cases/add_update_employee.dart';
import 'package:employee_app/domain/use_cases/delete_employee.dart';
import 'package:employee_app/main.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_event.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmpBloc extends Bloc<EmpEvent, EmpState> {
  EmpBloc() : super(EmpState()) {
    on(onAddEmployee);
    on(onGetEmployees);
    on(onUpdateEmployee);
    on(onRemoveEmployee);
  }

  onAddEmployee(AddEmployeeEvent event, Emitter<EmpState> emit) async {
    var newList = [
      ...state.employeesList ?? <EmployeeModel>[],
      event.employeeModel,
    ];
    await locator<AddOrUpdateEmployee>().call(event.employeeModel);
    emit(state.copyWith(list: newList));
  }

  onGetEmployees(GetEmployeesEvent event, Emitter<EmpState> emit) {
    state.copyWith(loading: true);
    var newList = objectbox.store.box<EmployeeModel>().getAll();
    emit(state.copyWith(list: newList, loading: false));
  }

  onUpdateEmployee(UpdateEmployeeEvent event, Emitter<EmpState> emit) async {
    await locator<AddOrUpdateEmployee>().call(event.employeeModel);

    var list = state.employeesList ?? [];
    var employeeIndex =
        list.indexWhere((employee) => employee.id == event.employeeModel.id);
    list[employeeIndex] = event.employeeModel;
    emit(state.copyWith(list: list));
  }

  onRemoveEmployee(RemoveEmployeeEvent event, Emitter<EmpState> emit) async {
    await locator<DeleteEmployee>().call(event.employeeModel);
    var list = state.employeesList!;
    list.removeWhere((element) => element.id == event.employeeModel.id);
    emit(state.copyWith(list: list));
  }
}
