import '../../../core/base/base_cubit.dart';
import '../../../core/base/base_state.dart';

class ExampleState extends BaseState {
  final List<String> items;

  const ExampleState({super.status, super.errorMessage, this.items = const []});

  @override
  List<Object?> get props => [...super.props, items];

  ExampleState copyWith({
    BaseStatus? status,
    String? errorMessage,
    List<String>? items,
  }) {
    return ExampleState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }
}

class ExampleCubit extends BaseCubit<ExampleState> {
  ExampleCubit() : super(const ExampleState());

  Future<void> fetchData() async {
    emit(state.copyWith(status: BaseStatus.loading));

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Randomly decide to succeed, empty or error for demonstration
    final random = DateTime.now().second % 4;

    if (random == 0) {
      emit(
        state.copyWith(
          status: BaseStatus.success,
          items: ['Apple', 'Banana', 'Cherry'],
        ),
      );
    } else if (random == 1) {
      emit(state.copyWith(status: BaseStatus.empty));
    } else if (random == 2) {
      emit(state.copyWith(status: BaseStatus.noInternet));
    } else {
      emit(
        state.copyWith(
          status: BaseStatus.error,
          errorMessage: 'Failed to fetch items from server.',
        ),
      );
    }
  }
}
