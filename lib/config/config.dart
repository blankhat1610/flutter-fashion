import 'package:fashion/env.dart';

// Development environment
const SERVER_HOST_DEV = 'http://xieyezi.com:9003/mock/11/airi';

// Production Environment
const SERVER_HOST_PROD = 'http://xieyezi.com:9003/mock/11/airi';

const SERVER_API_URL = ENV == "DEV" ? SERVER_HOST_DEV : SERVER_HOST_PROD;
