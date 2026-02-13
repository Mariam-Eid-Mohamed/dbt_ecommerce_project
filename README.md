
###  RAW Layer
- Source transactional tables stored in PostgreSQL
- Preserves original data structure

###  STAGING Layer
- dbt models built as views
- Standardizes schema and prepares clean datasets

###  ANALYTICS Layer
- Aggregation marts designed for reporting
- Examples:
  - Monthly sales summary
  - Regional performance analytics
  - Customer payment metrics

###  SNAPSHOTS
- Implements Slowly Changing Dimension logic
- Tracks historical changes in order status

---

## 📊 Data Sources

Synthetic e-commerce relational dataset including:

- Customers
- Orders
- Products
- Payments
- Regions
- Shipping data

The dataset simulates transactional business workflows used to build analytics-ready models.

---

## ⚙️ Technology Stack

- dbt Core
- PostgreSQL
- SQL
- dbt Snapshots & Tests
- WSL Ubuntu Environment
- DBeaver

---

##  Key Engineering Practices

- Layered data warehouse design
- Aggregation marts for KPI reporting
- dbt testing for data integrity
- Snapshot modeling for historical tracking
- Role-based database access configuration

---

## 📈 Example Insights Enabled

- Monthly revenue performance
- Regional sales trends
- Customer payment behavior analytics

---

##  Future Improvements

- Cloud warehouse migration (Snowflake)
- Workflow orchestration with Airflow
- Incremental model optimization
