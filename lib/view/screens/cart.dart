import 'package:flutter/material.dart';
import 'package:m_shopping/view/app_data/app_colors.dart';
import 'package:m_shopping/view/widgets/custom_buttom.dart';

class Cart extends StatefulWidget {
  List cartItems = [];
  Cart({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalPrice = 0.00;
  @override
  void initState() {
    super.initState();
    print(widget.cartItems.length);
    widget.cartItems.forEach((element) {
      double addedPrice = double.parse(element["price"].toString());
      totalPrice = totalPrice + addedPrice;
      print("Total :" + totalPrice.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGrey,
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: ListView.builder(
          itemCount: widget.cartItems.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.network("${widget.cartItems[index]["image"]}"),
              ),
              title: Text("${widget.cartItems[index]["title"]}"),
              subtitle: Text("\u20B9 ${widget.cartItems[index]["price"]}"),
              trailing: GestureDetector(
                  onTap: () {
                    print("delete tapped");
                    print(widget.cartItems[index]);

                    widget.cartItems.removeAt(index);
                    print(widget.cartItems.length);
                    double tPrice = 0.0;
                    for (int i = 0; i < widget.cartItems.length; i++) {
                      tPrice = tPrice +
                          double.parse(widget.cartItems[i]["price"].toString());
                    }
                    totalPrice = tPrice;
                    // totalPrice = totalPrice -
                    //     double.parse(
                    //         widget.cartItems[index]["price"].toString());
                    // widget.cartItems
                    //     .removeWhere((element) => element['id'] == 5);

                    // (element) => element.length == widget.cartItems[index]);
                    setState(() {});
                  },
                  child: Icon(Icons.delete)),
            );
          })),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Total Price: \u20B9 " +
                num.parse(totalPrice.toStringAsFixed(2)).toString()),
            CustomButton(
                buttonHeight: 30, buttonWidth: 100, text: Text("Checkout"))
          ],
        ),
      ),
    );
  }
}
