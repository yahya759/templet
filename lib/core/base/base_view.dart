import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_cubit.dart';
import 'base_state.dart';
import '../widgets/states/app_loading.dart';
import '../widgets/states/app_error.dart';
import '../widgets/states/app_empty.dart';
import '../widgets/states/no_internet.dart';

abstract class BaseView<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  const BaseView({super.key});

  Widget buildBody(BuildContext context, S state);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      builder: (context, state) {
        switch (state.status) {
          case BaseStatus.loading:
            return const AppLoading();
          case BaseStatus.error:
            return AppError(
              message: state.errorMessage ?? 'Something went wrong',
            );
          case BaseStatus.empty:
            return const AppEmpty();
          case BaseStatus.noInternet:
            return const NoInternet();
          case BaseStatus.initial:
          case BaseStatus.success:
            return buildBody(context, state);
        }
      },
    );
  }
}
