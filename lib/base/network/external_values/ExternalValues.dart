// ignore: file_names
import 'iExternalValue.dart';

class ExternalValues implements IExternalValues {
  @override
  String getBaseUrlv1() {
    return getBaseUrl();
  }

  @override
  String countriesBaseUrl() {
    return "https://countriesnow.space";
  }

  @override
  String getBaseUrl() {
    const String url = 'http://test-devserver.custodyrx.net:9000/';
    // const String url = 'https://3czv4rpn-4000.inc1.devtunnels.ms';
    // const String url = 'https://397pcq6k-4000.inc1.devtunnels.ms';
    return url;
   // return 'http://35.84.137.45';
  //  return 'http://192.168.1.108:4000';
    // return 'http://18.219.152.41:4000';
  }
  
  @override
  String imageBaseURL()=>Links.s3BucketURL;
}

class Links{
  // static const s3BucketURL = 'http://35.84.137.45:4000/v1/resource/public/';
  static const s3BucketURL = 'https://mindshift-psychology.s3.us-west-2.amazonaws.com/';
}
