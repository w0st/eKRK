class Zajecia < ActiveRecord::Base
  # Probowalem ale nie da sie wtedy utworzyc Kursu
  # self.abstract_class= true
  belongs_to :modul_ksztalcenia
  belongs_to :semestr
  belongs_to :przedmiot_ksztalcenia

  has_many :kursy, :class_name => 'Kurs', :foreign_key => 'grupa_kursow_id'
  belongs_to :grupa_kursow, :class_name => 'GrupaKursow', :foreign_key => 'grupa_kursow_id'
  has_one :kurs_koncowy, :class_name => "Kurs", :foreign_key => "kurs_koncowy_id"


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

  enum formaKursu: {
      Wyklad: 0,
      Cwiczenia: 1,
      Laboratorium: 2,
      Seminarium: 3,
      Projekt: 4,
      Praktyka: 5,
      PracaDyplomowa: 6
  }





end
