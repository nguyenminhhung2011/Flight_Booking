import 'dart:developer';

import 'package:flight_booking/app_coordinator.dart';
import 'package:flight_booking/domain/entities/airport/airport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/widgets/flux_table/flux_table_row.dart';
import '../../../core/components/widgets/flux_table/flux_ticket_table.dart';
import '../../../core/components/widgets/mobile/button_custom.dart';
import '../../../core/config/color_config.dart';
import '../../../generated/l10n.dart';
import '../bloc/airport_bloc.dart';
import 'airport_fast_view.dart';

class AirportScreen extends StatefulWidget {
  const AirportScreen({super.key});

  @override
  State<AirportScreen> createState() => _AirportScreenState();
}

class _AirportScreenState extends State<AirportScreen> {
  late final textController;

  AirportBloc get _bloc => BlocProvider.of<AirportBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(const AirportEvent.onStarted());
    _bloc.add(const AirportEvent.fetchAirports());
    textController = TextEditingController();
  }

  void _listenStateChange(BuildContext context, AirportState state) {
    state.whenOrNull(openAddEditAirportSuccess: (state, id) {
      final result = context.openDialogAdDEditAirport(id);
      if (result is Airport) {}
    }, fetchAirportsFailed: (data, error) {
      log(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AirportBloc, AirportState>(
      listener: _listenStateChange,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Row(
            children: [
              AirportMainScreen(state: state),
              Breakpoints.large.isActive(context)
                  ? AirportFastView(state: state)
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}

class AirportMainScreen extends StatefulWidget {
  final AirportState state;
  const AirportMainScreen({
    super.key,
    required this.state,
  });

  @override
  State<AirportMainScreen> createState() => _AirportMainScreenState();
}

class _AirportMainScreenState extends State<AirportMainScreen> {
  void openAddEditFlightDialog(String id) {
    context.read<AirportBloc>().add(AirportEvent.openAddEditAirportForm(id));
  }

  void deleteAirport(String id) {
    context.read<AirportBloc>().add(AirportEvent.deleteAirport(id));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).airport,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                ),
                ButtonCustom(
                  width: 150,
                  height: 35,
                  radius: 5,
                  child: Text(S.of(context).addNewAirport),
                  onPress: () => openAddEditFlightDialog(''),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: FluxTicketTable<Airport>(
              padding: const EdgeInsets.all(10),
              titleRow: FluxTableRow(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                rowDecoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                itemBuilder: (data, index) {
                  return Text(
                    data.toString(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  );
                },
                rowData: [
                  FlexRowTableData<String>(flex: 1, data: S.of(context).id),
                  FlexRowTableData<String>(flex: 1, data: S.of(context).name),
                  FlexRowTableData<String>(flex: 1, data: S.of(context).image),
                  FlexRowTableData<String>(
                      flex: 1, data: S.of(context).location),
                  FlexRowTableData<String>(
                      flex: 1, data: S.of(context).actions),
                ],
              ),
              data: [
                for (int i = 0; i < 50; i++)
                  const Airport(
                    id: 100,
                    name: 'Ben Xe Mien Dong',
                    image:
                        'https://media.cnn.com/api/v1/images/stellar/prod/230314215301-03-world-best-airports-2023.jpg?c=original&q=w_1280,c_fill',
                    location: 'Duong Pham Van Dong, quan Binh Thanh ',
                  )
              ],
              rowBuilder: (data) {
                return FluxTableRow(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  itemBuilder: (data, index) {
                    if (index == 3) {
                      return Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(width: 5),
                          Expanded(
                              child: Text(
                            data as String,
                            maxLines: 1,
                          )),
                        ],
                      );
                    } else if (index == 2) {
                      return Container(
                        width: 80.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(data),
                          ),
                        ),
                      );
                    } else if (index == 4) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => openAddEditFlightDialog('id'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CommonColor
                                    .primaryColor, // Background color
                              ),
                              child: Text(
                                S.of(context).edit,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            ElevatedButton(
                              onPressed: () => deleteAirport('null'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red, // Background color
                              ),
                              child: Text(S.of(context).delete, maxLines: 1),
                            )
                          ],
                        ),
                      );
                    }
                    return Text(data.toString());
                  },
                  rowData: [
                    FlexRowTableData<String>(flex: 1, data: data.id.toString()),
                    FlexRowTableData<String>(flex: 1, data: data.name),
                    FlexRowTableData<String>(flex: 1, data: data.image),
                    FlexRowTableData<String>(flex: 1, data: data.location),
                    FlexRowTableData<String>(flex: 1, data: ''),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
