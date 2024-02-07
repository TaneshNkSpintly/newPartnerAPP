import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:partner_app/Feature/customerSite/Services/customerSiteProvider.dart';
import 'package:partner_app/Gobal%20File/GobalModel.dart';
import '../../../../../Gobal File/GobalFunctionSnackBAR.dart';
import '../../../../../Gobal File/GobalVariable.dart';
import '../../../../dashboard/SubFeatures/createNewCustomer/ui/createNewCustomerPage2_Location.dart';

TextEditingController _siteNameController = TextEditingController();
TextEditingController _siteLocationController = TextEditingController();
TextEditingController _timezoneController = TextEditingController();
TextEditingController _network1Controller = TextEditingController();
TextEditingController _network2Controller = TextEditingController();
late String  initaialSitename;

TextEditingController _newNetworkController = TextEditingController();
bool showNextButton = false;
bool initFetch=true;

bool _loadDeleteNetwork1= false;
bool _loadDeleteNetwork2= false;

class EditSiteInfoPage extends StatefulWidget {
  int siteIdex;
  String orgId;
  EditSiteInfoPage({super.key,required this.siteIdex,required this.orgId});

  @override
  State<EditSiteInfoPage> createState() => _EditSiteInfoPageState();
}

class _EditSiteInfoPageState extends State<EditSiteInfoPage> {

  
   Future<void> initialiseData(WidgetRef ref) async {
    final customerSiteOverViewData = ref.watch(customerSiteProvider);
    _siteNameController.text =
        "${customerSiteOverViewData.SiteList![widget.siteIdex].name}";
    _siteLocationController.text =
        "${customerSiteOverViewData.SiteList![widget.siteIdex].location} ";
        _timezoneController.text =
        "${customerSiteOverViewData.SiteList![widget.siteIdex].timezone}";

    
        initaialSitename=customerSiteOverViewData.SiteList![widget.siteIdex].name.toString();


        _network1Controller.text="";
        _network2Controller.text="";
        
  }


