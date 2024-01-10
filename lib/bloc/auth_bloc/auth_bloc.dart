import 'dart:async';
import 'package:custody_rx/base/enums.dart';
import 'package:custody_rx/base/network/error_handler/error_handler.dart';
import 'package:custody_rx/base/usecases/login_usecase/login_usecase.dart';
import 'package:custody_rx/bloc/auth_bloc/auth_events.dart';
import 'package:custody_rx/bloc/auth_bloc/auth_states.dart';
import 'package:custody_rx/data/jwt_access_token.dart';
import 'package:custody_rx/di.dart';
import 'package:custody_rx/domain/entities/login_entity.dart';
import 'package:custody_rx/repository/auth_repo/i_logIn_repo.dart';
import 'package:custody_rx/utils/custom_overlay/custom_overlay.dart';
import 'package:custody_rx/utils/toast/custom_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //News repo instance
  late final ILogInRepo loginRepo;
  bool isPasswordVisible = false;

  AuthBloc() : super(AuthInitial()) {
    loginRepo = inject<ILogInRepo>();

    on<AuthFetchDataEvent>(_loginUser);
    on<TogglePasswordVisibilityEvent>(_togglePasswordVisibility);
  }

  FutureOr<void> _loginUser(AuthEvent event, Emitter<AuthState> emit) async {
    LoginUserUseCase login = LoginUserUseCase(loginRepo);
    if (event is AuthFetchDataEvent) {
      emit(AuthPageLoading());
      LoginEntity userRequestModel =
          LoginEntity(email: event.email, password: event.password);
      final userRes = await login(userRequestModel);

      // userRes.fold((l) => emit(AuthPageError()), (r) => null)

      // ;
      userRes.fold((l) {
        SectionToast.show(ErrorMessage.fromError(l).message);
        emit(AuthPageError(ErrorMessage.fromError(l).message!));
        FullScreenLoader().hide();
      }, (res) {
        FullScreenLoader().hide();
        // iPrefHelper.saveUser(r);
        inject<JwtLocalAccessToken>()
            .saveToken(SecureStorageKeys.accessToken, res.data!.token);
        emit(AuthPageLoaded(res));
        
      });
      // Define the logic to visiblility of true or false for password
    }
  }

  void _togglePasswordVisibility(
      TogglePasswordVisibilityEvent event, Emitter<AuthState> emit) {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityToggled(isPasswordVisible));
  }
}
