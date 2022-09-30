import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RoutineWebPage extends StatefulWidget {
  final String qorderBy;
  final String qequalTo;

  const RoutineWebPage({
    Key? key,
    required this.qorderBy,
    required this.qequalTo,
  }) : super(key: key);

  @override
  State<RoutineWebPage> createState() => _RoutineWebPageState();
}

class _RoutineWebPageState extends State<RoutineWebPage>
    with SingleTickerProviderStateMixin {
  Future<DatabaseEvent> getData() async {
    final dbRef = FirebaseDatabase.instance
        .ref()
        .child('Routine')
        .orderByChild(widget.qorderBy)
        .equalTo(widget.qequalTo);

    return await dbRef.once();
  }

  TextEditingController controller = TextEditingController();
  late AnimationController animationController;

  List<Map<dynamic, dynamic>> lists = [];

  int key2 = 0;
  String link = '';

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);

    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        animationController.reset();

        hyperlink();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      backgroundColor: const Color(0xFF1D63A3),
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: <Color>[
                  Color(0xFFF8B7CD),
                  // Color(0xFFF6D2E0),
                  Color(0xFF67A3D9),
                  Color(0xFF0671B7),
                  Color(0xFF1D63A3),
                  // Color(0xFF013169),
                ],
              ),
            ),
          ),
          // backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('${widget.qequalTo} Routines',
              style: const TextStyle(
                fontFamily: 'Proxima',
                fontSize: 27,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black87,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ))),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/dark.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: CupertinoSearchTextField(
                    backgroundColor: Colors.white,
                    placeholder: 'Search...',
                    itemSize: 16,
                    itemColor: CupertinoColors.activeBlue,
                    suffixIcon: const Icon(CupertinoIcons.delete),
                    style: const TextStyle(
                      fontFamily: 'Proxima',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      print(value);
                      setState(() {});
                    },
                    onSubmitted: (value) {},
                    controller: controller,
                  ),
                ),
                Expanded(
                  child: FutureBuilder<DatabaseEvent>(
                    future: getData(),
                    builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                      if (snapshot.hasData && !snapshot.hasError) {
                        lists.clear();

                        final values = snapshot.data?.snapshot.value
                            as Map<dynamic, dynamic>;
                        values.forEach((key, values) {
                          lists.add(values);
                        });

                        return Center(
                          child: ListView.builder(
                            itemCount: lists.length,
                            itemBuilder: (context, index) {
                              String name = lists[index]
                                      ['Routine_Description'] +
                                  lists[index]['Routine_Name'] +
                                  lists[index]['NumberOfAction'] +
                                  lists[index]['Category'];

                              if (controller.text.isEmpty) {
                                return InkWell(
                                  onTap: () {
                                    // This Will Call When User Click On ListView Item
                                    showDialogFunc(
                                      context,
                                      lists[index]['Images'],
                                      lists[index]['Routine_Name'],
                                      lists[index]['Routine_Description'],
                                      lists[index]['URL'],
                                      lists[index]['NumberOfAction'],
                                      lists[index]['Device_Trigger'],
                                      lists[index]['Trigger_Group'],
                                      lists[index]['Device_Group'],
                                      lists[index]['Action_Group'],
                                      lists[index]['Active_Days'],
                                      lists[index]['Category'],
                                      lists[index]['NumberOfAction'],
                                    );
                                  },
                                  // Card Which Holds Layout Of ListView Item
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFF8B7CD),
                                            // Color(0xFFF6D2E0),
                                            // Color(0xFF67A3D9),
                                            Color(0xFF0671B7),
                                            Color(0xFF1D63A3),
                                            // Color(0xFF013169),
                                          ],
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 125,
                                            height: 125,
                                            child: Image.asset(
                                              lists[index]['Images'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Colors.white,
                                                          spreadRadius: 2),
                                                    ],
                                                  ),
                                                  child: Text(
                                                    '${lists[index]['NumberOfAction']} Action',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Proxima',
                                                      fontSize: 13,
                                                      background: Paint()
                                                        ..strokeWidth = 13
                                                        ..color = lists[index][
                                                                    'NumberOfAction'] ==
                                                                'Single'
                                                            ? Colors.pinkAccent
                                                            : const Color(
                                                                0xFF1D63A3)
                                                        ..strokeJoin =
                                                            StrokeJoin.round
                                                        ..strokeCap =
                                                            StrokeCap.round
                                                        ..style = PaintingStyle
                                                            .stroke,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  lists[index]['Routine_Name'],
                                                  style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.black87,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                SizedBox(
                                                  width: width,
                                                  child: Text(
                                                    lists[index]
                                                        ['Routine_Description'],
                                                    maxLines: 3,
                                                    style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      shadows: [
                                                        Shadow(
                                                          blurRadius: 10.0,
                                                          color: Colors.black87,
                                                          offset:
                                                              Offset(5.0, 5.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                SizedBox(
                                                  width: width,
                                                  child: Text(
                                                    'Tag: ${lists[index]['Category']}',
                                                    maxLines: 3,
                                                    style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      shadows: [
                                                        Shadow(
                                                          blurRadius: 10.0,
                                                          color: Colors.black54,
                                                          offset:
                                                              Offset(5.0, 5.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else if (name
                                  .toLowerCase()
                                  .contains(controller.text.toLowerCase())) {
                                return InkWell(
                                  onTap: () {
                                    // This Will Call When User Click On ListView Item
                                    showDialogFunc(
                                      context,
                                      lists[index]['Images'],
                                      lists[index]['Routine_Name'],
                                      lists[index]['Routine_Description'],
                                      lists[index]['URL'],
                                      lists[index]['NumberOfAction'],
                                      lists[index]['Device_Trigger'],
                                      lists[index]['Trigger_Group'],
                                      lists[index]['Device_Group'],
                                      lists[index]['Action_Group'],
                                      lists[index]['Active_Days'],
                                      lists[index]['Category'],
                                      lists[index]['NumberOfAction'],
                                    );
                                  },
                                  // Card Which Holds Layout Of ListView Item
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFF8B7CD),
                                            // Color(0xFFF6D2E0),
                                            // Color(0xFF67A3D9),
                                            Color(0xFF0671B7),
                                            Color(0xFF1D63A3),
                                            // Color(0xFF013169),
                                          ],
                                          begin: Alignment.bottomRight,
                                          end: Alignment.topLeft,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 125,
                                            height: 125,
                                            child: Image.asset(
                                              lists[index]['Images'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Colors.white,
                                                          spreadRadius: 2),
                                                    ],
                                                  ),
                                                  child: Text(
                                                    '${lists[index]['NumberOfAction']} Action',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Proxima',
                                                      fontSize: 13,
                                                      background: Paint()
                                                        ..strokeWidth = 13
                                                        ..color = lists[index][
                                                                    'NumberOfAction'] ==
                                                                'Single'
                                                            ? Colors.pinkAccent
                                                            : const Color(
                                                                0xFF1D63A3)
                                                        ..strokeJoin =
                                                            StrokeJoin.round
                                                        ..strokeCap =
                                                            StrokeCap.round
                                                        ..style = PaintingStyle
                                                            .stroke,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  lists[index]['Routine_Name'],
                                                  style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.black87,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                SizedBox(
                                                  width: width,
                                                  child: Text(
                                                    lists[index]
                                                        ['Routine_Description'],
                                                    maxLines: 3,
                                                    style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      shadows: [
                                                        Shadow(
                                                          blurRadius: 10.0,
                                                          color: Colors.black87,
                                                          offset:
                                                              Offset(5.0, 5.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                SizedBox(
                                                  width: width,
                                                  child: Text(
                                                    'Tag: ${lists[index]['Category']}',
                                                    maxLines: 3,
                                                    style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      shadows: [
                                                        Shadow(
                                                          blurRadius: 10.0,
                                                          color: Colors.black54,
                                                          offset:
                                                              Offset(5.0, 5.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// This is a block of Model Dialog
  showDialogFunc(
      context,
      img,
      title,
      desc,
      url,
      action,
      devicetrigger,
      triggergroup,
      devicegroup,
      actiongroup,
      schedule,
      category,
      numberactions) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(173, 48, 152, 1),
                    Color.fromRGBO(197, 106, 182, 1),
                    Color.fromRGBO(229, 124, 194, 1),
                    Color.fromRGBO(242, 174, 228, 1),
                    Color.fromRGBO(245, 213, 248, 1),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              padding: const EdgeInsets.all(10),
              height: 440,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(173, 48, 152, 1),
                        Color.fromRGBO(197, 106, 182, 1),
                        Color.fromRGBO(229, 124, 194, 1),
                        Color.fromRGBO(242, 174, 228, 1),
                        // Color.fromRGBO(245, 213, 248, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 420,
                        height: 420,
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      fontFamily: 'Proxima',
                                      color: Colors.white,
                                      fontSize: 22,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 22.0,
                                          color: Colors.black,
                                          offset: Offset(5.0, 5.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    desc,
                                    style: const TextStyle(
                                      fontFamily: 'Proxima',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 16.0,
                                          color: Colors.black,
                                          offset: Offset(5.0, 5.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text.rich(
                                    TextSpan(
                                      style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontStyle: FontStyle.italic,
                                          height: 1.0),
                                      children: [
                                        const TextSpan(
                                          text: '',
                                        ),
                                        // const WidgetSpan(
                                        //   child: Icon(
                                        //     Icons.tag_rounded,
                                        //     color: Colors.white,
                                        //   ),
                                        // ),
                                        TextSpan(
                                          text:
                                              'Tag: $category, $numberactions Action',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text.rich(
                                    TextSpan(
                                      style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 14,
                                          height: 1.0),
                                      children: [
                                        const TextSpan(
                                          text: '',
                                        ),
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Trigger by: $devicetrigger',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text.rich(
                                    TextSpan(
                                      style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 14,
                                          height: 1.0),
                                      children: [
                                        const TextSpan(
                                          text: '',
                                        ),
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.wifi_protected_setup_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Initiated by: $triggergroup',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text.rich(
                                    TextSpan(
                                      style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 14,
                                          height: 1.0),
                                      children: [
                                        const TextSpan(
                                          text: '',
                                        ),
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.access_alarms_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Active Days: $schedule',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text.rich(
                                    TextSpan(
                                      style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 14,
                                          height: 1.0),
                                      children: [
                                        const TextSpan(
                                          text: '',
                                        ),
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Devices: $devicegroup',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text.rich(
                                    TextSpan(
                                      style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 14,
                                          height: 1.0),
                                      children: [
                                        const TextSpan(
                                          text: '',
                                        ),
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.notifications_active_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Actions: $actiongroup',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons
                                            .arrow_back_sharp), //icon data for elevated button
                                        label: const Text(
                                          'Back',
                                          style: TextStyle(
                                            fontFamily: 'Proxima',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ), //label text
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              action == 'Single'
                                                  ? const Color(0xFF1D63A3)
                                                  : Colors.pinkAccent,
                                            ),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    side: BorderSide(
                                                        color: action ==
                                                                'Single'
                                                            ? Colors.pinkAccent
                                                            : const Color(
                                                                0xFF1D63A3)))))),
                                    const SizedBox(width: 25),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          link = url;
                                          hyperlink();
                                          showSuccessfulDialog();
                                        },
                                        icon: const Icon(Icons
                                            .play_arrow), //icon data for elevated button
                                        label: const Text(
                                          'Get',
                                          style: TextStyle(
                                            fontFamily: 'Proxima',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ), //label text
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              action == 'Single'
                                                  ? const Color(0xFF1D63A3)
                                                  : Colors.pinkAccent,
                                            ),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    side: BorderSide(
                                                        color: action ==
                                                                'Single'
                                                            ? Colors.pinkAccent
                                                            : const Color(
                                                                0xFF1D63A3)))))),
                                    const SizedBox(height: 38)
                                  ],
                                ),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showSuccessfulDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
              child: SizedBox(
            width: 400,
            height: 350,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Center(
                child: Text(
                  'QR Code successfully created',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 20,
                    background: Paint()
                      ..strokeWidth = 20
                      ..color = Colors.pinkAccent
                      ..strokeJoin = StrokeJoin.round
                      ..strokeCap = StrokeCap.round
                      ..style = PaintingStyle.stroke,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Lottie.asset(
                  'images/lottie/successweb.json',
                  height: 250,
                  width: 250,
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Go Back!',
                    style: TextStyle(
                      fontFamily: 'Proxima',
                      fontSize: 20,
                      background: Paint()
                        ..strokeWidth = 20
                        ..color = Colors.pinkAccent
                        ..strokeJoin = StrokeJoin.round
                        ..strokeCap = StrokeCap.round
                        ..style = PaintingStyle.stroke,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25)
            ]),
          )));

  void hyperlink() async {
    await launchUrlString(link, mode: LaunchMode.externalApplication);
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}

//
