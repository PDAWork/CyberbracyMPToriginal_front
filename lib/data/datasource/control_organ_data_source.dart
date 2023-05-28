import 'package:cyberbracy_mpt_original_front/data/models/control_organ_head_model.dart';
import 'package:cyberbracy_mpt_original_front/data/models/control_organ_model.dart';
import 'package:cyberbracy_mpt_original_front/data/models/npas_model.dart';
import 'package:cyberbracy_mpt_original_front/data/models/requirement_body_model.dart';
import 'package:cyberbracy_mpt_original_front/data/models/requirements_model.dart';
import 'package:dio/dio.dart';

import '../../core/const/api_endpoints.dart';
import '../models/control_supervisory_organ_model.dart';

abstract class ControlOrganDataSource {
  /// [GET] http://:3077/data/org/list
  /// Получить список КНО
  Future<List<ControlOrganModel>> getAllControlOrgan();

  ///  [GET] http://:3077/data/org/head (lowName)
  ///  Получить главу КНО
  Future<ControlOrganHeadModel?> getAllControlOrganHead(String lowName);

  /// [GET] http://:3077/data/org/typec/list (lowName)
  /// Получить список вид КНО
  Future<List<ControlSupervisoryOrganModel>> getAllControlSupervisoryOrgan(
    String lowName,
  );

  ///  [GET] http://:3077/data/org/requires/list (lowName, idControl)
  ///  Получить список требований
  Future<List<RequirementsModel>> getAllRequirements(
    String lowName,
    int idControl,
  );

  ///  [GET] http://:3077/data/org/npas (lowName)
  ///  Получить НПА организации
  Future<List<NpasModel>> getAllNpas(String lowName);

  /// [GET] http://:3077/data/org/requires/body (lowName, idControl, idRequire)
  /// Получить всю инфу о конкретном требовании
  Future<RequirementBodyModel?> getAllRequirementBody(
    String lowName,
    int idControl,
    int idRequire,
  );
}

class ControlOrganDataSourceImpl implements ControlOrganDataSource {
  final Dio _dio;

  ControlOrganDataSourceImpl(this._dio);

  @override
  Future<List<ControlOrganModel>> getAllControlOrgan() async {
    try {
      final result = await _dio.get(ApiEndpoints.controlOrganAll);
      return (result.data as List)
          .map((e) => ControlOrganModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      return <ControlOrganModel>[];
    }
  }

  @override
  Future<ControlOrganHeadModel?> getAllControlOrganHead(String lowName) async {
    try {
      final result = await _dio.get(ApiEndpoints.controlOrganHead(lowName));
      return ControlOrganHeadModel.fromJson(result.data);
    } on DioError catch (e) {
      return null;
    }
  }

  @override
  Future<List<ControlSupervisoryOrganModel>> getAllControlSupervisoryOrgan(
      String lowName) async {
    try {
      final result =
          await _dio.get(ApiEndpoints.controlSupervisoryOrgan(lowName));
      return (result.data as List)
          .map((e) => ControlSupervisoryOrganModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      return [];
    }
  }

  @override
  Future<List<RequirementsModel>> getAllRequirements(
    String lowName,
    int idControl,
  ) async {
    try {
      final result =
          await _dio.get(ApiEndpoints.requirements(lowName, idControl));
      return (result.data as List)
          .map((e) => RequirementsModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      return [];
    }
  }

  @override
  Future<List<NpasModel>> getAllNpas(String lowName) async {
    try {
      final result = await _dio.get(ApiEndpoints.npas(lowName));
      return (result.data as List).map((e) => NpasModel.fromJson(e)).toList();
    } on DioError catch (e) {
      return [];
    }
  }

  @override
  Future<RequirementBodyModel?> getAllRequirementBody(
    String lowName,
    int idControl,
    int idRequire,
  ) async {
    try {
      final result = await _dio.get(ApiEndpoints.requirementsBody(
        lowName,
        idControl,
        idRequire,
      ));
      return RequirementBodyModel.fromJson(result.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
