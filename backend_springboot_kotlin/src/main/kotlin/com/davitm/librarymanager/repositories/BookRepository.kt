package com.davitm.librarymanager.repositories
import com.davitm.librarymanager.models.Book
import org.springframework.data.jpa.repository.JpaRepository


interface BookRepository : JpaRepository<Book, Long> {
    fun findByTitleContainingIgnoreCase(title: String): List<Book>
    fun findByAuthorContainingIgnoreCase(author: String): List<Book>
}
