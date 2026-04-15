import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/type/data/models/types.dart';
import 'package:flutter_dex/type/domain/usecases/types_content.dart';

class TypeChart {
  //TODO probably good to cache this data and renew it after some time
  late final Types types;

  Future<void> loadTypes() async {
    final getTypes = serviceLocator<GetTypesContent>();
    final typesData = await getTypes.getTypesData();

    typesData.fold(
      (error) {
        types = Types(count: 0, results: []);
        throw Exception("Failed to load TypeChart: $error");
      },
      (data) {
        types = data;
      },
    );
  }
}
