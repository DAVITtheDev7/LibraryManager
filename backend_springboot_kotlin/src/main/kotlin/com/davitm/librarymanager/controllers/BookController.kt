package com.davitm.librarymanager.controllers
import com.davitm.librarymanager.models.Book
import com.davitm.librarymanager.services.BookService
import org.springframework.web.bind.annotation.*


@RestController
@RequestMapping("/books")
class BookController(
    private val service: BookService
) {

    @GetMapping
    fun getAll() = service.getAll()

    @GetMapping("/{id}")
    fun getById(@PathVariable id: Long) = service.getById(id)

    @PostMapping
    fun create(@RequestBody book: Book) = service.create(book)

    @PutMapping("/{id}")
    fun update(@PathVariable id: Long, @RequestBody book: Book) =
        service.update(id, book)

    @DeleteMapping
    fun delete(id: Long) = service.delete(id)

    @GetMapping("/search")
    fun search(@RequestParam q: String) = service.search(q)
}