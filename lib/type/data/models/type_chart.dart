import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/shared/utils/log.dart';
import 'package:flutter_dex/type/data/models/types.dart';
import 'package:flutter_dex/type/domain/usecases/types_content.dart';

class TypeChart {
  late final Types types;

  Future<bool> loadTypes() async {
    final getTypes = serviceLocator<GetTypesContent>();
    final typesData = await getTypes.getTypesData();

    return await typesData.fold(
      (error) {
        types = Types(count: 0, results: []);
        Log.debug("Failed to load TypeChart: $error");
        return false;
      },
      (data) async {
        types = data;
        final detailFutures = types.results.map((typeData) async {
          final response = await getTypes.getTypeDataDetails(name: typeData.name);
          return response.fold(
            (error) {
              Log.debug("Failed to load details for ${typeData.name}: $error");
              return false; // This specific call failed
            },
            (details) {
              typeData.typesDataDetails = details;
              return true; // This specific call succeeded
            },
          );
        }).toList();

        //Execute all calls in parallel and wait for the entire list to finish
        final results = await Future.wait(detailFutures);

        //Return true only if every single detail call returned true
        return !results.contains(false);
      },
    );
  }
}
