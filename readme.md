# Q1) What is PostgreSQL?

PostgreSQL (often called Postgres) is a powerful, open-source object-relational database system known for its reliability, scalability, and advanced features. Unlike simpler databases, PostgreSQL supports complex queries, large-scale data operations, and even non-relational data formats like JSON, making it a favorite for modern applications.

Originally developed in 1986 at UC Berkeley, PostgreSQL has grown into one of the most trusted database systems in the world. It's fully ACID-compliant (ensuring data integrity), supports multi-version concurrency control (MVCC), and is highly extensible—allowing developers to add custom functions, data types, and even programming languages like Python and JavaScript directly into the database.

Major cloud providers (AWS, Google Cloud, Azure) offer PostgreSQL as a managed service, proving its importance in enterprise and web applications.

## Key Features of PostgreSQL

✔ **Advanced SQL Compliance** – Supports complex queries, window functions, and Common Table Expressions (CTEs).  
✔ **JSON & NoSQL Capabilities** – Store and query JSON data like a document database (MongoDB alternative).  
✔ **Extensibility** – Add custom functions, data types, and even new programming languages (PL/pgSQL, PL/Python).  
✔ **High Performance** – Optimized indexing (B-tree, Hash, GiST, SP-GiST, GIN), parallel queries, and partitioning.  
✔ **Security & Reliability** – Role-based permissions, row-level security, and robust backup/recovery options.  
✔ **Geospatial Support** – Built-in PostGIS extension for geographic data (used in mapping apps).  
✔ **Full-Text Search** – Advanced text search capabilities (similar to Elasticsearch).  

## Common Use Cases

🚀 **Web & Mobile Applications** – Backend for dynamic websites (e.g., e-commerce, social media).  
📊 **Data Warehousing & Analytics** – Handles large datasets for BI tools like Tableau and Power BI.  
🗺 **Geographic Information Systems (GIS)** – Powering location-based apps (e.g., Uber, weather apps).  
📝 **Document & JSON Storage** – Alternative to MongoDB for flexible schema designs.  
🔒 **Financial Systems** – Banking, trading platforms (thanks to ACID compliance).  
🤖 **Machine Learning & AI** – Integrates with Python for data processing.  

## Why Choose PostgreSQL?

✅ **Free & Open-Source** – No licensing costs.  
✅ **Extensibility** – PostgreSQL allows for customization and extension with user-defined data types and functions.  
✅ **Highly Scalable** – Works for small apps and enterprise systems.  
✅ **Strong Community** – Regular updates, plugins, and support.  
✅ **Cloud-Ready** – Runs on AWS RDS, Google Cloud SQL, Azure Database.  
✅ **Security** – Offers robust security features like SSL encryption and access control, protecting sensitive data.  

Whether you're building a startup app, enterprise software, or a data-heavy system, PostgreSQL delivers performance, flexibility, and reliability.

# Topic 2 : TypeScript Interfaces vs Types: Key Differences

In TypeScript, to define the structure of data we use interfaces and types. But there are various differences between them as they differ in flexibility and usages. Some differences are given below:

---

## 1. Type Definitions

By using interfaces we cannot define primitive (`Boolean`, `number`, `string`, `bigint`, `symbol`), unions and tuple types of data. We can only define object types of data. But using `type`, we can define primitive type as well as object type of data.

**Example:**

```typescript
// Using interfaces
interface Vehicle {
  company: string;
  model: string;
}

const car: Vehicle = {
  company: "Toyota",
  model: "Camry",
};

console.log(car); // Output: { company: 'Toyota', model: 'Camry' }

// Using type
type Fruit = string;
const fruit = "Watermelon";
console.log(fruit); // logs "Watermelon"

type Fruits = {
  name: string;
  taste: string;
};

const fruits = {
  name: "Watermelon",
  taste: "Sweet",
};
console.log(fruits); // logs { name: 'Watermelon', taste: 'Sweet' }
```

## 2. Declaration Merging

In case of interfaces, two interfaces with the same name get merged. But in case of type, two types with same name cause an exception.

**Example:**

```typescript
// Interface merging works
interface Developer {
  name: string;
}
interface Developer {
  salary: number;
}

const developer: Developer = {
  name: "Shahbaz",
  age: 28,
}; // Valid - interfaces merge

// Type redeclaration causes error
type Student = {
  name: string;
};
type Student = {
  // Error: Duplicate identifier 'Student'
  meritPosition: number;
};
```

## 3. Extending Union Types

Interfaces support implementing and extending union types. On the other hand, type does not support implementing or extending union types directly.

**Key Differences:**

```typescript
// INTERFACES can extend union types
interface Sports {
  type: "cricket" | "football";
}

interface Hockey extends Sports {
  playingTime: number;
}

// TYPES cannot extend union types directly
type CommonDrinks = {
  type: "mojo" | "7up";
};

// Instead, you must use intersection (&)
type Pepsi = CommonDrinks & {
  taste: string;
};
```
