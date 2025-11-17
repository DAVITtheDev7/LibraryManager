# **Library Manager App**

A full-stack **Flutter + Spring Boot Kotlin** project for managing books.
Mobile frontend uses **Clean Architecture + BLoC + Dio**, backend uses **Spring Boot + JPA + H2**.

---

##  **Tech Stack**

### Flutter (Frontend)

* Clean Architecture
* BLoC state management
* Dio HTTP client
* Repository pattern
* Modular folder structure

### Spring Boot Kotlin (Backend)

* Kotlin 1.9
* Spring Web
* Spring Data JPA
* H2 in-memory database
* REST API
* Gradle

---

## **Features**

✔ View book list
✔ Add new books
✔ REST API communication
✔ Search (title/author)
✔ Clean separation of layers (domain/data/presentation)
✔ Works on Android (emulator → `10.0.2.2`)

---

##  **Project Structure**

### **Frontend (Flutter)**

```
lib/
 ├── core/
 ├── data/
 │   ├── datasources/
 │   ├── models/
 │   └── repositories/
 ├── domain/
 │   ├── entities/
 │   ├── repositories/
 │   └── usecases/
 ├── presentation/
 │   ├── blocs/
 │   ├── pages/
 │   └── widgets/
 └── main.dart
```

### **Backend (Spring Boot Kotlin)**

```
src/main/kotlin/com/davitm/librarymanager/
 ├── controllers/
 ├── models/
 ├── repositories/
 ├── services/
 └── LibraryManagerApplication.kt
```

---

##  **API Endpoints (Spring Boot)**

### **GET all books**

```
GET /books
```

### **POST add book**

```
POST /books
Content-Type: application/json

{
  "title": "Harry Potter",
  "author": "J.K. Rowling",
  "publishYear": 1997,
  "available": true
}
```


