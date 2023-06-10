import 'package:flight_booking/core/components/widgets/extension/context_extension.dart';
import 'package:flight_booking/presentations/payment/view/tabs/book_payment_tab.dart';
import 'package:flight_booking/presentations/payment/view/tabs/confiirm_infomation_tab.dart';
import 'package:flight_booking/presentations/payment/view/tabs/paymnet_tab.dart';
import 'package:flight_booking/presentations/payment/view/widgets/price_summary_cad.dart';
import 'package:flight_booking/presentations/payment/view/widgets/tic_information.dart';
import 'package:flutter/material.dart';
import '../../customer/views/widgets/customer_detail_card.dart';
import 'widgets/flight_summary_card.dart';

const _maxWidthDevice = 1200;

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPage(int index) {
    _pageIndex.value = _pageIndex.value + 1;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final hintColor = Theme.of(context).hintColor;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder(
            valueListenable: _pageIndex,
            builder: (context, pageIndex, child) {
              return Container(
                width: context.widthDevice > _maxWidthDevice
                    ? context.widthDevice / 2
                    : double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.document_scanner,
                      color: primaryColor,
                      size: 30.0,
                    ),
                    const SizedBox(width: 10.0),
                    Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 6.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: hintColor.withOpacity(0.2),
                              ),
                            ),
                            Icon(Icons.airplane_ticket,
                                color: hintColor, size: 20)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              constraints: const BoxConstraints(maxWidth: 300),
                              duration: const Duration(milliseconds: 300),
                              width: 300.0 * pageIndex * 1.0,
                              height: 6.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: primaryColor,
                              ),
                            ),
                            Icon(Icons.airplane_ticket,
                                color: primaryColor, size: 20)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    Icon(
                      Icons.payments,
                      color: pageIndex > 0 ? primaryColor : hintColor,
                      size: 30.0,
                    ),
                    const SizedBox(width: 10.0),
                    Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 6.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: hintColor.withOpacity(0.2),
                              ),
                            ),
                            Icon(Icons.airplane_ticket,
                                color: hintColor, size: 20)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              constraints: const BoxConstraints(maxWidth: 300),
                              width: pageIndex > 1
                                  ? 300.0 * (pageIndex - 1) * 1.0
                                  : 0,
                              height: 6.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: primaryColor,
                              ),
                            ),
                            Icon(Icons.airplane_ticket,
                                color: pageIndex > 0 ? primaryColor : hintColor,
                                size: 20)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    Icon(
                      Icons.check_circle_outline_sharp,
                      color: pageIndex == 2 ? primaryColor : hintColor,
                      size: 30.0,
                    ),
                  ],
                ),
              );
            }),
      ),
      body: Row(
        children: [
          if (context.widthDevice > _maxWidthDevice) ...[
            Container(
              width: 450,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: context.heightDevice,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  TicInformation(),
                  FlightSummaryCard(),
                  CustomerTicketInformationCard(),
                  PriceSummaryCard(),
                ],
              ),
            ),
          ],
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) => [
                BookPaymentTab(onNextPage: () => _onNextPage(1)),
                PaymentTab(onNextPage: () => _onNextPage(2)),
                ConfirmInformationTab(),
              ][index],
            ),
          ),
        ],
      ),
    );
  }
}