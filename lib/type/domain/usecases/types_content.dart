import 'package:dartz/dartz.dart';
import 'package:flutter_dex/shared/network/failures.dart';
import 'package:flutter_dex/type/data/models/types.dart';
import 'package:flutter_dex/type/data/models/types_data_details.dart';
import 'package:flutter_dex/type/domain/repositories/types_content_repository.dart';

class GetTypesContent {
  Future<Either<ServerFailure, Types>> getTypesData() async {
    return await TypesContentRepository().getTypes();
  }

  Future<Either<ServerFailure, TypesDataDetails>> getTypeDataDetails({required String name}) async {
    return await TypesContentRepository().getTypesDataDetails(name: name);
  }
}
