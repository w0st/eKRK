class ProgramStudiow < ActiveRecord::Base
  belongs_to :program_ksztalcenia
  has_many :zagadnienia_egzaminu_dyplomowego
  has_many :profile_modulow
  has_many :moduly_ksztalcenia

  enum uzyskiwanyTytul: {
      Magister: 0,
      Licencjat: 1,
      Inzynier: 2
  }

  def as_json(options={})
    super(
        :include => :zagadnienia_egzaminu_dyplomowego
    )
  end

  def lacznaLiczbaECTSBK
    self.moduly_ksztalcenia.reduce(0.0) do |sum, modul|
      sum + modul.zajecia.reduce(0.0) {|sumModul, zajecie| sumModul + zajecie.punktyECTSBK }
    end
  end

  def lacznaLiczbaECTSOb
    self.moduly_ksztalcenia.reduce(0.0) do |sum, modul|
      sum + modul.zajecia.select {|z| z.Obowiazkowy? }.reduce(0.0) {|sumModul, zajecie| sumModul + zajecie.punktyECTS }
    end
  end

  def lacznaLiczbaECTSWyb
    self.moduly_ksztalcenia.reduce(0.0) do |sum, modul|
      sum + modul.zajecia.select {|z| z.Wybieralny? }.reduce(0.0) {|sumModul, zajecie| sumModul + zajecie.punktyECTS }
    end
  end

  def lacznaLiczbaECTSNaukPodst
    self.moduly_ksztalcenia.select{|m| m.profil_modulu.nazwa == 'Nauk podstawowych'}.reduce(0.0) do |sum, modul|
      sum + modul.zajecia.reduce(0.0) {|sumModul, zajecie| sumModul + zajecie.punktyECTS }
    end
  end

  def lacznaLiczbaECTSPraktycznych
    self.moduly_ksztalcenia.reduce(0.0) do |sum, modul|
      sum + modul.zajecia.reduce(0.0) {|sumModul, zajecie| sumModul + zajecie.punktyECTSP }
    end
  end

  def minLiczbaECTSOgolnouczelnianych
    self.moduly_ksztalcenia.select{|m| m.Obowiazkowy? }.reduce(0.0) do |sum, modul|
      sum + modul.zajecia.select{|z| z.czyOgolnouczelniany? }.reduce(0.0) {|sumModul, zajecie| sumModul + zajecie.punktyECTS }
    end
  end

  def lacznaLiczbaECTSModulyWyb
    self.moduly_ksztalcenia.select{|m| m.Opcjonalny? }.reduce(0.0) do |sum, modul|
      sum + modul.zajecia.reduce(0.0) {|sumModul, zajecie| sumModul + zajecie.punktyECTS }
    end
  end

end
