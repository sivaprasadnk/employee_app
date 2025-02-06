import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;
  late final Box<EmployeeModel> _employeeBox;

  ObjectBox._create(this.store) {
    _employeeBox = Box<EmployeeModel>(store);
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "employee-db"));
    return ObjectBox._create(store);
  }
}
