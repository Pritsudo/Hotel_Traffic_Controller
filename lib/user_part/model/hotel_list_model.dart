class HotelListModel {
  final String hotelName;
  final String address;
  final int rating;
  final int traffic;
  final String url;

  HotelListModel(
      {required this.hotelName,
      required this.address,
      required this.rating,
      required this.traffic,
      required this.url});
}

final hotelList = [
  HotelListModel(
      hotelName: 'testName1',
      address: 'test address',
      rating: 5,
      traffic: 2,
      url:
          'https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
  HotelListModel(
      hotelName: 'testName2',
      address: 'test address 2',
      rating: 3,
      traffic: 5,
      url:
          'https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
  HotelListModel(
      hotelName: 'testName3',
      address: 'test address',
      rating: 5,
      traffic: 2,
      url:
          'https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')

];
