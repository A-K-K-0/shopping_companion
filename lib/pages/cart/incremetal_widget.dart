import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class IncrementalWidget extends StatelessWidget {
  Stream<int> btnSream;
  Function(bool)? onUpdate;

  IncrementalWidget(this.btnSream, {this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryBackground)),
      child: StreamBuilder<int>(
        builder: (context, snapshot) {
          return Row(
            children: [
              buildButton(
                  Icon(
                    Icons.remove_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20,
                  ), () {
                onUpdate?.call(false);
              }),
              Text("${snapshot.data}"),
              buildButton(
                  Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20,
                  ), () {
                onUpdate?.call(true);
              })
            ],
          );
        },
        initialData: 1,
        stream: btnSream,
      ),
    );
  }

  Widget buildButton(Icon icon, Function() onUpdate) {
    return IconButton(onPressed: onUpdate, icon: icon);
  }
}
