import 'package:compass_tandf_flutter/liveness_store.dart';
import 'package:flutter/material.dart';

class LivenessActionsWidget extends StatelessWidget {
  const LivenessActionsWidget({
    Key? key,
    required LivenessStore livenessStore,
  })  : _livenessStore = livenessStore,
        super(key: key);

  final LivenessStore _livenessStore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: ElevatedButton(
            onPressed: () async {
              _livenessStore.start();
            },
            child: const Text("Capturar"),
          ),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.red[900]),
          onPressed: () {
            _livenessStore.clean();
          },
          icon: const Icon(Icons.remove_circle_outline_sharp),
          label: const Text('Limpar'),
        ),
      ],
    );
  }
}
