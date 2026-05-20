// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/dataSource/forget_password_dao.dart' as _i814;
import '../../data/dataSource/login_dao.dart' as _i529;
import '../../data/dataSource/register_dao.dart' as _i985;
import '../../data/dataSource_impl/forget_pass_dao_impl.dart' as _i957;
import '../../data/dataSource_impl/login_dao_impl.dart' as _i990;
import '../../data/dataSource_impl/register_dao_impl.dart' as _i463;
import '../../data/repo_impl/forget_password_repo_impl.dart' as _i1051;
import '../../data/repo_impl/login_repo_impl.dart' as _i886;
import '../../data/repo_impl/register_repo_impl.dart' as _i357;
import '../../repository/forget_password_repo.dart' as _i479;
import '../../repository/login_repo.dart' as _i5;
import '../../repository/register_repo.dart' as _i680;
import '../../ui/Auth/forgetPassword/viewModel/forget_password_viewModel.dart'
    as _i790;
import '../../ui/Auth/login/viewModel/login_view_model.dart' as _i610;
import '../../ui/Auth/register/viewModel/register_view_model.dart' as _i935;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i985.RegisterDao>(() => _i463.RegisterDaoImpl());
    gh.factory<_i814.ForgetPasswordDao>(() => _i957.ForgetPassDaoImpl());
    gh.factory<_i529.LoginDao>(() => _i990.LoginDaoImpl());
    gh.factory<_i479.ForgetPasswordRepo>(
      () => _i1051.ForgetPasswordRepoImpl(gh<_i814.ForgetPasswordDao>()),
    );
    gh.factory<_i5.LoginRepo>(
      () => _i886.LoginRepoImpl(loginDao: gh<_i529.LoginDao>()),
    );
    gh.factory<_i610.LoginViewModel>(
      () => _i610.LoginViewModel(gh<_i5.LoginRepo>()),
    );
    gh.factory<_i680.RegisterRepo>(
      () => _i357.RegisterRepoImpl(gh<_i985.RegisterDao>()),
    );
    gh.factory<_i935.RegisterViewModel>(
      () => _i935.RegisterViewModel(gh<_i680.RegisterRepo>()),
    );
    gh.factory<_i790.ForgetPasswordViewmodel>(
      () => _i790.ForgetPasswordViewmodel(gh<_i479.ForgetPasswordRepo>()),
    );
    return this;
  }
}
