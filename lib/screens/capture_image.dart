import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCapture extends StatefulWidget {
  @override
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;

  File getImageFile(){
    return _imageFile;
  }
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
    );
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () => _pickImage(ImageSource.camera),
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //shrinkWrap: true,
              children: <Widget>[
                if (_imageFile != null) ...[
                  Image.file(_imageFile, height: 150),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                      children: <Widget>[
                      FlatButton(
                        child: Icon(Icons.crop),
                        onPressed: _cropImage,
                      ),
                      FlatButton(
                        child: Icon(Icons.refresh),
                        onPressed: _clear,
                      )
                    ],
                  )
                ]
              ],
            ))
      ],
    );
  }
}
