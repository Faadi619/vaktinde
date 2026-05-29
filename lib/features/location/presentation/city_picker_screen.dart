import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../../widgets/app_back_button.dart';
import '../../qibla/providers/qibla_provider.dart';
import '../domain/city_suggestion.dart';
import 'widgets/city_suggestion_tile.dart';

class CityPickerScreen extends StatefulWidget {
  const CityPickerScreen({super.key});

  @override
  State<CityPickerScreen> createState() => _CityPickerScreenState();
}

class _CityPickerScreenState extends State<CityPickerScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  List<CitySuggestion> _suggestions = const [];
  bool _isSearching = false;
  String? _errorKey;
  int _requestSequence = 0;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    _debounce?.cancel();
    final trimmed = value.trim();
    if (trimmed.length < 2) {
      setState(() {
        _suggestions = const [];
        _isSearching = false;
        _errorKey = null;
      });
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _runSearch(trimmed);
    });
  }

  Future<void> _runSearch(String query) async {
    final mySeq = ++_requestSequence;
    setState(() {
      _isSearching = true;
      _errorKey = null;
    });

    try {
      final locations = await locationFromAddress(query);
      if (!mounted || mySeq != _requestSequence) return;

      final List<CitySuggestion> results = [];
      for (final loc in locations.take(5)) {
        String label = query;
        try {
          final placemarks = await placemarkFromCoordinates(
            loc.latitude,
            loc.longitude,
          );
          if (placemarks.isNotEmpty) {
            final p = placemarks.first;
            final city = p.locality?.trim().isNotEmpty == true
                ? p.locality!
                : (p.subAdministrativeArea ?? '');
            final country = p.country ?? '';
            final parts = [city, country].where((s) => s.trim().isNotEmpty);
            if (parts.isNotEmpty) label = parts.join(', ');
          }
        } catch (_) {}
        results.add(
          CitySuggestion(lat: loc.latitude, lng: loc.longitude, label: label),
        );
      }

      if (!mounted || mySeq != _requestSequence) return;
      setState(() {
        _suggestions = results;
        _isSearching = false;
        _errorKey = results.isEmpty ? 'no_results' : null;
      });
    } catch (_) {
      if (!mounted || mySeq != _requestSequence) return;
      setState(() {
        _suggestions = const [];
        _isSearching = false;
        _errorKey = 'search_failed';
      });
    }
  }

  Future<void> _onSuggestionTap(CitySuggestion suggestion) async {
    await context.read<QiblaProvider>().setManualLocation(
      lat: suggestion.lat,
      lng: suggestion.lng,
      cityLabel: suggestion.label,
    );
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  String _errorMessage(AppLocalizations l10n) {
    switch (_errorKey) {
      case 'no_results':
        return l10n.cityPickerNoResults;
      case 'search_failed':
        return l10n.cityPickerSearchFailed;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
              child: Row(
                children: [
                  const AppBackButton(),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.cityPickerTitle,
                          style: AppTextStyles.size22w800,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          l10n.cityPickerSubtitle,
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                controller: _controller,
                autofocus: true,
                onChanged: _onQueryChanged,
                textInputAction: TextInputAction.search,
                style: AppTextStyles.size15w500,
                decoration: InputDecoration(
                  hintText: l10n.cityPickerHint,
                  hintStyle: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.mutedText,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.cardBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isSearching
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primaryGreen,
                        ),
                      ),
                    )
                  : _errorKey != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          _errorMessage(l10n),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _suggestions.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final s = _suggestions[index];
                        return CitySuggestionTile(
                          suggestion: s,
                          onTap: () => _onSuggestionTap(s),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
