import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template_flutter/assets.dart';
import 'package:template_flutter/shared/style/color/color_widget.dart';

class TextBorder extends StatefulWidget {
  // WIDGET: TEXT BORDER
  const TextBorder({
    Key? key,
    this.label,
    required this.hintText,
    this.suffixIcon,
    this.alert = false,
    this.isPassword = false,
    this.hintColor = const Color(0xFF878AA6),
    this.iconColor = const Color(0xFF878AA6),
    this.onChanged,
    this.defaultValue, // Add defaultValue parameter
  }) : super(key: key);

  final String? defaultValue; // Define defaultValue
  final Color hintColor;
  final String hintText;
  final Color iconColor;
  final bool isPassword;
  final String? label;
  final ValueChanged<String>? onChanged;
  final String? suffixIcon;
  final bool alert;

  @override
  // ignore: library_private_types_in_public_api
  _TextBorderState createState() => _TextBorderState();
}

class _TextBorderState extends State<TextBorder> {
  late TextEditingController _controller; // Declare TextEditingController
  late String _currentSuffixIcon;
  late bool _obscureText;

  @override
  void dispose() {
    _controller.dispose(); // Dispose the TextEditingController
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _currentSuffixIcon = widget.suffixIcon ?? '';
    _controller = TextEditingController(
        text: widget.defaultValue ??
            ''); // Initialize TextEditingController with defaultValue
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Color(0xFF0F172A),
            ),
          ),
        const SizedBox(height: 8),
        Container(
          height: 50.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE5E7F2),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller, // Assign the controller
                  style: const TextStyle(color: Colors.black, fontSize: 15.0),
                  obscureText: _obscureText,
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: widget.hintColor, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              if (_currentSuffixIcon.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                      _currentSuffixIcon = _obscureText
                          ? widget.suffixIcon ?? ''
                          : Assets.assetsSvgVisible;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      _currentSuffixIcon,
                      height: 20,
                      width: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (widget.alert)
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text(
              'Wajib diisi',
              style: TextStyle(color: XColor.red, fontSize: 14.0),
            ),
          )
      ],
    );
  }
}
