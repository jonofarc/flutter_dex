import 'package:dartz/dartz.dart';
import 'package:flutter_dex/dex_selection/data/models/regions.dart';
import 'package:flutter_dex/shared/network/failures.dart';
import 'package:flutter_dex/shared/utils/constants.dart';
import 'package:flutter_dex/shared/utils/log.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DexSelectionContentRepository {
  Future<Either<ServerFailure, Regions>> fetchContent() async {
    //this API call should call a middle layer such as AWS instead of calling
    //the auth api directly in a full release scenario for security purposes

    const url = pokeApiBaseUrl + regionsUrl;

    //if (response.statusCode == 200) {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final regions = Regions.fromJson(data);
          return Right(regions);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("cmsContent failed to parse ToolsCollection: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }
}
