import 'package:fashion/env.dart';

// Image URL
const SERVER_HOST_IMG = 'http://2407-116-110-86-59.ngrok.io';

// Development environment
const SERVER_HOST_DEV = 'http://2407-116-110-86-59.ngrok.io/api';

// Production Environment
const SERVER_HOST_PROD = 'http://xieyezi.com:9003/mock/11/airi';

const SERVER_API_URL = ENV == "DEV" ? SERVER_HOST_DEV : SERVER_HOST_PROD;
