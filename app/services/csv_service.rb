class CsvService
  require 'csv'
  require 'rest-client'
  BASE_URL = 'http://repositorio.dados.gov.br/saude/unidades-saude/unidade-basica-saude/ubs.csv'.freeze

  def initialize(params)
    @lat = filter_params(params)[0]
    @long = filter_params(params)[1]
  end

  def process
    if geocode_ubs.empty?
      find_ubs
    else
      HealthUnit.where(id: geocode_ubs.first.health_unit_id)
    end
  end

  private

  def geocode_ubs
    Geocode.geocode_ubs(@lat, @long)
  end

  def find_ubs
    ubs_found = []
    csv.each do |row|
      next unless row['vlr_latitude'] == @lat && row['vlr_longitude'] == @long

      ubs = HealthUnit.new
      create_ubs(ubs, row)
      ubs.save!
      ubs_found << ubs
    end
    ubs_found.empty? ? nil : ubs_found
  end

  def csv
    CSV.parse(RestClient.get(BASE_URL).body.force_encoding('UTF-8'),
              headers: true)
  end

  def create_ubs(ubs, row)
    ubs.name = row['nom_estab']
    ubs.address = row['dsc_endereco']
    ubs.city = row['dsc_cidade']
    ubs.phone = row['dsc_telefone']
    ubs.geocode_attributes = { lat: row['vlr_latitude'],
                               long: row['vlr_longitude'] }
    ubs.score_attributes = { size: row['dsc_estrut_fisic_ambiencia'],
                             adaptation_for_seniors: row['dsc_adap_defic_fisic_idosos'],
                             medical_equipament: row['dsc_equipamentos'],
                             medicine: row['dsc_medicamentos'] }
  end

  def filter_params(params)
    params.split(',')
  end
end