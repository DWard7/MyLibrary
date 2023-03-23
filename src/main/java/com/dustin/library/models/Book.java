package com.dustin.library.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "books")
public class Book {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotEmpty(message = "Title is required.")
  @Size(min = 3, message = "Title must be atleast 2 characters.")
  private String title;

  @NotEmpty(message = "Author is required.")
  @Size(min = 3, message = "Author must be atleast 3 characters.")
  private String author;

  @NotEmpty(message = "Genre is required.")
  @Size(min = 3, message = "Genre must be atleast 3 characters.")
  private String genre;

  @NotNull(message = "Book Code required.")
  private Integer bookCode;

  @NotEmpty(message = "Description required.")
  @Size(min = 10, max = 225, message = "Description must be atleast 10 characters.")
  private String description;


  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_id")
  private User user;

  public Book() {}

  public Book(
    Long id,
    String title,
    String author,
    String genre,
    Integer bookCode,
    String description,
    User user
  ) {
    this.id = id;
    this.title = title;
    this.author = author;
    this.genre = genre;
    this.bookCode = bookCode;
    this.description = description;
    this.user = user;
  }

  public String getDescription() {
    return this.description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public User getUser() {
    return this.user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTitle() {
    return this.title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getAuthor() {
    return this.author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public String getGenre() {
    return this.genre;
  }

  public void setGenre(String genre) {
    this.genre = genre;
  }

  public Integer getBookCode() {
    return this.bookCode;
  }

  public void setBookCode(Integer bookCode) {
    this.bookCode = bookCode;
  }

}
