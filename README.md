2024 Olympic Medals API Documentation

This is a practice API I made using Rails. Please see the below documentation.

### Overview


---

### Base URL
`http://localhost:[port]/countries`

### Endpoints

#### 1. Filter by Country Codes
- **Description**: Retrieves countries filtered by the provided country codes.
- **Method**: GET
- **Parameters**:
  - `country_codes` (String or Array): A JSON-encoded string or an array of country codes to filter by.
- **Example Request**:
  ```http
  GET http://localhost:[port]/countries?country_codes=["USA","CAN","MEX"]
  ```

#### 2. Filter by Ranks
- **Description**: Retrieves countries filtered by the provided ranks.
- **Method**: GET
- **Parameters**:
  - `ranks` (String or Array): A JSON-encoded string or an array of ranks to filter by.
- **Example Request**:
  ```http
  GET http://localhost:[port]/countries?ranks=["1","2","3"]
  ```

#### 3. Sort by Field
- **Description**: Retrieves countries sorted by the specified field.
- **Method**: GET
- **Parameters**:
  - `field` (String): The field to sort by.
- **Example Request**:
  ```http
  GET http://localhost:[port]/countries?sort_by=name
  ```

#### 4. Limit Results
- **Description**: Retrieves a limited number of countries.
- **Method**: GET
- **Parameters**:
  - `limit` (Integer): The maximum number of countries to return.
- **Example Request**:
  ```http
  GET http://localhost:[port]/countries?limit=10
  ```

#### 5. Filter by Medal Type
- **Description**: Retrieves countries where the count of a specific medal type meets or exceeds the provided count.
- **Method**: GET
- **Parameters**:
  - `medal_type` (String): The type of medal to filter by.
  - `count` (Integer): The minimum count of medals required.
- **Example Request**:
  ```http
  GET http://localhost:[port]/countries?medal_type=gold&count=5
  ```
