# Play Store Release Checklist

- [ ] Replace AdMob test App ID / unit IDs with production IDs
- [ ] Publish privacy policy URL and link from Play Console + About screen
- [ ] Add signing key (`key.properties`) — never commit secrets
- [ ] Generate adaptive icon + feature graphic
- [ ] Set `version` in `pubspec.yaml`
- [ ] `flutter build appbundle --release`
- [ ] Test on API 24+ physical devices
- [ ] Verify ads never appear mid-match
- [ ] Content rating questionnaire
- [ ] Store listing screenshots (phone + optional tablet)
