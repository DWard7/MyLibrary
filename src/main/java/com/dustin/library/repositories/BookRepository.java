package com.dustin.library.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.dustin.library.models.Book;

public interface BookRepository extends CrudRepository<Book, Long> {
  List<Book> findAll();
  
}
