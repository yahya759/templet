import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);

  void emitLoading() {
    // This requires the state to have a copyWith method or being able to create a new state with loading status.
    // Since BaseState is abstract, we'll let the child cubits handle the specific state transitions,
    // but we can provide helper methods if we define a common interface for states.
  }

  // Common logic for handling errors or setting status can be added here.
}
