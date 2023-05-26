import '../entity/control_organ_entity.dart';

abstract class RepositoryControl {

  /// Получить список органов контроля
  Future<((bool, String), List<ControlOrganEntity>)> controlOrganAll();

}
