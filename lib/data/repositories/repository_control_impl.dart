import 'package:cyberbracy_mpt_original_front/data/datasource/control_organ_data_source.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/control_supervisory_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirement_body_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';

import '../../domain/entity/control_organ_head_entity.dart';
import '../../domain/entity/npas_entity.dart';
import '../../domain/repositories/repository_control.dart';

class RepositoryControlImpl implements RepositoryControl {
  final ControlOrganDataSource _dataSource;

  RepositoryControlImpl(this._dataSource);

  @override
  Future<((bool, String), List<ControlOrganEntity>)> controlOrganAll() async {
    final list = await _dataSource.getAllControlOrgan();
    if (list.isEmpty) {
      return ((false, 'Ошибка'), list);
    }
    return ((true, ''), list);
  }

  @override
  Future<ControlOrganHeadEntity?> controlOrganHead(String lowName) async {
    final result = await _dataSource.getAllControlOrganHead(lowName);
    return result;
  }

  @override
  Future<List<ControlSupervisoryOrganEntity>> controlSupervisoryOrganAll(
    String lowName,
  ) async {
    final result = await _dataSource.getAllControlSupervisoryOrgan(lowName);
    return result;
  }

  @override
  Future<List<RequirementsEntity>> requirementsAll(
          String lowName, int idControl) async =>
      await _dataSource.getAllRequirements(lowName, idControl);

  @override
  Future<List<NpasEntity>> npasAll(String lowName) async {
    return await _dataSource.getAllNpas(lowName);
  }

  @override
  Future<RequirementBodyEntity?> requirementBodyEntityAll(
    String lowName,
    int idControl,
    int idRequire,
  ) async {
    final result = await _dataSource.getAllRequirementBody(
      lowName,
      idControl,
      idRequire,
    );
    return result;
  }
}
