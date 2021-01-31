import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:warranty_tracker/services/auth.dart';
import 'dart:io';
import 'package:warranty_tracker/services/fStoreUploader.dart';

class Uploader extends StatefulWidget {
  @override
  File file;
  String name;
  String date;
  int category;
  String info;
  Uploader(
      {Key key, this.file, this.name, this.date, this.category, this.info});
  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  AuthService _authService = AuthService();
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://warrantytrack.appspot.com/');
  String filename;
  StorageUploadTask _uploadTask;

  /// Starts an upload task
  void _startUpload() {
    /// Unique file name for the file
    filename = DateTime.now().toString();
    String test = _authService.userIdget().toString();

    setState(() {
      _uploadTask =
          _storage.ref().child('notimage/' + filename).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      /// Manage the task state and event subscription with a StreamBuilder
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (_, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(
              children: [
                //upload to firestore
                if (_uploadTask.isComplete)
                  FStoreUploader(
                      filename: filename,
                      name: widget.name,
                      date: widget.date,
                      category: widget.category,
                      info: widget.info),

                if (_uploadTask.isPaused)
                  FlatButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: _uploadTask.resume,
                  ),

                if (_uploadTask.isInProgress)
                  FlatButton(
                    child: Icon(Icons.pause),
                    onPressed: _uploadTask.pause,
                  ),

                // Progress bar
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)} % '),
              ],
            );
          });
    } else {
      // Allows user to decide when to start the upload
      return FlatButton.icon(
        label: Text('Upload to Firebase'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}
