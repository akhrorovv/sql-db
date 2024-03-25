class CreditCard {
  // int? id;
  String? cardNumber;
  String? expiredDate;
  String? cardType;
  String? cardImage;

  CreditCard({this.cardNumber, this.expiredDate, this.cardType, this.cardImage});

  Map<String, dynamic> toMap(){
    return {
      // 'id': id,
      'cardNumber': cardNumber,
      'expiredDate': expiredDate,
      'cardType': cardType,
      'cardImage': cardImage,
    };
  }

  static CreditCard fromMap(Map map) {
    CreditCard creditCard = CreditCard();
    // creditCard.id = map['id'];
    creditCard.cardNumber = map['cardNumber'];
    creditCard.expiredDate = map['expiredDate'];
    creditCard.cardType = map['cardType'];
    creditCard.cardImage = map['cardImage'];

    return creditCard;
  }
}