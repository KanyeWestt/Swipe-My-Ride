import 'package:swipe_my_ride/imageUploader.dart';

void main() {

  UploadFileTest test = new UploadFileTest();
  test.testMethod1();
}

class UploadFileTest {
  UploadFile uploader = new UploadFile();

  void testMethod1() {
    print("Testing to ensure storage reference is initially null: ");

    if (uploader.getStorageReference() == null) {
      print("Test passed: Storage reference is empty.");
    } else
      print("Test failed: Storage reference is not null.");
  }
}
