package com.davitm.librarymanager.models
import jakarta.persistence.*

@Entity
data class Book(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    var title: String = "",
    var author: String = "",
    var publishYear: Int = 0,
    var available: Boolean = true
)
