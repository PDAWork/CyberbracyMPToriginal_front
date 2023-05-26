import 'package:cyberbracy_mpt_original_front/data/datasource/control_organ_data_source.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_entity.dart';

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
}
