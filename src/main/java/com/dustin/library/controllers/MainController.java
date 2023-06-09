package com.dustin.library.controllers;

import com.dustin.library.models.LoginUser;

import com.dustin.library.models.User;
import com.dustin.library.services.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

  @Autowired
  private UserService userService;

  @GetMapping("/register/account")
  public String register(Model model) {
    model.addAttribute("newUser", new User());
    model.addAttribute("newLogin", new LoginUser());
    return "register.jsp";
  }

  @PostMapping("/register")
  public String register(
    @Valid @ModelAttribute("newUser") User newUser,
    BindingResult result,
    Model model,
    HttpSession session
  ) {
    User user = userService.register(newUser, result);
    if (result.hasErrors()) {
      model.addAttribute("newLogin", new LoginUser());
      return "index.jsp";
    }
    session.setAttribute("userId", user.getId());
    session.setAttribute("firstName", user.getFirstName());
    return "redirect:/home";
  }

  @GetMapping("/")
  public String index(Model model) {
    model.addAttribute("newUser", new User());
    model.addAttribute("newLogin", new LoginUser());
    return "index.jsp";
  }

  @PostMapping("/login")
  public String login(
    @Valid @ModelAttribute("newLogin") LoginUser newLogin,
    BindingResult result,
    Model model,
    HttpSession session
  ) {
    User user = userService.login(newLogin, result);

    if (result.hasErrors()) {
      model.addAttribute("newUser", new User());
      return "index.jsp";
    }
    session.setAttribute("userId", user.getId());
    session.setAttribute("firstName", user.getFirstName());
    return "redirect:/home";
  }

  @GetMapping("/logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/";
  }
}
