import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart'; // pastikan path sesuai project kamu

class NetworkStatusChip extends StatefulWidget {
  const NetworkStatusChip({super.key});

  @override
  State<NetworkStatusChip> createState() => _NetworkStatusChipState();
}

class _NetworkStatusChipState extends State<NetworkStatusChip> {
  ConnectivityResult _status = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((result) {
      if (mounted) setState(() => _status = result);
    });
  }

  Future<void> _checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    if (mounted) setState(() => _status = result);
  }

  IconData get _icon {
    switch (_status) {
      case ConnectivityResult.wifi:
        return Icons.wifi;
      case ConnectivityResult.mobile:
        return Icons.signal_cellular_alt;
      default:
        return Icons.signal_wifi_off;
    }
  }

  String get _label {
    switch (_status) {
      case ConnectivityResult.wifi:
        return 'WiFi';
      case ConnectivityResult.mobile:
        return '4G';
      default:
        return 'Offline';
    }
  }

  Color get _iconColor {
    switch (_status) {
      case ConnectivityResult.wifi:
        return AppTheme.networkWifi;
      case ConnectivityResult.mobile:
        return AppTheme.networkMobile;
      default:
        return AppTheme.networkOffline;
    }
  }

  Color get _bgColor {
    return AppTheme.networkBadgeBg;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_icon, size: 14, color: _iconColor),
            const SizedBox(width: 4),
            Text(
              _label,
              style: TextStyle(
                fontSize: 11,
                color: _iconColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}