import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/poke_details/presentation/blocs/poke_details_bloc.dart';
import 'package:flutter_dex/poke_details/presentation/pages/poke_details_view_mobile.dart';
import 'package:flutter_dex/shared/widget/loading_widget.dart';

class PokeDetailsScreen extends StatelessWidget {
  String id;
  PokeDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokeDetailsBloc(id: id),
      child: _content(context),
    );
  }

  Widget _content(BuildContext buildContext) {
    return Scaffold(
      body: BlocBuilder<PokeDetailsBloc, PokeDetailsState>(
        builder: (blocContext, state) {
          if (state is PokeDetailsSuccess) {
            return PokeDetailsViewMobile(
              pokemonForm: state.pokemonForm,
              pokemonDetailsSpecies: state.pokemonDetailsSpecies,
            );
          } else if (state is PokeDetailsLoading) {
            return const LoadingWidget(width: double.infinity, height: double.infinity);
          } else if (state is PokeDetailsError) {
            return const PokeDetailsViewMobile();
          } else if (state is PokeDetailsInitialState) {
            _fetchContent(blocContext);
          } else {
            return const PokeDetailsViewMobile();
          }
          return Container();
        },
      ),
    );
  }

  _fetchContent(BuildContext blocContext) {
    BlocProvider.of<PokeDetailsBloc>(blocContext).add(LoadPokeDetailsContent());
  }
}
