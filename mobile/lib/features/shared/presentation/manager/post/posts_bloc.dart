import 'package:bloc/bloc.dart';
import 'package:mobile/core/di/injection.dart';
import 'package:mobile/features/shared/domain/repositories/posts.dart';
import 'package:mobile/generated/protos/core_shared.pb.dart';
import 'package:shared_utils/shared_utils.dart';

part 'posts_event.dart';

class PostsBloc extends Bloc<PostsEvent, BlocState> {
  final _repo = getIt<BasePostsRepository>();

  PostsBloc() : super(BlocState.initialState()) {
    on<GetUserPostsEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getPostsForUser(event.userId);
      either.fold(
        (l) => emit(BlocState<GetPostsForUserResponse>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });

    on<GetCurrentUserPostsEvent>((event, emit) async {
      emit(BlocState.loadingState());
      var either = await _repo.getPostsForCurrentUser();
      either.fold(
        (l) => emit(BlocState<GetPostsForUserResponse>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }
}
