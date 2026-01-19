import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/locator.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/base/base_view.dart';
import '../cubit/example_cubit.dart';
import '../../settings/view/settings_view.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExampleCubit()..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Example Screen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                locator<NavigationService>().navigateTo(const SettingsView());
              },
            ),
          ],
        ),
        body: const ExampleBody(),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () => context.read<ExampleCubit>().fetchData(),
              child: const Icon(Icons.refresh),
            );
          },
        ),
      ),
    );
  }
}

class ExampleBody extends BaseView<ExampleCubit, ExampleState> {
  const ExampleBody({super.key});

  @override
  Widget buildBody(BuildContext context, ExampleState state) {
    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(state.items[index]));
      },
    );
  }
}
