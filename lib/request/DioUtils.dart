import 'package:dio/dio.dart';

class DioUtils {
  final Dio _dio = Dio();
  DioUtils(){
    // 
    _dio.options
      ..baseUrl = "192.168.31.111/xxx/"
      ..connectTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10);
    _addInterceptor(); // 注册添加拦截器
  }
  void _addInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
      // 请求拦截器
        onRequest:(context, handler){
          // handler.next(requestOptions) // 放过请求
          // handler.reject(error)	// 拦截请求
          handler.next(context);
        },
        // 响应拦截器
        onResponse: (context, handler){

          //
          if(context.statusCode! >= 200 && context.statusCode! < 300){
            handler.next(context); /// 放行
            return;
          }
          handler.reject(DioException(requestOptions: context.requestOptions));
        },
        // 错误拦截器
        onError: (context, handler){
          handler.reject(context);
        }
    ));
  }

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}

// DioUtils util = DioUtils();