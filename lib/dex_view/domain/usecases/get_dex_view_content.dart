import 'package:dartz/dartz.dart';
import 'package:flutter_dex/dex_view/data/models/pokedex/pokedex.dart';
import 'package:flutter_dex/dex_view/data/models/region_info.dart';
import 'package:flutter_dex/dex_view/domain/repositories/dex_view_content_repository.dart';
import 'package:flutter_dex/shared/network/failures.dart';

class GetDexViewContent {
  GetDexViewContent();

  Future<Either<ServerFailure, RegionInfo>> getRegionInfo({required String url}) async {
    return await DexViewContentRepository().getRegionInfo(url: url);
  }

  Future<Either<ServerFailure, Pokedex>> getPokeDexData({required String url}) async {
    // First, get the region info
    final regionResult = await getRegionInfo(url: url);

    return regionResult.fold(
      (failure) => Left(failure), // propagate the exact ServerFailure
      (regionInfo) async {
        // If successful, fetch the Pokedex data
        return await DexViewContentRepository().getPokeDexData(url: regionInfo.pokedexes?.first.url ?? "");
      },
    );
  }
}
