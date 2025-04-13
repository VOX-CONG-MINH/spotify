// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pos/data/data.dart' as _i879;
import 'package:pos/data/mapper/song_data_mapper.dart' as _i14;
import 'package:pos/data/mapper/user_data_mapper.dart' as _i1057;
import 'package:pos/data/repository/repository_impl.dart' as _i689;
import 'package:pos/data/services/app_supabase_services.dart' as _i752;
import 'package:pos/domain/domain.dart' as _i800;
import 'package:pos/domain/usecases/login_usecase/log_in_use_case.dart'
    as _i596;
import 'package:pos/domain/usecases/news_song_use_case/get_news_songs_use_case.dart'
    as _i34;
import 'package:pos/domain/usecases/playlist_song_use_case/get_playlist_use_case.dart'
    as _i506;
import 'package:pos/domain/usecases/register_usecase/register_use_case.dart'
    as _i470;
import 'package:pos/domain/usecases/rm_or_add_favorite_song_usecase/rm_or_add_favorite_song_use_case.dart'
    as _i150;
import 'package:pos/ui/core/widgets/favorite_button/bloc/favorite_bloc.dart'
    as _i209;
import 'package:pos/ui/home/bloc/home_page_bloc.dart' as _i286;
import 'package:pos/ui/login/bloc/login_page_bloc.dart' as _i526;
import 'package:pos/ui/main_screen/bloc/main_screen_bloc.dart' as _i1040;
import 'package:pos/ui/profile/bloc/theme_bloc.dart' as _i330;
import 'package:pos/ui/register/bloc/register_bloc.dart' as _i237;
import 'package:pos/ui/song_play/bloc/song_play_bloc.dart' as _i254;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i14.SongDataMapper>(() => const _i14.SongDataMapper());
    gh.factory<_i1057.UserDataMapper>(() => const _i1057.UserDataMapper());
    gh.factory<_i1040.MainScreenBloc>(() => _i1040.MainScreenBloc());
    gh.factory<_i330.ThemeBloc>(() => _i330.ThemeBloc());
    gh.factory<_i254.SongPlayBloc>(() => _i254.SongPlayBloc());
    gh.lazySingleton<_i752.AppSupabaseServices>(
        () => _i752.AppSupabaseServices(gh<_i454.SupabaseClient>()));
    gh.lazySingleton<_i800.Repository>(() => _i689.RepositoryImpl(
          gh<_i879.AppSupabaseServices>(),
          gh<_i879.SongDataMapper>(),
        ));
    gh.factory<_i596.LogInUseCase>(
        () => _i596.LogInUseCase(gh<_i800.Repository>()));
    gh.factory<_i34.GetNewsSongsUseCase>(
        () => _i34.GetNewsSongsUseCase(gh<_i800.Repository>()));
    gh.factory<_i506.GetPlaylistUseCase>(
        () => _i506.GetPlaylistUseCase(gh<_i800.Repository>()));
    gh.factory<_i470.RegisterUseCase>(
        () => _i470.RegisterUseCase(gh<_i800.Repository>()));
    gh.factory<_i150.RmOrAddFavoriteSongUseCase>(
        () => _i150.RmOrAddFavoriteSongUseCase(gh<_i800.Repository>()));
    gh.factory<_i526.LoginPageBloc>(
        () => _i526.LoginPageBloc(gh<_i800.LogInUseCase>()));
    gh.factory<_i209.FavoriteBloc>(
        () => _i209.FavoriteBloc(gh<_i800.RmOrAddFavoriteSongUseCase>()));
    gh.factory<_i237.RegisterPageBloc>(
        () => _i237.RegisterPageBloc(gh<_i800.RegisterUseCase>()));
    gh.factory<_i286.HomePageBloc>(() => _i286.HomePageBloc(
          gh<_i800.GetNewsSongsUseCase>(),
          gh<_i800.GetPlaylistUseCase>(),
        ));
    return this;
  }
}
