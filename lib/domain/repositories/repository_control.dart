import 'package:cyberbracy_mpt_original_front/domain/entity/control_supervisory_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/npas_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';

import '../entity/control_organ_entity.dart';
import '../entity/control_organ_head_entity.dart';
import '../entity/requirement_body_entity.dart';

abstract class RepositoryControl {
  /// Получить список органов контроля
  Future<((bool, String), List<ControlOrganEntity>)> controlOrganAll();

  /// Получить информацию о органе контроля
  Future<ControlOrganHeadEntity?> controlOrganHead(String lowName);

  /// Получить список контрольно-надзорного органа
  Future<List<ControlSupervisoryOrganEntity>> controlSupervisoryOrganAll(
    String lowName,
  );

  /// Получить список требований
  Future<List<RequirementsEntity>> requirementsAll(
    String lowName,
    int idControl,
  );

  /// Получить список НПА организации
  Future<List<NpasEntity>> npasAll(String lowName);

  Future<RequirementBodyEntity?> requirementBodyEntityAll(
    String lowName,
    int idControl,
    int idRequire,
  );
}
