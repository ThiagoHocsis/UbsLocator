class CsvService
  require 'csv'
  require 'rest-client'
  BASE_URL = 'http://repositorio.dados.gov.br/saude/unidades-saude/unidade-basica-saude/ubs.csv'

  def initialize(params)
    @lat = params.split(',')[0]
    @long = params.split(',')[1]
  end

  def process
    if geocode_ubs.empty?
      find_in_csv
    else
      HealthUnit.where(id: geocode_ubs.first.health_unit_id)
    end
  end

  private

  def geocode_ubs
    Geocode.geocode_ubs(@lat, @long)
  end

  def find_in_csv
    ubs_found = []
    csv.each do |row|
      if row['vlr_latitude'] == @lat && row['vlr_longitude'] == @long
        ubs = HealthUnit.find_or_initialize_by(name: row['nom_estab'])
        ubs.address = row['dsc_endereco']
        ubs.city = row['dsc_cidade']
        ubs.phone = row['dsc_telefone']
        ubs.geocode_attributes =  {lat: row['vlr_latitude'], long: row['vlr_longitude']}
        ubs.score_attributes =  {size: row['dsc_estrut_fisic_ambiencia'],
                                 adaptation_for_seniors: row['dsc_adap_defic_fisic_idosos'],
                                 medical_equipament: row['dsc_equipamentos'],
                                 medicine: row['dsc_medicamentos']}
        ubs.save!
        ubs_found << ubs
      end
    end
    ubs_found
  end

  def csv
      CSV.parse(RestClient.get(BASE_URL).body.force_encoding("UTF-8"), :headers => true)
  end

end