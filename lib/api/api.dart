class Api {
  static const baseUrl = 'https://smartos-api-staging.enouvo.com/api/v1/';

  static const loginApi = baseUrl + 'mobile/auth/login';
  static const bannerApi = baseUrl +
      'mobile/banners?limit=10&offset=0&filter={"isInApp": true, "isActive": true}';
  static const locationsApi =
      baseUrl + 'mobile/locations?limit=10&offset=0&orderBy=-createdAt';
  static const eventsApi = baseUrl +
      'mobile/events?limit=10&offset=0&filter={"isActive": true}&orderBy=-eventTime';

  static const bookingsApi = baseUrl +
      'mobile/bookings/me?includes=extraServices&offset=0&limit=10&orderBy=-createdAt';
}
