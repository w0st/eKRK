class KierunekStudiow < ActiveRecord::Base
  has_many :programy_ksztalcenia
  belongs_to :wydzial

  def as_json(options={})
    super(
        :include => {
            :wydzial => super()
        }
    )
  end
end
