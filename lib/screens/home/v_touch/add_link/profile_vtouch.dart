import 'dart:ffi';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendy_station/provider/add_link_provider.dart';
import 'package:vendy_station/util/constant.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import '../../../../base_widgit/custom_button.dart';
import '../../../../data/datasource/remote/dio/cash.dart';
import '../../../../util/dimensions.dart';
import '../vtouch_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileVTouch extends StatefulWidget {
  const ProfileVTouch({Key? key}) : super(key: key);

  @override
  State<ProfileVTouch> createState() => _ProfileVTouchState();
}

class _ProfileVTouchState extends State<ProfileVTouch> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneoneController1 = TextEditingController();
  final TextEditingController _webController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = nameVTouch!;
    _emailController.text = emailVTouch!;
    _phoneController.text = phoneVTouch!;
    _phoneoneController1.text = phone2VTouch!;
    _addressController.text = addressVTouch!;
    _webController.text = webVTouch!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const vTouchScreen()));
                          // Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/images/back.png",
                          width: 40,
                          height: 40,
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    Center(
                        child: Text(
                      AppLocalizations.of(context)!.vTouch,
                      style: TextStyle(fontSize: 30, color: Color(0xff1E232C)),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      _imageFile == null
                          ? CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                              radius: width / 7.3,
                            )
                          : CircleAvatar(
                              radius: width / 7.3,
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(width / 5),
                                child: Image.file(
                                  File(_imageFile!.path),
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      InkWell(
                        onTap: () {
                          getImage();
                          //  Provider.of<AddLinkProvider>(context, listen: false).getUploadImage(context,);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_enhance_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, color: Colors.brown, size: 20),
                              SizedBox(width: Dimensions.marginSizeExtraSmall),
                              Text(
                                AppLocalizations.of(context)!.name,
                                //style: titilliumRegular
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),
                          TextField(
                            controller: _nameController,

                            decoration: InputDecoration(
                              hintText: /*nameVTouch !=null ? nameVTouch :*/
                                  AppLocalizations.of(context)!.name,

                              // labelText: "labelText",
                              // suffixIcon: suffixIcon,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            //  initialValue:nameVTouch!=null? _nameController.text= nameVTouch!:"",
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),

                          ///
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.brown, size: 20),
                              SizedBox(width: Dimensions.marginSizeExtraSmall),
                              Text(
                                AppLocalizations.of(context)!.email,
                                //style: titilliumRegular
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),
                          TextFormField(
                            controller: _emailController,
                            //   initialValue:emailVTouch!=null ? _emailController.text=emailVTouch!:"",
                            decoration: InputDecoration(
                              hintText: /*emailVTouch!=null ?emailVTouch:*/
                                  AppLocalizations.of(context)!.email,
                              // labelText: "labelText",
                              // suffixIcon: suffixIcon,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),

                          ///
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.brown, size: 20),
                              SizedBox(width: Dimensions.marginSizeExtraSmall),
                              Text(
                                AppLocalizations.of(context)!.phone,
                                //style: titilliumRegular
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),
                          TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              hintText: /*phoneVTouch!=null?phoneVTouch:*/
                                  AppLocalizations.of(context)!.phone,
                              // labelText: "labelText",
                              // suffixIcon: suffixIcon,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            //  initialValue:phoneVTouch!=null ? _phoneController.text=phoneVTouch!:"",
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),

                          ///
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.brown, size: 20),
                              SizedBox(width: Dimensions.marginSizeExtraSmall),
                              Text(
                                '${AppLocalizations.of(context)!.phone}1',
                                //style: titilliumRegular
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),
                          TextFormField(
                            controller: _phoneoneController1,
                            decoration: InputDecoration(
                              hintText: /*phone2VTouch!=null?phone2VTouch:*/
                                  "${AppLocalizations.of(context)!.phone}1",
                              // labelText: "labelText",
                              // suffixIcon: suffixIcon,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            // initialValue:phoneVTouch!=null? _phoneoneController1.text=phone2VTouch!:"",
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),

                          ///
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.brown, size: 20),
                              SizedBox(width: Dimensions.marginSizeExtraSmall),
                              Text(
                                AppLocalizations.of(context)!.address,
                                //style: titilliumRegular
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),
                          TextFormField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              hintText: /*addressVTouch!=null?addressVTouch :*/
                                  AppLocalizations.of(context)!.address,
                              // labelText: "labelText",
                              // suffixIcon: suffixIcon,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            // initialValue:addressVTouch!=null? _addressController.text=addressVTouch!:"",
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),

                          ///
                          Row(
                            children: [
                              Icon(Icons.web, color: Colors.brown, size: 20),
                              SizedBox(width: Dimensions.marginSizeExtraSmall),
                              Text(
                                AppLocalizations.of(context)!.web,
                                //style: titilliumRegular
                              )
                            ],
                          ),
                          SizedBox(height: Dimensions.marginSizeExtraSmall),
                          TextFormField(
                            controller: _webController,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.web,
                              /*webVTouch!=null?webVTouch:*/
                              // labelText: "labelText",
                              // suffixIcon: suffixIcon,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            //  initialValue:webVTouch!=null? _webController.text=webVTouch!:"",
                          ),

                          SizedBox(height: Dimensions.marginSizeExtraSmall),
                        ],
                      )),
                ),
                CustomButton(
                  onTap: () async {
                    Provider.of<AddLinkProvider>(context, listen: false)
                        .getProfileVT(
                            context,
                            _nameController.text,
                            _phoneController.text,
                            _emailController.text,
                            _phoneoneController1.text,
                            _addressController.text,
                            _webController.text);
                    Provider.of<AddLinkProvider>(context, listen: false)
                        .getUploadImage(context, _imageFile);
                    // CacheHelper.saveData(key: "image", value: _imageFile!.path);
                    // image = CacheHelper.getData(key: 'image');
                    // print(image);
                    print("image path$imagePath");
                    // if (_formKey.currentState!.validate()==true) {
                    //
                    //   String name = _nameController.text.trim();
                    //   String email = _emailController.text.trim();
                    //   String phone = _phoneController.text.trim();
                    // //  String phoneOne = _phoneoneController1.text.trim();
                    //   String address = _addressController.text.trim();
                    //
                    //   if (name.isEmpty) {
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text('name_field_is_required'),
                    //       backgroundColor: Colors.red,
                    //     ));
                    //   }else if (email.isEmpty) {
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text('EMAIL_MUST_BE_REQUIRED'),
                    //       backgroundColor: Colors.red,
                    //     ));
                    //   }else if (phone.isEmpty) {
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text('PHONE_MUST_BE_REQUIRED'),
                    //       backgroundColor: Colors.red,
                    //     ));
                    //   }  else if (address.isEmpty) {
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text('address_MUST_BE_REQUIRED'),
                    //       backgroundColor: Colors.red,
                    //     ));
                    //   } else{
                    //     Provider.of<AddLinkProvider>(context, listen: false).getProfileVT(context,
                    //         _nameController.text,
                    //         _phoneController.text,
                    //         _emailController.text,
                    //         _phoneoneController1.text,
                    //         _addressController.text,
                    //         _webController.text
                    //     );
                    //
                    //   }
                    // }
                  },
                  buttonText: AppLocalizations.of(context)!.save,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<XFile> takePhoto(ImageSource source)async{
  //   XFile? pickedFile = (await _picker.getImage(
  //       source: ImageSource.gallery)) ;
  //   setState(() {
  //     _imageFile = pickedFile!;
  //     _load = false;
  //   });
  //   return takePhoto(source);
  // }
  ///
  // Future<File?> takePhoto(ImageSource source) async {
  //   final XFile? image = await _picker.pickImage(source: source);
  //
  //   final File? file = File(image!.path);
  //   return file;
  // }
  ///
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = (await _picker.getImage(source: ImageSource.gallery));
    setState(() {
      _imageFile = XFile(pickedFile!.path);
      saveImage(pickedFile.path);
      _load = false;
    });
  }

  Future<void> saveImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('imagePath', imagePath);
  }
}
