import 'package:get/get_connect.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/data/api/api_client.dart';

class StoriesRepo {
  final ApiClient apiClient;

  StoriesRepo({required this.apiClient});

  Future<Response> getStories() async {
    return await apiClient.getData(AppConstant.STORIES);
  }
}
