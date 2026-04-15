import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dex/shared/network/failures.dart';
import 'package:flutter_dex/shared/utils/constants.dart';
import 'package:flutter_dex/shared/utils/log.dart';
import 'package:flutter_dex/type/data/models/types.dart';
import 'package:http/http.dart' as http;

class TypesContentRepository {
  Future<Either<ServerFailure, Types>> getTypes() async {
    final url = pokeApiBaseUrl + typeUrl;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final types = Types.fromJson(data);
          return Right(types);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("failed to parse Type: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }
}
