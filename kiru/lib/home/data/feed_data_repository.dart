import 'package:kiru/models/app_image.dart';
import 'package:kiru/models/feed_tab.dart';

class FeedDataRepository {
  Future<List<AppImageModel>> fetchData(FeedTab tab) async {
    await Future.delayed(Duration(seconds: 2));

    if (tab == FeedTab.recommendations) {
      return [
        AppImageModel(
          id: '1',
          url:
              'https://i.pinimg.com/736x/05/de/ae/05deae5be5821f1a209b12d76ea17aa7.jpg',
        ),
        AppImageModel(
          id: '2',
          url:
              'https://i.pinimg.com/736x/d5/1b/be/d51bbeb5143d33a592dc34e53e6b1196.jpg',
        ),
        AppImageModel(
          id: '3',
          url:
              'https://i.pinimg.com/736x/94/50/8f/94508f59d0530dfd91d1b6f6dd788021.jpg',
        ),
        AppImageModel(
          id: '4',
          url:
              'https://i.pinimg.com/736x/cc/22/9b/cc229bdab710913d8f6c0e11b100fab3.jpg',
        ),
      ];
    } else {
      return [
        AppImageModel(
          id: '5',
          url:
              'https://i.pinimg.com/736x/27/31/e6/2731e6eeaad70ff2d3b99fe7d0799b91.jpg',
        ),
        AppImageModel(
          id: '6',
          url:
              'https://i.pinimg.com/736x/d6/b0/2c/d6b02c86ec8102fc4ece7109ea722bb5.jpg',
        ),
        AppImageModel(
          id: '7',
          url:
              'https://i.pinimg.com/1200x/d9/c7/05/d9c705db1d21349b5057ee7dddf687f7.jpg',
        ),
      ];
    }
  }
}
