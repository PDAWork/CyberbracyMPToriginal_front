class ControlOrganHeadEntity {
  /// ФИО начальник органа контроля
  final String fio;

  /// Занимающий пост
  final String post;

  /// Описание органа контроля
  final String description;

  /// Список общей информации
  final List<CommonInfoEntity> commonInfoList;

  /// Картинка начальника
  final String urlImage;

  ControlOrganHeadEntity({
    required this.fio,
    required this.post,
    required this.description,
    required this.commonInfoList,
    required this.urlImage,
  });

  factory ControlOrganHeadEntity.empty() {
    return ControlOrganHeadEntity(
      fio: 'fio',
      post: 'post',
      description: 'description',
      commonInfoList: [],
      urlImage: 'urlImage',
    );
  }
}

class CommonInfoEntity {
  final String caption;
  final String item;

  CommonInfoEntity({
    required this.caption,
    required this.item,
  });
}
