import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/dex_selection/presentation/blocs/dex_selection_bloc.dart';
import 'package:flutter_dex/dex_selection/presentation/pages/dex_selection_view_mobile.dart';
import 'package:flutter_dex/shared/widget/loading_widget.dart';

class DexSelectionScreen extends StatelessWidget {
  const DexSelectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DexSelectionBloc(),
      child: _content(context),
    );
  }

  Widget _content(BuildContext buildContext) {
    return Scaffold(
      body: BlocBuilder<DexSelectionBloc, DexSelectionState>(
        builder: (blocContext, state) {
          if (state is DexSelectionSuccess) {
            return DexSelectionViewMobile();
          } else if (state is DexSelectionLoading) {
            return const LoadingWidget(
                width: double.infinity, height: double.infinity);
          } else if (state is DexSelectionError) {
            return const DexSelectionViewMobile();
          } else if (state is DexSelectionInitialState) {
            _fetchContent(blocContext);
          } else {
            return const DexSelectionViewMobile();
          }
          return Container();
        },
      ),
    );
  }

  _fetchContent(BuildContext blocContext) {
    BlocProvider.of<DexSelectionBloc>(blocContext).add(LoadDexSelectionContent());
  }
}
