
# 2024 Olympic Medals API Documentation

This is a practice API I made using Rails. Please see the below documentation.

### Overview

- [Installation](#installation)
- [Endpoints](#endpoints)
  - [1. Filter by Country Codes](#1-filter-by-country-codes)
  - [2. Filter by Ranks](#2-filter-by-ranks)
  - [3. Sort by Field](#3-sort-by-field)
  - [4. Limit Results](#4-limit-results)
  - [5. Filter by Medal Type](#5-filter-by-medal-type)
- [Country Code Table](#country-code-table)

---

### Installation

#### 1. Clone the repository
```bash
git clone https://github.com/timchapin96/olypmic-medals-2024-api.git
```

#### 2. cd into the main directory

#### 3. Run the Docker containers
```bash
docker-compose up
```

#### 4. After the container is running, switch to a new tab and run the following commands to set up the database:
```bash
docker-compose run rails rails db:create
docker-compose run rails rails db:migrate
docker-compose run rails rails db:seed
```

---

### Base URL
`http://0.0.0.0:3000/countries`

Sortable types:
  rank, country, country_code, gold, silver, bronze, total

---

### Endpoints

#### 1. Filter by Country Codes
- **Description**: Retrieves countries filtered by the provided country codes.
- **Method**: GET
- **Parameters**:
  - `country_codes` (String or Array): A JSON-encoded string or an array of country codes to filter by.
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/countries?country_codes=["US","CAN","MEX"]
  ```

#### 2. Filter by Ranks
- **Description**: Retrieves countries filtered by the provided ranks.
- **Method**: GET
- **Parameters**:
  - `ranks` (String or Array): A JSON-encoded string or an array of ranks to filter by.
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/countries?ranks=["1","2","3"]
  ```

#### 3. Sort by Field
- **Description**: Retrieves countries sorted by the specified field.
- **Method**: GET
- **Parameters**:
  - `field` (String): The field to sort by.
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/countries?sort_by=country
  ```

#### 4. Limit Results
- **Description**: Retrieves a limited number of countries.
- **Method**: GET
- **Parameters**:
  - `limit` (Integer): The maximum number of countries to return.
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/countries?limit=10
  ```

#### 5. Filter by Medal Type
- **Description**: Retrieves countries where the count of a specific medal type meets or exceeds the provided count.
- **Method**: GET
- **Parameters**:
  - `medal_type` (String): The type of medal to filter by.
  - `count` (Integer): The minimum count of medals required.
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/countries?medal_type=gold&count=5
  ```
---
### Country Code Table

| Country          | Country Code | Country           | Country Code |
|------------------|--------------|-------------------|--------------|
| United States    | US           | Italy             | ITA          |
| China            | CHN          | Germany           | GER          |
| Japan            | JPN          | New Zealand       | NZ           |
| Australia        | AUS          | Canada            | CAN          |
| France           | FRA          | Uzbekistan        | UZB          |
| Netherlands      | NED          | Hungary           | HUN          |
| Great Britain    | GBG          | Spain             | SPA          |
| South Korea      | KOR          | Sweden            | SWE          |
| Ireland          | IRE          | Norway            | NOR          |
| Brazil           | BRZ          | Kenya             | KEN          |
| Iran             | IRN          | Greece            | GRE          |
| Ukraine          | UKR          | Argentina         | ARG          |
| Romania          | ROM          | Egypt             | EGY          |
| Georgia          | GEO          | Tunisia           | TUN          |
| Belgium          | BEL          | Botswana          | BOT          |
| Bulgaria         | BUL          | Chile             | CHI          |
| Serbia           | SER          | St Lucia          | LCA          |
| Czech Republic   | CZE          | Uganda            | UGA          |
| Denmark          | DEN          | Dominican Republic | DOM         |
| Azerbaijan       | AZE          | Guatemala         | GUA          |
| Croatia          | CRO          | Morocco           | MOR          |
| Cuba             | CUB          | Dominica          | DMA          |
| Bahrain          | BHR          | Pakistan          | PKN          |
| Slovenia         | SLO          | Turkey            | TUR          |
| Chinese Taipei   | TPE          | Mexico            | MEX          |
| Austria          | AUT          | Armenia           | ARM          |
| Hong Kong        | HK           | Colombia          | COL          |
| Philippines      | PHI          | North Korea       | PRK          |
| Algeria          | ALG          | Kyrgyzstan        | KGZ          |
| Indonesia        | IDN          | Lithuania         | LTU          |
| Israel           | ISR          | India             | IND          |
| Poland           | POL          | Moldova           | MDA          |
| Kazakhstan       | KAZ          | Kosovo            | KOS          |
| Jamaica          | JAM          | Cyprus            | CYP          |
| South Africa     | SA           | Fiji              | FIJ          |
| Thailand         | THA          | Jordan            | JOR          |
| Ethiopia         | ETH          | Mongolia          | MGL          |
| Switzerland      | SWI          | Panama            | PAN          |
| Ecuador          | ECU          | Tajikistan        | TJK          |
| Portugal         | POR          | Albania           | ALB          |
| Grenada          | GRN          | Malaysia          | MAS          |
| Puerto Rico      | PUR          | Cape Verde        | CPV          |
| Ivory Coast      | CIV          | Refugee Olympic Team | EOR      |
| Peru             | PER          | Qatar             | QAT          |
| Singapore        | SIN          | Slovakia          | SVK          |
| Zambia           | ZAM          
