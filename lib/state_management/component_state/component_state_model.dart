import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/state_management/dark_light_mode_switch/dark_light_mode_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponentStateModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DarkLightModeSwitch component.
  late DarkLightModeSwitchModel darkLightModeSwitchModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    darkLightModeSwitchModel =
        createModel(context, () => DarkLightModeSwitchModel());
  }

  void dispose() {
    unfocusNode.dispose();
    darkLightModeSwitchModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
