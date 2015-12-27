class Kurs < Zajecia
  belongs_to :grupa_kursow

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
