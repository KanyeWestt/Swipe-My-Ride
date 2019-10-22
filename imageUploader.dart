import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

void main() => runApp(ImageUploaderRun());

//need this class to test class because Stateless widget provides the required MediaQuery
class ImageUploaderRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageUploader(),
    );
  }

//  ImageUploader.
}

class ImageUploader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageUploaderState();
  }
}

class _ImageUploaderState extends State<ImageUploader> {
  File _image; //image will be stored here
  String _uploadedFileURL; //storage url will be stored here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Car Image'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Selected Image:'),
            _image != null
                ? Image.asset(
                    _image.path,
                    height: 150,
                  )
                : Container(height: 150),
            SizedBox(height: 25),
            _image == null
                ? RaisedButton(
                    child: Text('Choose File'),
                    onPressed: chooseFile,
                    color: Colors.cyan,
                  )
                : Container(),
            _image != null
                ? RaisedButton(
                    child: Text('Upload File'),
                    onPressed: callUploadFile,
                    color: Colors.cyan,
                  )
                : Container(),
            _image != null
                ? RaisedButton(
                    child: Text('Clear Selection'),
                    onPressed: clearSelection,
                  )
                : Container(),
            SizedBox(height: 25),
            Text('Image Uploaded:'),
            _uploadedFileURL != null
                ? Image.network(
                    _uploadedFileURL,
                    height: 150,
                  )
                : Container(),
            SizedBox(height: 25),
            _uploadedFileURL == null
                ? RaisedButton(
                    child: Text('Done'),
                    onPressed: null,
                    color: Colors.cyan,
                  )
                : Container(),
            _uploadedFileURL != null
                ? RaisedButton(
                    child: Text('Done'),
                    onPressed: null,
                    color: Colors.cyan,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void callUploadFile() {
    UploadFile uploadFile = new UploadFile();
    uploadFile.uploadFile(_image);
    StorageReference storageReference = uploadFile.getStorageReference();
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  void clearSelection() {
    this._uploadedFileURL = null;
    setState(() {
      _image = null;
    });
  }
}

class UploadFile {
  StorageReference _storageReference;
  Future uploadFile(File image) async {
    _storageReference = FirebaseStorage.instance
        .ref()
        .child('users/${Path.basename(image.path)}}');
    StorageUploadTask uploadTask = _storageReference.putFile(image);
    await uploadTask.onComplete;
    print('File Uploaded');
  }

  StorageReference getStorageReference() {
    if (_storageReference != null) {
      return _storageReference;
    } else {
      return null;
    }
  }
}
