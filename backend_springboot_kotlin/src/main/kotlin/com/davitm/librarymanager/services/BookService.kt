package com.davitm.librarymanager.services
import com.davitm.librarymanager.models.Book
import com.davitm.librarymanager.repositories.BookRepository
import org.springframework.stereotype.Service
@Service
class BookService(
    private val repo: BookRepository
) {

    fun getAll(): List<Book> = repo.findAll()

    fun getById(id: Long): Book =
        repo.findById(id).orElseThrow { RuntimeException("Book not found") }

    fun create(book: Book): Book = repo.save(book)

    fun update(id: Long, new: Book): Book {
        val old = getById(id)
        val updated = old.copy(
            title = new.title,
            author = new.author,
            publishYear = new.publishYear,
            available = new.available
        )
        return repo.save(updated)
    }

    fun delete(id: Long) = repo.deleteById(id)

    fun search(query: String): List<Book> =
        repo.findByTitleContainingIgnoreCase(query) +
                repo.findByAuthorContainingIgnoreCase(query)
}
