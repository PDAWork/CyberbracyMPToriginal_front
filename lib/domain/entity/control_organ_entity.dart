class ControlOrganEntity {
  /// Название контрольного органа
  final String name;

  /// Краткая аббревиатура
  final String lowName;

  /// Количество контрольно надзорных органов
  final int typeControl;

  /// Количество требований у контролько надзорных органов в общем
  final int requirements;

  ///  Количество нормативных актов
  final int npas;

  ControlOrganEntity(
      {required this.name,
      required this.lowName,
      required this.typeControl,
      required this.requirements,
      required this.npas});
}
