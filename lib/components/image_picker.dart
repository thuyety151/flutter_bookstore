import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folder/provider/account_model.dart';
import 'package:image_picker/image_picker.dart' as lib;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({Key? key}) : super(key: key);

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late List<CameraDescription> cameras;
  late bool _isReady = false;
  late bool _isFront = false;

  @override
  void initState() {
    super.initState();

    _setupCameras();

    // // To display the current output from the Camera,
    // // create a CameraController.
    // _controller = CameraController(
    //   // Get a specific camera from the list of available cameras.
    //   widget.camera,
    //   // Define the resolution to use.
    //   ResolutionPreset.medium,
    // );

    // // Next, initialize the controller. This returns a Future.
  }

  Future<void> _setupCameras() async {
    try {
      // initialize cameras.
      cameras = await availableCameras();
      // initialize camera controllers.
      _controller =
          CameraController(cameras[_isFront ? 0 : 1], ResolutionPreset.medium);
      await _controller.initialize();
      _initializeControllerFuture = _controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Future getImagefromGallery() async {
    var _imagePicker = lib.ImagePicker();

    var image = await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        Provider.of<AccountModel>(context, listen: false).setImage(image);
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.

    if (!_isReady) return Container();
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Scaffold(
            bottomNavigationBar: Container(
                decoration: const BoxDecoration(color: Colors.black38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: getImagefromGallery,
                        icon: const Icon(
                          Icons.perm_media_outlined,
                          size: 20.0,
                          color: Color(0xFF404040),
                        )),
                    IconButton(
                        onPressed: () async {
                          final image = await _controller.takePicture();
                          Provider.of<AccountModel>(context, listen: false)
                              .setImage(image);
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 20.0,
                          color: Color(0xFF404040),
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _isFront = !_isFront;
                          });
                          _setupCameras();
                        },
                        icon: const Icon(
                          Icons.cameraswitch_outlined,
                          size: 20.0,
                          color: Color(0xFF404040),
                        ))
                  ],
                )),
            body: Wrap(
              direction: Axis.vertical,
              children: [
                CameraPreview(_controller),
              ],
            ),
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
