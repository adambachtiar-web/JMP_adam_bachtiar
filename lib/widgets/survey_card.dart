import 'package:flutter/material.dart';

enum SurveyStatus {
  belumDimulai,
  berjalan,
  selesai,
  bermasalah,
}

class SurveyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final SurveyStatus status;
  final VoidCallback? onTap;

  const SurveyCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    this.onTap,
  });

  // 🎨 WARNA SESUAI STATUS
  Color get statusColor {
    switch (status) {
      case SurveyStatus.belumDimulai:
        return Colors.grey;
      case SurveyStatus.berjalan:
        return Colors.orange;
      case SurveyStatus.selesai:
        return Colors.green;
      case SurveyStatus.bermasalah:
        return Colors.red;
    }
  }

  // 🔥 ICON SESUAI STATUS
  IconData get statusIcon {
    switch (status) {
      case SurveyStatus.belumDimulai:
        return Icons.schedule;
      case SurveyStatus.berjalan:
        return Icons.play_circle_fill;
      case SurveyStatus.selesai:
        return Icons.check_circle;
      case SurveyStatus.bermasalah:
        return Icons.error;
    }
  }

  // 🏷 TEXT STATUS
  String get statusText {
    switch (status) {
      case SurveyStatus.belumDimulai:
        return "Belum Dimulai";
      case SurveyStatus.berjalan:
        return "Sedang Berjalan";
      case SurveyStatus.selesai:
        return "Selesai";
      case SurveyStatus.bermasalah:
        return "Bermasalah";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Row(
          children: [
            // ICON STATUS
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                statusIcon,
                color: statusColor,
                size: 28,
              ),
            ),

            const SizedBox(width: 12),

            // TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // STATUS LABEL
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                statusText,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}