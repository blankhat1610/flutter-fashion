import 'package:fashion/env.dart';

// Image URL
const SERVER_HOST_IMG = 'http://192.168.42.253:8000';

// Development environment
const SERVER_HOST_DEV = 'http://192.168.42.253:8000/api';

// Production Environment
const SERVER_HOST_PROD = 'http://xieyezi.com:9003/mock/11/airi';

const SERVER_API_URL = ENV == "DEV" ? SERVER_HOST_DEV : SERVER_HOST_PROD;
