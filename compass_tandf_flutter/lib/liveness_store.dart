import 'package:compass_tandf_flutter/liveness_state.dart';
import 'package:cs_liveness_flutter/cs_liveness_exceptions.dart';
import 'package:cs_liveness_flutter/cs_liveness_flutter.dart';
import 'package:flutter/material.dart';

class LivenessStore extends ValueNotifier<LivenessState> {
  static const String clientId = "Client ID";
  static const String clientSecret = "Client Secret";

  final _csLiveness = CsLiveness(
      clientId: clientId,
      clientSecret: clientSecret,
      vocalGuidance: true,
      identifierId:
          "SEU IDENTIFIER ID, CAMPO GERADO PELA EMPRESA DE VOCES PARA IDENTIFICAÇÃO NOS LOGS",
      cpf:
          "CPF do usuário, como combinado iremos trabalhar para ser um documento, seja CNPJ ou passaporte");

  LivenessStore() : super(LivenessInitialState());

  Future<void> start() async {
    value = LivenessLoadingState(true);
    try {
      final result = await _csLiveness.start();
      value = LivenessSuccessState(result);
    } on CSLivenessCancelByUserException catch (e) {
      value = LivenessErrorState("Usuário cancelou a ação.");
    } catch (e) {
      value = LivenessErrorState(e.toString());
    }
  }

  void clean() {
    value = LivenessInitialState();
  }
}
