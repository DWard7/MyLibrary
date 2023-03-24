package com.dustin.library.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.dustin.library.models.Book;
import com.dustin.library.services.BookService;

@Controller
public class BookController {

  @Autowired
  private BookService bookService;

  //! Create Book
  @GetMapping("/book/new")
  public String newBook(@ModelAttribute("book") Book book, HttpSession session) {
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    return "book/new.jsp";
  }

  @PostMapping("/book")
  public String createBook(
    @Valid @ModelAttribute("book") Book book,
    BindingResult result
  ) {
    if (result.hasErrors()) {
      return "book/new.jsp";
    } else {
      bookService.addBook(book);
      return "redirect:/home";
    }
  }

  //!Read My Books
  @GetMapping("/my/books")
    public String myBooks(Model model, HttpSession session) {
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    model.addAttribute("books", bookService.getAll());
    return "book/myBook.jsp";
  }

  //! Read All
  @GetMapping("/home")
  public String allBooks(Model model, HttpSession session) {
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    model.addAttribute("books", bookService.getAll());
    return "book/index.jsp";
  }

  //! Read One
  @GetMapping("/book/{id}")
  public String show(
    @PathVariable("id") Long id,
    Model model,
    HttpSession session
  ) {
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    Book book = bookService.getOne(id);
    model.addAttribute("book", book);
    return "book/show.jsp";
  }

  //! Update
  @GetMapping("/book/{id}/edit")
  public String edit(
    @PathVariable("id") Long id,
    Model model,
    HttpSession session
  ) {
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    Book book = bookService.getOne(id);
    model.addAttribute("book", book);
    return "book/edit.jsp";
  }

  @PutMapping("/book/{id}")
  public String update(
    @Valid @ModelAttribute("book") Book book,
    BindingResult result
  ) {
    if (result.hasErrors()) {
      return "book/edit.jsp";
    } else {
      bookService.updateName(book);
      return "redirect:/home";
    }
  }

  //! Delete
  @DeleteMapping("/book/{id}")
  public String delete(@PathVariable("id") Long id, HttpSession session) {
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    bookService.deleteName(id);
    return "redirect:/home";
  }

}
