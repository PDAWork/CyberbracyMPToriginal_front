import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_head_entity.dart';

class ControlOrganHeadModel extends ControlOrganHeadEntity {
  ControlOrganHeadModel({
    required super.fio,
    required super.post,
    required super.description,
    required super.commonInfoList,
    required super.urlImage,
  });

  factory ControlOrganHeadModel.fromJson(Map<String, dynamic> json) {
    return ControlOrganHeadModel(
      fio: json['fio'],
      post: json['pos'],
      description: json['act'],
      urlImage: json['imageUrl'],
      commonInfoList: (json['commonInfo'] as List)
          .map((e) => CommonInfoModel.fromJson(e))
          .toList(),
    );
  }
}

class CommonInfoModel extends CommonInfoEntity {
  CommonInfoModel({required super.caption, required super.item});

  factory CommonInfoModel.fromJson(Map<String, dynamic> json) {
    final String result =
        (json['items'] as List).map((e) => e.toString()).toList().first;

    return CommonInfoModel(
      caption: json['caption'],
      item: json['caption'] == 'График работы'
          ? result.length - result.replaceAll('\n', '').length <= 7
              ? result.replaceFirst('\n', '')
              : result
                  .replaceAllMapped(
                      RegExp(r'(\n.*)\n'), (match) => "${match.group(1)!} ")
                  .replaceFirst('\n', '')
          : result.replaceFirst('\n', ''),
    );
  }
}
