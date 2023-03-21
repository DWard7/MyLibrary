package com.dustin.library.services;

import com.dustin.library.models.Book;
import com.dustin.library.repositories.BookRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {

  @Autowired
  BookRepository bookRepository;

  //! Create
  public void addBook(Book book) {
    bookRepository.save(book);
  }

  //! Read All
  public List<Book> getAll() {
    return bookRepository.findAll();
  }

  //! Read One
  public Book getOne(Long id) {
    Optional<Book> optionalBook = bookRepository.findById(id);
    return optionalBook.orElse(null);
  }

  //! Update
  public void updateName(Book book) {
    bookRepository.save(book);
  }

  //! Delete
  public void deleteName(Long id) {
    bookRepository.deleteById(id);
  }
}
