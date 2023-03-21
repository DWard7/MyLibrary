package com.dustin.library.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.dustin.library.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
  Optional<User> findByEmail(String email);
}
