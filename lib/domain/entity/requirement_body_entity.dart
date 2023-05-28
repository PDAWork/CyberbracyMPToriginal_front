import 'npas_entity.dart';
import 'requirements_entity.dart';

class RequirementBodyEntity {
  final String requireName;
  final String typeOfDeyatelnostSubjectControl;
  final String typeControl;
  final String knoTitle;
  final String lifetimeDocuments;
  final String checkMethod;
  final String fileLink;
  final String organ;
  final String punishType;

  final List<NpasEntity> npasList;
  final List<ActivityEntity> activityList;
  final PunishmentsEntity punishmentsEntity;

  RequirementBodyEntity({
    required this.requireName,
    required this.typeOfDeyatelnostSubjectControl,
    required this.typeControl,
    required this.knoTitle,
    required this.lifetimeDocuments,
    required this.checkMethod,
    required this.fileLink,
    required this.organ,
    required this.punishType,
    required this.npasList,
    required this.activityList,
    required this.punishmentsEntity,
  });
}

class PunishmentsEntity {
  final String right;
  final List<ViolationsEntity> violationsList;

  PunishmentsEntity({
    required this.right,
    required this.violationsList,
  });
}

class ViolationsEntity {
  final String type;
  final List<ItemEntity> items;

  ViolationsEntity({
    required this.type,
    required this.items,
  });
}

class ItemEntity {
  final String header;
  final String amount;
  final String vidNormy;

  ItemEntity({
    required this.header,
    required this.amount,
    required this.vidNormy,
  });
}
