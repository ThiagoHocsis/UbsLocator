class Score < ApplicationRecord
  belongs_to :health_unit
  SCORES = { 'Desempenho mediano ou  um pouco abaixo da média' => 1,
             'Desempenho acima da média' => 2,
             'Desempenho muito acima da média' => 3 }.freeze
  enum adaptation_for_seniors: SCORES, _prefix: :adaptation
  enum medical_equipament: SCORES, _prefix: :medical
  enum medicine: SCORES, _prefix: :medicine
  enum size: SCORES, _prefix: :size
end
