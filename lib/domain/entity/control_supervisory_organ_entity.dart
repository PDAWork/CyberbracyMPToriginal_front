class ControlSupervisoryOrganEntity {
  /// Номер требования
  final int idTypeControl;

  /// Название
  final String name;

  /// Количество требований
  final int count;

  ControlSupervisoryOrganEntity({
    required this.idTypeControl,
    required this.name,
    required this.count,
  });

  factory ControlSupervisoryOrganEntity.empty() {
    return ControlSupervisoryOrganEntity(
      idTypeControl: 0,
      name: '',
      count: 0,
    );
  }
}
