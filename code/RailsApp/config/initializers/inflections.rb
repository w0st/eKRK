# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'obszarowy_efekt_ksztalcenia', 'obszarowe_efekty_ksztalcenia'
  inflect.irregular 'kierunkowy_efekt_ksztalcenia', 'kierunkowe_efekty_ksztalcenia'
  inflect.irregular 'przedmiotowy_efekt_ksztalcenia', 'przedmiotowe_efekty_ksztalcenia'
  inflect.irregular 'obszar_ksztalcenia', 'obszary_ksztalcenia'
  inflect.irregular 'udzial_obszaru', 'udzialy_obszarow'
  inflect.irregular 'program_ksztalcenia', 'programy_ksztalcenia'
  inflect.irregular 'ProgramKsztalcenia', 'ProgramyKsztalcenia'
  inflect.irregular 'kierunek_studiow', 'kierunki_studiow'
  inflect.irregular 'wydzial', 'wydzialy'
  inflect.irregular 'program_studiow', 'programy_studiow'
  inflect.irregular 'zagadnienie_egzaminu_dyplomowego', 'zagadnienia_egzaminu_dyplomowego'
  inflect.irregular 'profil_modulu', 'profile_modulow'
  inflect.irregular 'plan_studiow', 'plany_studiow'
  inflect.irregular 'zajecia', 'zajecia'
  inflect.irregular 'przedmiot_ksztalcenia', 'przedmioty_ksztalcenia'
  inflect.irregular 'karta_przedmiotu', 'karty_przedmiotow'
  inflect.irregular 'pracownik_naukowy', 'pracownicy_naukowi'
  inflect.irregular 'kurs', 'kursy'
  inflect.irregular 'grupa_kursow', 'grupy_kursow'
  inflect.irregular 'semestr', 'semestry'
  inflect.irregular 'modul_ksztalcenia', 'moduly_ksztalcenia'

end
