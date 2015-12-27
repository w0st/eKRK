class Zajecia < ActiveRecord::Base
  belongs_to :modul_ksztalcenia
  belongs_to :semestr
  belongs_to :przedmiot_ksztalcenia


  enum sposobZaliczenia: {
      Zaliczenie: 0,
      Egzamin: 1
  }

  enum rodzaj: {
      KsztalceniaOgolnego: 0,
      Podstawowy: 1,
      Kierunkowy: 2,
      Specjalnosciowy: 3
  }

  enum typ: {
      Wybieralny: 0,
      Obowiazkowy: 1
  }
end
