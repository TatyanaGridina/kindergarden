import 'package:kindergarden/entities/backend_settings.dart';
import 'package:kindergarden/usecases/image/data/datasources/image_datasource.dart';
import 'package:kindergarden/usecases/image/data/models/image_response.dart';
import 'package:kindergarden/usecases/image/image_interface.dart';

class ImageRepository extends IImageRepository {
  final ImageDatasource _imageDatasource;

  ImageRepository(this._imageDatasource);

  @override
  Future<Map<String, List<String>>> call({required BackendSettings settings}) async {
    final result = await _imageDatasource(settings: settings);
    if (result.isErr) throw result.error ?? 'Cannot image';

    final Map<String, List<String>> map = _mapResponse(result.data!);

    return map;
  }

  _mapResponse(ImageResponse response) {
    Map<String, List<String>> map = {};
    for (var e in (response.data ?? {}).entries) {
      List<String> users = (e.value as List<dynamic>).map((user) => user.toString().trim()).toList();
      map[e.key] = users;
    }
    return map;
  }
}
