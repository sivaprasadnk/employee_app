// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/models/employee_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 4263286284168177428),
      name: 'EmployeeModel',
      lastPropertyId: const obx_int.IdUid(5, 6190104373222284541),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 5780704214551953501),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8800822332222957196),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 79414614531127898),
            name: 'role',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 1323749280056577043),
            name: 'startDate',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 6190104373222284541),
            name: 'endDate',
            type: 10,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 4263286284168177428),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    EmployeeModel: obx_int.EntityDefinition<EmployeeModel>(
        model: _entities[0],
        toOneRelations: (EmployeeModel object) => [],
        toManyRelations: (EmployeeModel object) => {},
        getId: (EmployeeModel object) => object.id,
        setId: (EmployeeModel object, int id) {
          object.id = id;
        },
        objectToFB: (EmployeeModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final roleOffset = fbb.writeString(object.role);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, roleOffset);
          fbb.addInt64(3, object.startDate.millisecondsSinceEpoch);
          fbb.addInt64(4, object.endDate?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final endDateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final endDateParam = endDateValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(endDateValue);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final roleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final startDateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          final object = EmployeeModel(
              id: idParam,
              endDate: endDateParam,
              name: nameParam,
              role: roleParam,
              startDate: startDateParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [EmployeeModel] entity fields to define ObjectBox queries.
class EmployeeModel_ {
  /// See [EmployeeModel.id].
  static final id =
      obx.QueryIntegerProperty<EmployeeModel>(_entities[0].properties[0]);

  /// See [EmployeeModel.name].
  static final name =
      obx.QueryStringProperty<EmployeeModel>(_entities[0].properties[1]);

  /// See [EmployeeModel.role].
  static final role =
      obx.QueryStringProperty<EmployeeModel>(_entities[0].properties[2]);

  /// See [EmployeeModel.startDate].
  static final startDate =
      obx.QueryDateProperty<EmployeeModel>(_entities[0].properties[3]);

  /// See [EmployeeModel.endDate].
  static final endDate =
      obx.QueryDateProperty<EmployeeModel>(_entities[0].properties[4]);
}
