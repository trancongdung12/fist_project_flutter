class Api {
  static const String _baseUrl =
      'https://smartos-api-staging.enouvo.com/api/v1/';

  static const loginApi = _baseUrl + 'mobile/auth/login';
  static const bannerApi = _baseUrl +
      'mobile/banners?limit=10&offset=0&filter={"isInApp": true, "isActive": true}';
  static const locationsApi =
      _baseUrl + 'mobile/locations?limit=10&offset=0&orderBy=-createdAt';
  static const eventsApi = _baseUrl +
      'mobile/events?limit=10&offset=0&filter={"isActive": true}&orderBy=-eventTime';
}