  @override
  void initState() {
    // remove
    // TODO: implement initState
    super.initState();
    _loadDeleteNetwork1= false;
   _loadDeleteNetwork2= false;
    initFetch=true;
    // _adminPhoneController.text = "+91912 123 7658";
    
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    void refresh() {
      setState(() {});
    }

    return Consumer(
      builder: (context, ref, child) {
        if (initFetch) {
          initialiseData(ref);
          initFetch=false;
        }

         
        final customerSiteOverViewData = ref.watch(customerSiteProvider);

     if(customerSiteOverViewData.SiteList![widget.siteIdex].networks.length>0)
        {
          _network1Controller.text =
                            "${customerSiteOverViewData.SiteList![widget.siteIdex].networks[0].name}";
         
         }
         if(customerSiteOverViewData.SiteList![widget.siteIdex].networks.length==2)
         { _network2Controller.text =
                           "${customerSiteOverViewData.SiteList![widget.siteIdex].networks[1].name}";
        }                        "${customerSiteOverViewData.SiteList![widget.siteIdex].networks[0].name}";
  

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [],
            backgroundColor: themeColor,
            title: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    //open nav bar
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 252, 252, 252),
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Edit Customer Info',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    //height: 0.06,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
               
                Spacer(),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          // bottomNavigationBar: CustomerBottomOveriewNavigationBarPage(
          //   menuSelected: "Sites",
          // ),
          body: Container(
            height: screenSize.height,
            child: Stack(
              children: [
                Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  //SECTION A
                  Container(
                    //container1b
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Edit Site Information",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _siteNameController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Site Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          0xFFE0E0E0)), // Set the enabled border color to black
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                //   navigation to location page

                                // ignore: unused_local_variable
                                var result = Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            createNewCustomerPage2_Location()));
                              },
                              child: TextFormField(
                                controller: _siteLocationController,
                                enabled: false,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Site Location',
                                  labelStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showTimezonePicker(context, refresh);
                              },
                              child: TextFormField(
                                controller: _timezoneController,
                                enabled: false,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Timezone',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: Icon(Icons.arrow_drop_down),
                                ),
                              ),
                            ),
                             for(int index=0;index<customerSiteOverViewData.SiteList![widget.siteIdex].networks.length;index++)
                            TextFormField(
                              readOnly: true,
                              controller: index==0?_network1Controller:_network2Controller,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Network -${index+1}",
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                  ),
                                ),
                                suffixIcon: index==0 && _loadDeleteNetwork1?
                                Center(child: CircularProgressIndicator(),)
                                :index!=0 && _loadDeleteNetwork2?
                                Center(child: CircularProgressIndicator(),)
                                :
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        var title = "Delete Network?";
                                        var subtitle =
                                            "Are you sure you want to delete this network, “${index==0?_network1Controller.text:_network2Controller.text} ";
                                        var result =
                                            await showDeketeBottomSnackBAR(
                                                context, title, subtitle);
                                        if (result == 1) {
                                           if(index==0){
                                             _loadDeleteNetwork1=true;
                                               }
                                               else{
                                                 _loadDeleteNetwork2=true;
                                             }
                                             setState(() {
                                               print("fjfdh$_loadDeleteNetwork1 gjg$_loadDeleteNetwork2");
                                             });


                                          MessageResponse? Site_netorkDeteResult =
                                                            await ref.read(customerSiteProvider.notifier)
                                                                .updateSiteDetails_deleteNetwork(
                                                                  customerSiteOverViewData.SiteList![widget.siteIdex].networks[index].id.toString(),
                                                                    widget.orgId);
                                         if (Site_netorkDeteResult! .type =="success"){
                                                  print(" SUCCESS");
                                          String Title =
                                              "Network Deleted Successfully";
                                          var Subtitle =
                                              "You successfully deleted the site ${index==0?_network1Controller.text:_network2Controller.text} for customer ${customerSiteOverViewData.organisationDetailsModel!.generalSetting.name} ";
                                          showSccessBottomSnackBAR(
                                              context, Title, Subtitle,
                                              refresh: refresh);

                                          setState(() {});  
                                              }
                                              else if (Site_netorkDeteResult! .type =="error")
                                              {
                                                 String errorMessage = Site_netorkDeteResult
                                        .errorMessage!.errorMessage;
                                          var title =
                                              "Failed to Delete Network";
                                          var subtitle = "$errorMessage";
                                          showUnsccessBottomSnackBAR(
                                              context, title, subtitle);
                                              }
                                           if(index==0){
                                             _loadDeleteNetwork1=false;
                                               }
                                               else{
                                                 _loadDeleteNetwork2=false;
                                             }
                                              setState(() {
                                               
                                             });
                                          ////////////////////////////////////
                                          ////////////////////////////
                                          
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Image.asset(
                                              'assets/icon/deleteBinIcon.png',
                                            ),
                                          ),
                                          Text(
                                            "Remove",
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 11,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Add additional suffix icons if needed
                                  ],
                                ),
                              ),
                            ),
                            //
                            SizedBox(
                              height: 45,
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFEFF6FC),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Only 2 networks are allowed per site',
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    // height: 0.14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pop();
                        String sitename=  customerSiteOverViewData.SiteList![widget.siteIdex].name;
                          showAddNewNetworkPicker(context, refresh,widget.siteIdex,widget.orgId,sitename);
                        },
                        child: Container(
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: primaryButtonColor,
                            border: Border.all(
                              color: primaryButtonColor, // Color(0xFFF94444),
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: Color(0xFF2F3789),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "New Network",
                                style: TextStyle(
                                  color: Color(0xFF2F3789),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //
                      GestureDetector(
                        onTap: () async {
                          // CongigureConfirmation =
                          //     await showCongigureDoorBottomSnackBAR(context);
                       
                          int? netId1=null;
                          if(  customerSiteOverViewData.SiteList![widget.siteIdex].networks.length>0 ){
                            netId1=customerSiteOverViewData.SiteList![widget.siteIdex].networks[0].id;
                          }
                          int? netId2=null;
                          if(  customerSiteOverViewData.SiteList![widget.siteIdex].networks.length==2 ){
                            netId2=customerSiteOverViewData.SiteList![widget.siteIdex].networks[1].id;
                          }
                           MessageResponse? Site_UpdateDetailsResult =
                                                 await ref.read(customerSiteProvider.notifier)
                                                     . updateSiteDetailsPATCH(
                                                          widget.orgId,
                                                          customerSiteOverViewData.SiteList![widget.siteIdex].id.toString(),
                                                          _siteNameController.text.toString(),
                                                            initaialSitename,
                                                          _siteLocationController.text.toString(),
                                                          _timezoneController.text.toString(),
                                                          _network1Controller.text.toString(),
                                                          netId1,
                                                          _network2Controller.text.toString(),
                                                          netId2,
                                                        );
                                         if (Site_UpdateDetailsResult! .type =="success"){
                                              Navigator.pop(context, 1);
                                           
                                              }
                                              else if (Site_UpdateDetailsResult! .type =="error")
                                              {
                                                 String errorMessage = Site_UpdateDetailsResult
                                                      .errorMessage!.errorMessage;
                                                        var title =
                                                            "Failed to Update Details";
                                                        var subtitle = "$errorMessage";
                                                        showUnsccessBottomSnackBAR(
                                                            context, title, subtitle);
                                                              Navigator.pop(context, 0);
                                            }
                        },
                        child: Container(
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryButtonColor,
                          ),
                          child: Center(
                            child: Text(
                              "Save Changes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //SECTION A
                ]),
                //
                //stack
              ],
            ),
          ),
        );
      },
    );
  }
}

