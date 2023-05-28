import '../../domain/entity/npas_entity.dart';

class NpasModel extends NpasEntity {
  NpasModel({
    required super.text,
    required super.date,
    required super.fileInfo,
  });

  factory NpasModel.fromJson(Map<String, dynamic> json) {
    return NpasModel(
      text: json['text'],
      date: json['date'],
      fileInfo: json['fileInfo'],
    );
  }
}
