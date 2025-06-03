import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

import '../models/product.dart';

class LocalAndWebObjectsView extends StatefulWidget {

  final Product product;

  const LocalAndWebObjectsView({Key? key, required this.product}) : super(key: key);

  @override
  State<LocalAndWebObjectsView> createState() => _LocalAndWebObjectsViewState(product: product);
}

class _LocalAndWebObjectsViewState extends State<LocalAndWebObjectsView> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  final Product product;
  _LocalAndWebObjectsViewState({required this.product});
  //String localObjectReference;
  ARNode? localObjectNode;

  //String webObjectReference;
  ARNode? webObjectNode;

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AR"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: ARView(
                  onARViewCreated: onARViewCreated,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: onLocalObjectButtonPressed,
                      child: const Text("carregar modelo")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager.onInitialize(
      showFeaturePoints: true, // Ajuda a depurar se o ARKit/ARCore está detectando pontos
      showPlanes: true,
      showAnimatedGuide: true, // NOVO: guia de posicionamento, ajuda o usuário
      customPlaneTexturePath: "assets/triangle.png",
      showWorldOrigin: false,
      handleTaps: false,

    );

    this.arSessionManager.onInitialize(
      showPlanes: true,
      handleTaps: true,
    );

    this.arObjectManager.onInitialize();
    this.arSessionManager.onPlaneOrPointTap = onPlaneTapped;
  }

  Future<void> onPlaneTapped(List<ARHitTestResult> hits) async {
    if (hits.isEmpty) return;
    final hit = hits.first;

    var newNode = ARNode(
      type: NodeType.localGLTF2,
      uri: product.model,
      scale: Vector3(0.2, 0.2, 0.2),
      position: hit.worldTransform.getTranslation(),
      rotation: hit.worldTransform.row0,
    );

    bool? didAdd = await arObjectManager.addNode(newNode);
    if (didAdd == true) {
      localObjectNode = newNode;
    }
  }


  Future<void> onLocalObjectButtonPressed() async {
    if (localObjectNode != null) {
      arObjectManager.removeNode(localObjectNode!);
      localObjectNode = null;
    } else {
      // Aguarde o AR rastrear o plano
      await Future.delayed(Duration(seconds: 2));

      var newNode = ARNode(
        type: NodeType.localGLTF2,
        uri: product.model,
        scale: Vector3(0.2, 0.2, 0.2),
        position: Vector3(0.0, 0.0, 0.0),
        rotation: Vector4(1.0, 0.0, 0.0, 0.0),
      );

      bool? didAddLocalNode = await arObjectManager.addNode(newNode);
      localObjectNode = (didAddLocalNode!) ? newNode : null;
    }
  }

  Future<void> onWebObjectAtButtonPressed() async {
    if (webObjectNode != null) {
      arObjectManager.removeNode(webObjectNode!);
      webObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri:
          "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Fox/glTF-Binary/Fox.glb",
          scale: Vector3(0.2, 0.2, 0.2));
      bool? didAddWebNode = await arObjectManager.addNode(newNode);
      webObjectNode = (didAddWebNode!) ? newNode : null;
    }
  }
}
