import 'package:fashion/env.dart';

// Development environment
const SERVER_HOST_DEV = 'http://127.0.0.1:8000/api/';

// Production Environment
const SERVER_HOST_PROD = 'http://xieyezi.com:9003/mock/11/airi';

const SERVER_API_URL = ENV == "DEV" ? SERVER_HOST_DEV : SERVER_HOST_PROD;
