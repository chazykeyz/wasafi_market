import 'package:get/get.dart';
import 'package:wasafi_market/data/repositories/stories.dart';
import 'package:wasafi_market/models/stories/stories.dart';

class StoriesController extends GetxController implements GetxService {
  final StoriesRepo storiesRepo;
  StoriesController({required this.storiesRepo});

  List _stories = [];
  bool _isLoading = false;
  List get stories => _stories;
  bool get isLoading => _isLoading;

  Future<void> getStories() async {
    _stories = [];
    _isLoading = true;
    update();
    Response response = await storiesRepo.getStories();

    if (response.statusCode == 200) {
      for (var item in response.body) {
        _stories.add(StoriesModel.fromJson(item));
      }
      _isLoading = false;
      update();
    } else {
      _stories = [];
      _isLoading = false;
      update();
    }
  }
}
