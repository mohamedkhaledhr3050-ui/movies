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
import '../../data/dataSource/movie_details_dao.dart' as _i810;
import '../../data/dataSource/movie_list_dao.dart' as _i317;
import '../../data/dataSource/movie_page_dao.dart' as _i103;
import '../../data/dataSource/register_dao.dart' as _i985;
import '../../data/dataSource_impl/forget_pass_dao_impl.dart' as _i957;
import '../../data/dataSource_impl/login_dao_impl.dart' as _i990;
import '../../data/dataSource_impl/movie_details_api_dao_impl.dart' as _i934;
import '../../data/dataSource_impl/movie_list_api_dao_impl.dart' as _i827;
import '../../data/dataSource_impl/movie_page_api_dao_impl.dart' as _i866;
import '../../data/dataSource_impl/register_dao_impl.dart' as _i463;
import '../../data/repo_impl/forget_password_repo_impl.dart' as _i1051;
import '../../data/repo_impl/login_repo_impl.dart' as _i886;
import '../../data/repo_impl/movie_details_repo_impl.dart' as _i951;
import '../../data/repo_impl/movie_list_repo_impl.dart' as _i318;
import '../../data/repo_impl/movie_page_repo_impl.dart' as _i617;
import '../../data/repo_impl/register_repo_impl.dart' as _i357;
import '../../repository/forget_password_repo.dart' as _i479;
import '../../repository/login_repo.dart' as _i5;
import '../../repository/movie_details_repo.dart' as _i712;
import '../../repository/movie_list_repo.dart' as _i26;
import '../../repository/movie_page_repo.dart' as _i948;
import '../../repository/register_repo.dart' as _i680;
import '../../ui/Auth/forgetPassword/viewModel/forget_password_viewModel.dart'
    as _i790;
import '../../ui/Auth/login/viewModel/login_view_model.dart' as _i610;
import '../../ui/Auth/register/viewModel/register_view_model.dart' as _i935;
import '../../ui/home/tabs/home_tab/viewModel/movie_list_view_model.dart'
    as _i725;
import '../../ui/home/tabs/home_tab/viewModel/movie_page_view_model.dart'
    as _i667;
import '../../ui/movieDetails/viewModel/movie_details_view_model.dart' as _i216;
import '../remote/api/api_manager.dart' as _i384;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i384.ApiManager>(() => _i384.ApiManager());
    gh.factory<_i985.RegisterDao>(() => _i463.RegisterDaoImpl());
    gh.factory<_i103.MoviePageDao>(
      () => _i866.MoviePageApiDaoImpl(gh<_i384.ApiManager>()),
    );
    gh.factory<_i814.ForgetPasswordDao>(() => _i957.ForgetPassDaoImpl());
    gh.factory<_i810.MovieDetailsDao>(
      () => _i934.MovieDetailsApiDaoImpl(gh<_i384.ApiManager>()),
    );
    gh.factory<_i529.LoginDao>(() => _i990.LoginDaoImpl());
    gh.factory<_i317.MovieListDao>(
      () => _i827.MovieListApiDaoImpl(gh<_i384.ApiManager>()),
    );
    gh.factory<_i479.ForgetPasswordRepo>(
      () => _i1051.ForgetPasswordRepoImpl(gh<_i814.ForgetPasswordDao>()),
    );
    gh.factory<_i5.LoginRepo>(
      () => _i886.LoginRepoImpl(loginDao: gh<_i529.LoginDao>()),
    );
    gh.factory<_i610.LoginViewModel>(
      () => _i610.LoginViewModel(gh<_i5.LoginRepo>()),
    );
    gh.factory<_i712.MovieDetailsRepo>(
      () => _i951.MovieDetailsRepoImpl(gh<_i810.MovieDetailsDao>()),
    );
    gh.factory<_i680.RegisterRepo>(
      () => _i357.RegisterRepoImpl(gh<_i985.RegisterDao>()),
    );
    gh.factory<_i948.MoviePageRepo>(
      () => _i617.MoviePageRepoImpl(gh<_i103.MoviePageDao>()),
    );
    gh.factory<_i216.MovieDetailsViewModel>(
      () => _i216.MovieDetailsViewModel(gh<_i712.MovieDetailsRepo>()),
    );
    gh.factory<_i935.RegisterViewModel>(
      () => _i935.RegisterViewModel(gh<_i680.RegisterRepo>()),
    );
    gh.factory<_i26.MovieListRepo>(
      () => _i318.MovieListRepoImpl(gh<_i317.MovieListDao>()),
    );
    gh.factory<_i725.MovieListViewModel>(
      () => _i725.MovieListViewModel(gh<_i26.MovieListRepo>()),
    );
    gh.factory<_i790.ForgetPasswordViewmodel>(
      () => _i790.ForgetPasswordViewmodel(gh<_i479.ForgetPasswordRepo>()),
    );
    gh.factory<_i667.MoviePageViewModel>(
      () => _i667.MoviePageViewModel(gh<_i948.MoviePageRepo>()),
    );
    return this;
  }
}
