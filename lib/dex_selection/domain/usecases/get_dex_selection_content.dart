import 'package:dartz/dartz.dart';
import 'package:flutter_dex/dex_selection/data/models/regions.dart';
import 'package:flutter_dex/dex_selection/domain/repositories/dex_selection_content_repository.dart';
import 'package:flutter_dex/shared/network/failures.dart';


class GetDexSelectionContent {
  GetDexSelectionContent();

   Future<Either<ServerFailure, Regions>> execute() async {

   return await DexSelectionContentRepository().fetchContent();
  }
}
