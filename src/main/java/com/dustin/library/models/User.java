package com.dustin.library.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
public class User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotEmpty(message = "First name is required")
  @Size(
    min = 2,
    max = 15,
    message = "First name must be between 2-15 characters"
  )
  private String firstName;

  @NotEmpty(message = "Last name is required")
  @Size(
    min = 2,
    max = 15,
    message = "Last name must be between 2-15 characters"
  )
  private String lastName;

  @NotEmpty(message = "Username is required")
  @Size(
    min = 3,
    max = 30,
    message = "Username must be between 3 and 30 characters"
  )
  private String userName;

  @NotEmpty(message = "Email is required")
  @Email(message = "Please enter a valid email")
  private String email;

  @NotNull(message = "Phone number required")
  @Min(10)
  private Integer phoneNumber;

  @NotEmpty(message = "Password is required")
  @Size(
    min = 8,
    max = 128,
    message = "Password must be between 8 and 128 characters."
  )
  private String password;

  @Transient
  @NotEmpty(message = "Confirm Password is required")
  @Size(
    min = 8,
    max = 128,
    message = "Confirm Password must be between 8 and 128 characters"
  )
  private String confirm;

  @Column(updatable = false)
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createdAt;

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date updatedAt;

  @OneToMany(mappedBy = "user", fetch =FetchType.LAZY)
  private List<Book> books;

  public User() {}


  public User(Long id, String firstName, String lastName, String userName, String email, Integer phoneNumber, String password, String confirm, Date createdAt, Date updatedAt, List<Book> books) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.userName = userName;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.password = password;
    this.confirm = confirm;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.books = books;
  }


  public Integer getPhoneNumber() {
    return this.phoneNumber;
  }

  public void setPhoneNumber(Integer phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  public List<Book> getBooks() {
    return this.books;
  }

  public void setBooks(List<Book> books) {
    this.books = books;
  }


  public String getFirstName() {
    return this.firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return this.lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getUserName() {
    return this.userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getEmail() {
    return this.email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return this.password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getConfirm() {
    return this.confirm;
  }

  public void setConfirm(String confirm) {
    this.confirm = confirm;
  }

  public Date getCreatedAt() {
    return this.createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public Date getUpdatedAt() {
    return this.updatedAt;
  }

  public void setUpdatedAt(Date updatedAt) {
    this.updatedAt = updatedAt;
  }
}
