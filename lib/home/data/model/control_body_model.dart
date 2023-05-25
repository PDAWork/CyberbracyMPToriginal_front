class ControlBodyModel {
  final String name;
  final String lowName;
  final int typeControl;
  final int requirements;
  final int npas;

  ControlBodyModel(
      {required this.name,
      required this.lowName,
      required this.typeControl,
      required this.requirements,
      required this.npas});

  factory ControlBodyModel.fromJson(Map<String, dynamic> json) {
    return ControlBodyModel(
      name: json['name'],
      lowName: json['lowName'],
      typeControl: json['typeControls'],
      requirements: json['requirements'],
      npas: json['npas'],
    );
  }
}
