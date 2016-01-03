class UdzialObszaru < ActiveRecord::Base
  belongs_to :obszar_ksztalcenia
  belongs_to :program_ksztalcenia
end
