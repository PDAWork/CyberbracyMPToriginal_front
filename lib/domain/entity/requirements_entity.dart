class RequirementsEntity {
  final int idControl;
  final int idRequire;
  final String name;
  final String typeControl;
  final List<ActivityEntity> activities;
  final String responsibility;

  RequirementsEntity({
    required this.idControl,
    required this.idRequire,
    required this.name,
    required this.typeControl,
    required this.activities,
    required this.responsibility,
  });
}

class ActivityEntity {
  final String code;
  final String text;

  ActivityEntity({
    required this.code,
    required this.text,
  });
}
