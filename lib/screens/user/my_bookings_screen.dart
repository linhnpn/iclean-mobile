import 'package:flutter/material.dart';
import 'package:iclean_flutter/constant/order_status_constants.dart';
import 'package:iclean_flutter/screens/user/components/my_booking/cancelled_card.dart';
import 'package:iclean_flutter/screens/user/components/my_booking/completed_card.dart';
import 'package:iclean_flutter/screens/user/components/my_booking/pending_card.dart';
import 'package:iclean_flutter/screens/user/components/my_booking/upcoming_card.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener((_handleTabSelection));
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Booking",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade300,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.deepPurple.shade300,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 2, color: Colors.deepPurple.shade300),
                    ),
                    tabs: const [
                      Tab(text: 'Pending'),
                      Tab(text: 'Upcoming'),
                      Tab(text: 'Completed'),
                      Tab(text: 'Cancelled'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: const TabBarView(
                      children: [
                        PendingCard(status: OrderStatus.UNDONE),
                        UpcomingCard(status: OrderStatus.UPCOMING),
                        CompletedCard(status: OrderStatus.DONE),
                        CancelledCard(status: OrderStatus.CANCEL),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
