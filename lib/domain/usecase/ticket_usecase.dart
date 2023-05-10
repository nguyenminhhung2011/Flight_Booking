import 'package:flight_booking/domain/entities/ticket/ticket.dart';
import 'package:flight_booking/domain/repositories/ticket_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TicketUsecase {
  final TicketRepository _listTicketRepository;
  TicketUsecase(this._listTicketRepository);
  Future<List<Ticket>> fetchAllTickets() async {
    return await _listTicketRepository.getListTicket() ?? [];
  }
}