void showTimezonePicker(BuildContext context, void Function() refresh) {
  List<String> TimezoneOptionList = [
    "IST (UTC+05:30) Mumbai",
    "EDT (UTC-04:00) New York",
    "CDT (UTC-05:00) Chicago",
    "PDT (UTC-07:00) Los Angeles",
    "AKDT (UTC-08:00) Anchorage",
    "HST (UTC-10:00) Honolulu",
    "Option 2",
    "Option 3"
  ];
  int? selectOption;
  var _selectedTimezone;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.7, // Adjust the height as needed
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 2, right: 2),
                    height: 5,
                    width: screenSize.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 219, 219, 225),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Timezone",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //content
              Expanded(
                child: ListView.builder(
                  itemCount: TimezoneOptionList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            title: Text(TimezoneOptionList[index]),
                            trailing: Radio<int>(
                              value: index,
                              groupValue: selectOption,
                              onChanged: (int? value) {
                                setState(() {
                                  selectOption = value!;
                                  _selectedTimezone = TimezoneOptionList[index];
                                });
                              },
                            )),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  _timezoneController.text = _selectedTimezone;
                  setState(() {});
                  refresh();
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryButtonColor),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        );
      });
    },
  );
}

void showAddNewNetworkPicker(BuildContext context, void Function() refresh,int siteIdex,String orgId,String siteName) {
  _newNetworkController.clear();
_newNetworkController.text="${siteName} - ";
bool _loaderAddNewtork=false;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final Size screenSize = MediaQuery.of(context).size;
      return StatefulBuilder(builder: (context, setState) {

        return Container(
          // height: MediaQuery.of(context).size.height *
          //     0.4, // Adjust the height as needed
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 2, right: 2),
                    height: 5,
                    width: screenSize.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 219, 219, 225),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Add New Network",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
                  _loaderAddNewtork?
                  Center(child: CircularProgressIndicator(),):
                 Center(
                  child: TextFormField(
                    controller: _newNetworkController,
                    //enabled: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Network Name',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {
                      //  _newNetworkController.text="${siteName} - ${value}";
                    },
                  ),
        
              ),

              SizedBox(
                height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      //   _newNetworkController.text = _selectedTimezone;
                      setState(() {});
                      refresh();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      //  margin: EdgeInsets.all(15),
                      padding: const EdgeInsets.all(15.0),
                      width: screenSize.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: primaryButtonColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //
                 Consumer(
                     builder: (context, ref, child) {
                        
                     final customerSiteOverViewData = ref.watch(customerSiteProvider);
                     //String stitename=customerSiteOverViewData.SiteList![siteIdex].name;
                       return GestureDetector(
                        
                      
                          onTap: () async {

                            _loaderAddNewtork=true;
                                setState(() {});


                              int? netId1=null;
                              if(  customerSiteOverViewData.SiteList![siteIdex].networks.length==1 ){
                                netId1=customerSiteOverViewData.SiteList![siteIdex].networks[0].id;
                              }
                              int? netId2=null;
                              if(  customerSiteOverViewData.SiteList![siteIdex].networks.length==2 ){
                                netId2=customerSiteOverViewData.SiteList![siteIdex].networks[1].id;
                              }
                               MessageResponse? Site_UpdateDetailsResult =
                                                     await ref.read(customerSiteProvider.notifier)
                                                         . updateSiteDetails_AddNetwork(
                                                              orgId,
                                                              customerSiteOverViewData.SiteList![siteIdex].id.toString(),
                                                              siteName,
                                                              _newNetworkController.text.toString(),
                                                            //
                                                               false,// UPDATE DATA AS WELL
                                                              _siteNameController.text.toString(),
                                                                initaialSitename,
                                                              _siteLocationController.text.toString(),
                                                              _timezoneController.text.toString(),
                                                              _network1Controller.text.toString(),
                                                              netId1,
                                                              _network2Controller.text.toString(),
                                                              netId2,
                                                            );
                                  if (Site_UpdateDetailsResult! .type =="success"){
                                            Navigator.pop(context, 1);
                                           var Title = "Network Added Successfully";
                                           var SubTitLE =
                                              "New network ${ _newNetworkController.text.toString()} has been successfully added to site $siteName";
                                            showSccessBottomSnackBAR(context, Title, SubTitLE);
                                                          
                                                     }
                                                  else if (Site_UpdateDetailsResult! .type =="error")
                                                  {
                                                     String errorMessage = Site_UpdateDetailsResult
                                                          .errorMessage!.errorMessage;
                                                            var title =
                                                                "Failed to Add Network";
                                                            var subtitle = "$errorMessage";
                                                            showUnsccessBottomSnackBAR(
                                                                context, title, subtitle);
                                                                  Navigator.pop(context, 0);
                                                }
                                                
                            _loaderAddNewtork=false;
                                setState(() {});
                            

                            },
                        child: Container(
                          //  margin: EdgeInsets.all(15),
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryButtonColor),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Add Network",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height*0.06,
              ),
            ],
          ),
        );
      });
    },
  );
}
