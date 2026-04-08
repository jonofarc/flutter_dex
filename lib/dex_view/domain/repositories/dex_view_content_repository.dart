import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokedex.dart';
import 'package:flutter_dex/dex_view/data/models/region_info.dart';
import 'package:flutter_dex/shared/network/failures.dart';
import 'package:flutter_dex/shared/utils/constants.dart';
import 'package:flutter_dex/shared/utils/log.dart';
import 'package:http/http.dart' as http;

class DexViewContentRepository {
  Future<Either<ServerFailure, RegionInfo>> getRegionInfo({required String url}) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final regionInfo = RegionInfo.fromJson(data);
          return Right(regionInfo);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("failed to parse getRegionInfo: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }

  Future<Either<ServerFailure, Pokedex>> getPokeDexData({required String url}) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final pokedex = Pokedex.fromJson(data);
          return Right(pokedex);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("failed to parse getPokeDexData: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }
}
