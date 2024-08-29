# 2024 Olympic Medals API Documentation

This is a practice API built using Rails. Below is the documentation for using the API.

### Overview

- [Installation](#installation)
- [Base URL](#base-url)
- [Endpoints](#endpoints)
  - [1. Filter by Country Codes](#1-filter-by-country-codes)
  - [2. Sort by Field](#2-sort-by-field)
  - [3. Limit Results](#3-limit-results)
  - [4. Filter by Medal Type Count](#4-filter-by-medal-type-count)
  - [5. Filter by Total Medal Count](#5-filter-by-total-medal-count)
- [Country Code Table](#country-code-table)
- [Code Snippets](#code-snippets)

---

### Installation

#### 1. Clone the repository
```bash
git clone https://github.com/timchapin96/olympic-medals-2024-api.git
```

#### 2. Navigate to the main directory
```bash
cd olympic-medals-2024-api
```

#### 3. Run the Docker containers
```bash
docker-compose up
```

#### 4. Set up the database
After the container is running, switch to a new terminal tab and run the following commands:

```bash
docker-compose run rails rails db:create
docker-compose run rails rails db:migrate
docker-compose run rails rails db:seed
```

---

### Base URL

The base URL for the API is:
```
http://0.0.0.0:3000/olympic_medals
```

Sortable fields include:
- `rank`
- `country`
- `country_code`
- `gold`
- `silver`
- `bronze`
- `total`

---

### Endpoints

#### 1. Filter by Country Codes

- **Description**: Retrieves countries filtered by the provided country codes.
- **Method**: GET
- **Parameters**:
  - `country_codes` (String): Comma-separated list of country codes to filter by.
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/olympic_medals?country_codes=US,UK,JPN,GER
  ```

#### 2. Sort by Field

- **Description**: Retrieves countries sorted by the specified field.
- **Method**: GET
- **Parameters**:
  - `field` (String): The field to sort by (e.g., `rank`, `total`).
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/olympic_medals?sort_by=country
  ```

#### 3. Limit Results

- **Description**: Retrieves a limited number of countries.
- **Method**: GET
- **Parameters**:
  - `limit` (Integer): The maximum number of countries to return.
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/olympic_medals?limit=10
  ```

#### 4. Filter by Medal Type Count

- **Description**: Retrieves countries where the count of a specific medal type meets or exceeds the provided count.
- **Method**: GET
- **Parameters**:
  - `medal_type` (String): The type of medal to filter by (e.g., `gold`, `silver`, `bronze`).
  - `greater_than` (Integer): The minimum count of medals required.
  - `less_than` (Integer): The maximum count of medals required.
- **Example Requests**:
  ```http
  GET http://0.0.0.0:3000/olympic_medals?medal_type=gold&greater_than=5&less_than=10
  GET http://0.0.0.0:3000/olympic_medals?medal_type=gold&&less_than=10
  GET http://0.0.0.0:3000/olympic_medals?medal_type=gold&greater_than=5
  ```

#### 5. Filter by Total Medal Count

- **Description**: Retrieves countries where the total medal count meets or exceeds the provided count.
- **Method**: GET
- **Parameters**:
  - `medal_total_min` (Integer): The minimum total medal count required.
  - `medal_total_max` (Integer): The maximum total medal count required.
- **Example Request**:
  ```http
  GET http://0.0.0.0:3000/olympic_medals?medal_total_min=25&medal_total_max=35
  GET http://0.0.0.0:3000/olympic_medals?medal_total_max=35
  GET http://0.0.0.0:3000/olympic_medals?medal_total_min=25
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
| Great Britain    | GBR          | Spain             | SPA          |
| South Korea      | KOR          | Sweden            | SWE          |
| Ireland          | IRE          | Norway            | NOR          |
| Brazil           | BRA          | Kenya             | KEN          |
| Iran             | IRN          | Greece            | GRE          |
| Ukraine          | UKR          | Argentina         | ARG          |
| Romania          | ROU          | Egypt             | EGY          |
| Georgia          | GEO          | Tunisia           | TUN          |
| Belgium          | BEL          | Botswana          | BOT          |
| Bulgaria         | BUL          | Chile             | CHI          |
| Serbia           | SRB          | St Lucia          | LCA          |
| Czech Republic   | CZE          | Uganda            | UGA          |
| Denmark          | DEN          | Dominican Republic | DOM         |
| Azerbaijan       | AZE          | Guatemala         | GUA          |
| Croatia          | HRV          | Morocco           | MAR          |
| Cuba             | CUB          | Dominica          | DMA          |
| Bahrain          | BHR          | Pakistan          | PAK          |
| Slovenia         | SVN          | Turkey            | TUR          |
| Chinese Taipei   | TPE          | Mexico            | MEX          |
| Austria          | AUT          | Armenia           | ARM          |
| Hong Kong        | HKG          | Colombia          | COL          |
| Philippines      | PHI          | North Korea       | PRK          |
| Algeria          | ALG          | Kyrgyzstan        | KGZ          |
| Indonesia        | IDN          | Lithuania         | LTU          |
| Israel           | ISR          | India             | IND          |
| Poland           | POL          | Moldova           | MDA          |
| Kazakhstan       | KAZ          | Kosovo            | KOS          |
| Jamaica          | JAM          | Cyprus            | CYP          |
| South Africa     | RSA          | Fiji              | FIJ          |
| Thailand         | THA          | Jordan            | JOR          |
| Ethiopia         | ETH          | Mongolia          | MGL          |
| Switzerland      | CHE          | Panama            | PAN          |
| Ecuador          | ECU          | Tajikistan        | TJK          |
| Portugal         | PRT          | Albania           | ALB          |
| Grenada          | GRD          | Malaysia          | MAS          |
| Puerto Rico      | PUR          | Cape Verde        | CPV          |
| Ivory Coast      | CIV          | Refugee Olympic Team | EOR      |
| Peru             | PER          | Qatar             | QAT          |
| Singapore        | SGP          | Slovakia          | SVK          |
| Zambia           | ZAM
