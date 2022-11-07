import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:hotel_traffic_controller/user_part/screens/fill_details_screen.dart';

class HotelDetails extends StatefulWidget {
  Map val;
  var index;

  HotelDetails({
    Key? key,
    required this.val,
    required this.index,
  }) : super(key: key);

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  late String dropdownValue = widget.val.keys.first;
  late List key = widget.val.keys.toList();
  late List<String> list = key as List<String>;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hotel_Details",
            style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 10, 6, 0),
                fontWeight: FontWeight.w700),
          ),
          backgroundColor: const Color(0xff3D7ABE),
          // foregroundColor: Colors.black,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Hotels Names')
                .orderBy(
                  'name',
                )
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 230,
                          width: 600,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff3D7ABE),
                          ),
                          child: Image.network(
                            'https://www.uengage.in/images/addo/logos/logo-5-1600769708.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Address',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  streamSnapshot.data!.docs[widget.index]
                                      ['address'],
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 15.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              'Restaurant table \nrange',
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              // height: 50,
                              width: 70,

                              child: DropdownButton<String>(
                                value: dropdownValue,
                                // iconSize: 28,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                // elevation: 10,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700),
                                isExpanded: true,

                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 600,
                          width: 350,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1.0,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                            ),
                            itemCount:
                                widget.val[dropdownValue]['table no'].length,
                            itemBuilder: (context, index) => SizedBox(
                              // height: 600,
                              //width: 200,
                              child: InkWell(
                                onTap: () {
                                  print(widget.val[dropdownValue]['table no']
                                      [index]);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FillDetailsScreen(
                                            table_no: widget.val[dropdownValue]
                                                ['table no'][index],hotelName: streamSnapshot.data!.docs[widget.index]['name'],)),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  color: Colors.white,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),

                                  //shape: const CircleBorder(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const SizedBox(width: 8.0),
                                      const Icon(
                                        Icons.table_restaurant,
                                        color: Color(0xff3D7ABE),
                                        size: 40,
                                      ),
                                      Text(
                                        '${widget.val[dropdownValue]['table no'][index]}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 8.0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            }));
  }
}
