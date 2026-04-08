import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/dex_selection/data/models/region.dart';
import 'package:flutter_dex/dex_view/presentation/blocs/dex_view_bloc.dart';
import 'package:flutter_dex/dex_view/presentation/pages/dex_view_view_mobile.dart';
import 'package:flutter_dex/shared/widget/loading_widget.dart';

class DexViewScreen extends StatelessWidget {
  Region region;
  DexViewScreen({
    super.key,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DexViewBloc(region: region),
      child: _content(context),
    );
  }

  Widget _content(BuildContext buildContext) {
    return Scaffold(
      body: BlocBuilder<DexViewBloc, DexViewState>(
        builder: (blocContext, state) {
          if (state is DexViewSuccess) {
            return DexViewViewMobile(
              pokemonEntries: state.pokemonEntries ?? [],
            );
          } else if (state is DexViewLoading) {
            return const LoadingWidget(width: double.infinity, height: double.infinity);
          } else if (state is DexViewError) {
            return const DexViewViewMobile();
          } else if (state is DexViewInitialState) {
            _fetchContent(blocContext);
          } else {
            return const DexViewViewMobile();
          }
          return Container();
        },
      ),
    );
  }

  _fetchContent(BuildContext blocContext) {
    BlocProvider.of<DexViewBloc>(blocContext).add(LoadDexViewContent());
  }
}
