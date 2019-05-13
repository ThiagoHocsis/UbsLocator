# UbsLocator

API utilizada para encontrar dada a latitude e a longitude uma Unidade de Saúde Básica (UBS) e suas informções.

## Como baixar o projeto

* No Terminal digite o comando ```git clone https://github.com/ThiagoHocsis/UbsLocator.git```

### Pré Requisitos

* Ruby versão 2.4.1

* Rails versão 5.0.7.2


### Instalação

* Após fazer o clone no projeto navegue até pasta do projeto e digite ```bundle install``` e em seguida ```rails db:create rails db:migrate```


## Como rodar os testes

* Dentro da pasta do projeto digite no terminal ```rspec spec --format documentation```

## Deploy

A aplicação está em produção na URL https://ubslocator.herokuapp.com

## Outras informações

* Ferramenta utilizada para realização dos requests na API - POSTMAN, disponivel para downlaod em
https://www.getpostman.com/

* Como rodar o linter de code smells - Acesso o projeto pelo terminal e digite ```rubocop```

## Considerações

O objetivo do sistema é acessar a API de dados do governo sobre *Unidades Básicas de Saúde - UBS* disponivel em http://dados.gov.br/dataset/unidades-basicas-de-saude-ubs 
e dado uma geolocalização que é composta por Latitude e Longitude o sistema deve retornar se nessa localização
existe uma Unidade de Saúde Básica, caso exista, é retornado um JSON composto pela página atual,
a quantidade de UBS por página e a quatidade de UBS encontradas nessa localização. Dentro do Array de Entries
são dadas descritas as Unidades de saúde básica encontradas, contendo os campos, id, nome, endereço e phone, dentro do
objeto geocode temos os campos lat e long, que são as coordenadas dadas na requisição e em seguinte temos o objeto Score,
que é uma classificação da UBS que vai de 1 a 3. 1 equivale a *Desempenho mediano ou  um pouco abaixo da média*,
2 é equivalente a *Desempenho acima da média* e 3 *Desempenho muito acima da média*, os campos que são
contemplados por esse score são: tamanho, adaptação para idosos, equipamentos médicos e remédios.

## Exemplo de requisições e retorno.

Uma requisição válida.

https://ubslocator.herokuapp.com/api/v1/find_ubs?query=-21.2585234642023,-45.003476142882&page=1&per_page=1

Obtém como retorno o seguinte JSON.

```javascript
{
    "current_page": "1",
    "per_page": "1",
    "total_entries": 1,
    "entries": [
        {
            "id": 1,
            "name": "CRUZEIRO DO SUL",
            "address": "R OUVIDOR BUSTAMANT",
            "city": "Lavras",
            "phone": "353694413",
            "geocode": {
                "lat": -21.2585234642023,
                "long": -45.003476142882
            },
            "scores": {
                "size": 1,
                "adaptation_for_senior": 1,
                "medical_equipament": 1,
                "medicine": 2
            }
        }
    ]
}
```

Uma requisição com uma geolocalizão que não consta no arquivo CSV fornecido pelo Governo.

https://ubslocator.herokuapp.com/api/v1/find_ubs?query=-21.22323232324642023,-45.003476142882&page=1&per_page=1

Obtém como retorno:

```javascript
{
    "error": "UBS not found"
}
```


 


