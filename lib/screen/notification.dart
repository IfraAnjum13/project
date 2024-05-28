import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/screen/order_detail_card_widget.dart';
import 'order.model.dart' as orderModel;

class NotificationScreen extends StatelessWidget {
  //final Map<String, dynamic> orderDetails; // Define orderDetails variable

  //NotificationScreen({Key? key, required this.orderDetails}) : super(key: key); // Constructor to receive orderDetails

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          backgroundColor: Colors.pink,
        ),
        body: FirebaseAuth.instance.currentUser != null
            ? StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('orders')
                    .orderBy('orderDate', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong!'),
                    );
                  }
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final orderMap = snapshot.data!.docs[index];
                      final order = orderModel.Order.fromJson(orderMap.data());
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4),
                        child: OrderCard(
                          docId: orderMap.id,
                          orderId: order.orderId,
                          name: order.name,
                          address: order.address,
                          phone: order.phone,
                          orderDate: order.orderDate,
                          method: order.method,
                          total: order.total,
                          orderStatus: order.statusCode == 0
                              ? 'Pending'
                              : order.statusCode == 1
                                  ? 'Completed'
                                  : 'Canceled',
                          orderDetails: order.orderDetails,
                        ),
                      );
                    },
                  );
                })
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          CupertinoPageRoute(builder: (ctx) => LoginScreen()));
                    },
                    child: const Text('Login to see order details'),
                  ),
                ),
              ),
      ),
    );
  }
}
