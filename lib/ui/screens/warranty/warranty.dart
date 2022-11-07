import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/warranty/new_claim.dart';
import 'package:dogventurehq/ui/screens/warranty/claim_list.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter/material.dart';

class WarrantyScreen extends StatefulWidget {
  static String routeName = '/warranty';
  const WarrantyScreen({Key? key}) : super(key: key);

  @override
  State<WarrantyScreen> createState() => _WarrantyScreenState();
}

class _WarrantyScreenState extends State<WarrantyScreen> {
  final List<String> _btnTxts = [
    'New Claim',
    'Pending Claims',
    'Finished Claim',
  ];
  final List<String> _btnTxtsForDealer = [
    'New Claim',
    'Retailer Claims',
    'Pending Claims',
    'Finished Claim',
  ];
  int _selectedBtnIndex = 0;
  bool _dealerFlag = false;
  @override
  void initState() {
    _dealerFlag = Preference.getDealerFlag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // appbar
            CustomAppbar(title: 'Warranty Claim'),
            // claims btn list
            RowItem(
              itemList: _dealerFlag ? _btnTxtsForDealer : _btnTxts,
              onTapFn: (value) => setState(
                () {
                  _selectedBtnIndex = value;
                },
              ),
            ),
            addH(10.h),
            Expanded(
              child: SingleChildScrollView(
                child: _dealerFlag ? getClaimPagesForDealer() : getClaimPages(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getClaimPagesForDealer() {
    switch (_selectedBtnIndex) {
      case 0:
        return const NewClaim();
      case 1:
        return const CliamList(
          finishFlag: false,
          dealerFlag: true,
        );
      case 2:
        return const CliamList(
          finishFlag: false,
          dealerFlag: false,
        );
      case 3:
        return const CliamList(
          finishFlag: true,
          dealerFlag: false,
        );
      default:
        return Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Center(
            child: Text(
              ConstantStrings.kWentWrong,
            ),
          ),
        );
    }
  }

  Widget getClaimPages() {
    switch (_selectedBtnIndex) {
      case 0:
        return const NewClaim();
      case 1:
        return const CliamList(
          finishFlag: false,
          dealerFlag: false,
        );
      case 2:
        return const CliamList(
          finishFlag: true,
          dealerFlag: false,
        );
      default:
        return Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Center(
            child: Text(
              ConstantStrings.kWentWrong,
            ),
          ),
        );
    }
  }
}
