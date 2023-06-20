// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/remote/airline/airline_api.dart' as _i28;
import '../../data/datasource/remote/airport/airport_api.dart' as _i32;
import '../../data/datasource/remote/auth/auth_api.dart' as _i36;
import '../../data/datasource/remote/flight/flight_api.dart' as _i12;
import '../../data/datasource/remote/ticket/ticket_api.dart' as _i24;
import '../../data/repositories/airline_repository_impl.dart' as _i30;
import '../../data/repositories/airport_repository_impl.dart' as _i34;
import '../../data/repositories/customer_repository_impl.dart' as _i7;
import '../../data/repositories/flight_repository_impl.dart' as _i15;
import '../../data/repositories/ticket_repository_impl.dart' as _i26;
import '../../data/repositories/user_repository_impl.dart' as _i46;
import '../../domain/repositories/airline_repository.dart' as _i29;
import '../../domain/repositories/airport_repository.dart' as _i33;
import '../../domain/repositories/customer_repository.dart' as _i6;
import '../../domain/repositories/flight_repository.dart' as _i14;
import '../../domain/repositories/ticket_repository.dart' as _i25;
import '../../domain/repositories/user_repository.dart' as _i45;
import '../../domain/usecase/airline_usecase.dart' as _i31;
import '../../domain/usecase/airport_usecase.dart' as _i35;
import '../../domain/usecase/customer_usecase.dart' as _i8;
import '../../domain/usecase/flight_usecase.dart' as _i16;
import '../../domain/usecase/ticket_usecase.dart' as _i27;
import '../../domain/usecase/user_usecase.dart' as _i47;
import '../../presentations/add_edit_airport/bloc/add_edit_airport_bloc.dart'
    as _i49;
import '../../presentations/add_edit_flight/bloc/add_edit_flight_bloc.dart'
    as _i50;
import '../../presentations/airport/bloc/airport_bloc.dart' as _i51;
import '../../presentations/customer/bloc/customer_bloc.dart' as _i37;
import '../../presentations/customer_detail/bloc/customer_detail_bloc.dart'
    as _i5;
import '../../presentations/dashboard/bloc/dashboard_bloc.dart' as _i9;
import '../../presentations/flight_detail/bloc/flight_detail_bloc.dart' as _i38;
import '../../presentations/handle_config_airport/blocs/handle_config_airport_bloc.dart'
    as _i39;
import '../../presentations/list_flight/bloc/list_flight_bloc.dart' as _i40;
import '../../presentations/list_ticket/bloc/list_ticket_bloc.dart' as _i41;
import '../../presentations/login/bloc/authentication_bloc.dart' as _i54;
import '../../presentations/payment_detail/bloc/payment_detail_bloc.dart'
    as _i19;
import '../../presentations/payment_management/bloc/payment_bloc.dart' as _i18;
import '../../presentations/settings/bloc/accout/account_setting_bloc.dart'
    as _i48;
import '../../presentations/settings/bloc/general/general_setting_bloc.dart'
    as _i55;
import '../../presentations/settings/bloc/setting_bloc.dart' as _i23;
import '../../presentations_mobile/airport_detail_mobile/bloc/airport_detail_mobile_bloc.dart'
    as _i3;
import '../../presentations_mobile/auth/bloc/auth_bloc.dart' as _i53;
import '../../presentations_mobile/dashboard_mobile/bloc/dashboard_mobile_bloc.dart'
    as _i10;
import '../../presentations_mobile/flight_history_detail/bloc/flight_history_detail_bloc.dart'
    as _i13;
import '../../presentations_mobile/list_airport_mobile/bloc/airport_mobile_bloc.dart'
    as _i52;
import '../../presentations_mobile/save/bloc/save_bloc.dart' as _i21;
import '../../presentations_mobile/search_mobile/bloc/search_mobile_bloc.dart'
    as _i42;
import '../../presentations_mobile/select_scott_mobile/bloc/select_scott_bloc.dart'
    as _i22;
import '../../presentations_mobile/ticket_mobile/bloc/tic_mobile_bloc.dart'
    as _i44;
import '../components/enum/search_enum.dart' as _i43;
import '../services/cloundinary_service.dart' as _i4;
import '../services/image_pic_service.dart' as _i17;
import '../services/place/place_service.dart' as _i20;
import 'modules/data_source_module.dart' as _i56;

