import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart' show NodeType;
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart'; // For Vector3

class HelloWorld extends StatefulWidget {
  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
        ),
        body: ARView(
          onARViewCreated: _onARViewCreated,
        ),
      ),
    );
  }

  void _onARViewCreated(ARSessionManager sessionManager, ARObjectManager objectManager, ARAnchorManager anchorManager, ARLocationManager locationManager) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;

    arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: null,
      showWorldOrigin: true,
    );

    arObjectManager.onInitialize();

    _addMesa();
  }

  void _addSphere() async {
    final node = ARNode(
      type: NodeType.fileSystemAppFolderGLB,
      uri: "assets/sphere.glb", // Replace with the correct path
      position: Vector3(0, 0, -1.5),
      scale: Vector3(0.1, 0.1, 0.1),
    );
    await arObjectManager.addNode(node);
  }

  void _addMesa() async {
    final node = ARNode(
      type: NodeType.webGLB,
      uri: "assets/models/mesa.glb", // Replace with the correct path
      position: Vector3(0, 0, -1.5),
      scale: Vector3(1, 1, 1),
    );
    await arObjectManager.addNode(node);
  }

  void _addCylinder() async {
    final node = ARNode(
      type: NodeType.fileSystemAppFolderGLB,
      uri: "assets/cylinder.glb", // Replace with the correct path
      position: Vector3(0.0, -0.5, -2.0),
      scale: Vector3(0.5, 0.3, 0.5),
    );
    await arObjectManager.addNode(node);
  }

  void _addCube() async {
    final node = ARNode(
      type: NodeType.fileSystemAppFolderGLB,
      uri: "assets/cube.glb", // Replace with the correct path
      position: Vector3(-0.5, 0.5, -3.5),
      scale: Vector3(0.5, 0.5, 0.5),
    );
    await arObjectManager.addNode(node);
  }

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }
}