class Score < ApplicationRecord
  belongs_to :health_unit
  CTE = {'Desempenho mediano ou  um pouco abaixo da média' => 1, 'Desempenho acima da média' => 2, 'Desempenho muito acima da média' => 3}
  enum adaptation_for_seniors: CTE , _prefix: :adaptation
  enum medical_equipament: CTE, _prefix: :medical
  enum medicine: CTE, _prefix: :medicine
  enum size: CTE, _prefix: :size

  def self.update_or_create(attributes)
    assign_or_new(attributes).save
  end

  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end

end