const String _prod = 'prod';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dataSourceModule = _$DataSourceModule();
  gh.factory<_i3.AirportDetailMobileBloc>(() => _i3.AirportDetailMobileBloc());
  gh.factory<_i4.CloundinaryService>(() => _i4.CloundinaryService());
  gh.factory<_i5.CustomerDetailBloc>(() => _i5.CustomerDetailBloc());
  gh.factory<_i6.CustomerRepository>(() => _i7.CustomerRepositoryImpl());
  gh.factory<_i8.CustomerUseCase>(
      () => _i8.CustomerUseCase(gh<_i6.CustomerRepository>()));
  gh.factory<_i9.DashboardBloc>(() => _i9.DashboardBloc());
  gh.factory<_i10.DashboardMobileBloc>(() => _i10.DashboardMobileBloc());
  gh.factory<_i11.Dio>(
    () => dataSourceModule.dioProd(),
    registerFor: {_prod},
  );
  gh.factory<_i12.FlightApi>(() => _i12.FlightApi(gh<_i11.Dio>()));
  gh.factoryParam<_i13.FlightHistoryDetailBloc, String, dynamic>((
    id,
    _,
  ) =>
      _i13.FlightHistoryDetailBloc(id));
  gh.factory<_i14.FlightRepository>(
      () => _i15.FlightRepositoryImpl(gh<_i12.FlightApi>()));
  gh.factory<_i16.FlightsUsecase>(
      () => _i16.FlightsUsecase(gh<_i14.FlightRepository>()));
  gh.factory<_i17.ImagePicService>(() => _i17.ImagePicService());
  gh.factory<_i18.PaymentBloc>(() => _i18.PaymentBloc());
  gh.factory<_i19.PaymentDetailBloc>(
      () => _i19.PaymentDetailBloc(gh<String>()));
  gh.factory<_i20.PlaceService>(() => _i20.PlaceService());
  gh.factory<_i21.SaveBloc>(() => _i21.SaveBloc());
  gh.factory<_i22.SelectScottBloc>(() => _i22.SelectScottBloc());
  gh.factory<_i23.SettingBloc>(() => _i23.SettingBloc());
  gh.factory<_i24.TicketApi>(() => _i24.TicketApi(gh<_i11.Dio>()));
  gh.factory<_i25.TicketRepository>(
      () => _i26.TicketRepositoryImpl(gh<_i24.TicketApi>()));
  gh.factory<_i27.TicketUsecase>(
      () => _i27.TicketUsecase(gh<_i25.TicketRepository>()));
  gh.factory<_i28.AirlineApi>(() => _i28.AirlineApi(gh<_i11.Dio>()));
  gh.factory<_i29.AirlineRepository>(
      () => _i30.AirlineRepositoryImpl(gh<_i28.AirlineApi>()));
  gh.factory<_i31.AirlineUsecase>(
      () => _i31.AirlineUsecase(gh<_i29.AirlineRepository>()));
  gh.factory<_i32.AirportApi>(() => _i32.AirportApi(gh<_i11.Dio>()));
  gh.factory<_i33.AirportRepository>(
      () => _i34.AirportRepositoryImpl(gh<_i32.AirportApi>()));
  gh.factory<_i35.AirportUsecase>(
      () => _i35.AirportUsecase(gh<_i33.AirportRepository>()));
  gh.factory<_i36.AuthApi>(() => _i36.AuthApi(gh<_i11.Dio>()));
  gh.factory<_i37.CustomerBloc>(
      () => _i37.CustomerBloc(gh<_i8.CustomerUseCase>()));
  gh.factoryParam<_i38.FlightDetailBloc, int, dynamic>((
    flightId,
    _,
  ) =>
      _i38.FlightDetailBloc(
        flightId,
        gh<_i16.FlightsUsecase>(),
      ));
  gh.factoryParam<_i39.HandleConfigAirportBloc, int, dynamic>((
    airportId,
    _,
  ) =>
      _i39.HandleConfigAirportBloc(
        airportId,
        gh<_i35.AirportUsecase>(),
        gh<_i16.FlightsUsecase>(),
      ));
  gh.factory<_i40.ListFlightBloc>(() => _i40.ListFlightBloc(
        gh<_i16.FlightsUsecase>(),
        gh<_i20.PlaceService>(),
        gh<_i31.AirlineUsecase>(),
      ));
  gh.factory<_i41.ListTicketBloc>(
      () => _i41.ListTicketBloc(gh<_i27.TicketUsecase>()));
  gh.factoryParam<_i42.SearchMobileBloc, _i43.SearchEnum?, dynamic>((
    searchType,
    _,
  ) =>
      _i42.SearchMobileBloc(
        searchType,
        gh<_i35.AirportUsecase>(),
        gh<_i16.FlightsUsecase>(),
      ));
  gh.factory<_i44.TicMobileBloc>(
      () => _i44.TicMobileBloc(gh<_i27.TicketUsecase>()));
  gh.factory<_i45.UserRepository>(
      () => _i46.UserRepositoryImpl(gh<_i36.AuthApi>()));
  gh.factory<_i47.UserUseCase>(
      () => _i47.UserUseCase(gh<_i45.UserRepository>()));
  gh.factory<_i48.AccountSettingBloc>(
      () => _i48.AccountSettingBloc(gh<_i47.UserUseCase>()));
  gh.factoryParam<_i49.AddEditAirportBloc, String, dynamic>((
    airportId,
    _,
  ) =>
      _i49.AddEditAirportBloc(
        airportId,
        gh<_i35.AirportUsecase>(),
        gh<_i4.CloundinaryService>(),
        gh<_i17.ImagePicService>(),
        gh<_i20.PlaceService>(),
      ));
  gh.factoryParam<_i50.AddEditFlightBloc, String, dynamic>((
    flightId,
    _,
  ) =>
      _i50.AddEditFlightBloc(
        flightId,
        gh<_i16.FlightsUsecase>(),
        gh<_i35.AirportUsecase>(),
        gh<_i31.AirlineUsecase>(),
      ));
  gh.factory<_i51.AirportBloc>(() => _i51.AirportBloc(
        gh<_i35.AirportUsecase>(),
        gh<_i16.FlightsUsecase>(),
      ));
  gh.factory<_i52.AirportMobileBloc>(
      () => _i52.AirportMobileBloc(gh<_i35.AirportUsecase>()));
  gh.factory<_i53.AuthBloc>(() => _i53.AuthBloc(gh<_i45.UserRepository>()));
  gh.factory<_i54.AuthenticationBloc>(
      () => _i54.AuthenticationBloc(gh<_i47.UserUseCase>()));
  gh.factory<_i55.GeneralSettingBloc>(
      () => _i55.GeneralSettingBloc(gh<_i47.UserUseCase>()));
  return getIt;
}

class _$DataSourceModule extends _i56.DataSourceModule {}
