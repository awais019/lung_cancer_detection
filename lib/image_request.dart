import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageRequest extends StatefulWidget {
  const ImageRequest({super.key});

  @override
  State<ImageRequest> createState() => _ImageRequestState();
}

class _ImageRequestState extends State<ImageRequest> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
      } else {}
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> _takePicture() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );

      setState(() {
        if (pickedFile != null) {
          final _imageFile = pickedFile;
        } else {}
      });
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: [
          Image.asset("assets/logo-short.png"),
          const SizedBox(
            height: 40,
          ),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: TextButton(
                  onPressed: () => _takePicture(),
                  child: const Text("Take picture",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )))),
          const SizedBox(height: 16.0),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: TextButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: const Text(
                    "Select an image",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ))),
        ]),
      ),
    );
  }
}
