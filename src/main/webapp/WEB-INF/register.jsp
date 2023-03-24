<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>MyLibrary</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
  </head>
  <div class="flex min-h-full">
    <div
      class="flex flex-1 flex-col justify-center pt-1 px-4 sm:px-6 lg:flex-none lg:px-20 xl:px-24"
    >
      <div class="mx-auto w-full max-w-sm lg:w-96">
        <div>
          <h1 class="flex justify-center text-3xl font-bold tracking-tight text-gray-900">
            MyLibrary
          </h1>
          <h2 class="flex justify-center text-2xl font-bold tracking-tight text-gray-900">
            Register your account
          </h2>
          </p>
        </div>
        <div class="mt-3">
          <div class="mt-3">
            <form:form action="/register" method="post" modelAttribute="newUser" class="space-y-3">
              <div>
                <form:label
                  path="firstName"
                  class="block text-sm font-medium leading-6 text-gray-900"
                  >First Name</form:label
                >
                <div class="mt-2">
                  <form:input
                    path="firstName"
                    id="firstName"
                    name="firstName"
                    class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                  <form:errors path="firstName" />
                </div>
              </div>
              <div>
                <form:label
                  path="lastName"
                  class="block text-sm font-medium leading-6 text-gray-900"
                  >Last Name</form:label
                >
                <div class="mt-2">
                  <form:input
                    path="lastName"
                    id="lastName"
                    name="lastName"
                    class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                  <form:errors path="lastName" />
                </div>
              </div>
              <div>
                <form:label
                  path="phoneNumber"
                  class="block text-sm font-medium leading-6 text-gray-900"
                  >Phone Name</form:label
                >
                <div class="mt-2">
                  <form:input
                    path="phoneNumber"
                    id="phoneNumber"
                    name="phoneNumber"
                    class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                  <form:errors path="phoneNumber" />
                </div>
              </div>
              <div>
                <form:label
                  path="email"
                  class="block text-sm font-medium leading-6 text-gray-900"
                  >Email address</form:label
                >
                <div class="mt-2">
                  <form:input
                    path="email"
                    id="email"
                    name="email"
                    type="email"
                    autocomplete="email"
                    class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                  <form:errors path="email" />
                </div>
              </div>
              <div class="space-y-1">
                <form:label
                  path="password"
                  class="block text-sm font-medium leading-6 text-gray-900"
                  >Password</form:label
                >
                <div class="mt-2">
                  <form:input
                    path="password"
                    id="password"
                    name="password"
                    type="password"
                    autocomplete="current-password"
                    class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                  <form:errors path="password" />
                </div>
              </div>
              <div class="space-y-1">
                <form:label
                  path="confirm"
                  class="block text-sm font-medium leading-6 text-gray-900"
                  >Confirm Password</form:label
                >
                <div class="mt-2">
                  <form:input
                    path="confirm"
                    id="confirm"
                    name="confirm"
                    type="password"
                    autocomplete="current-"
                    class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                  <form:errors path="confirm" />
                </div>
              </div>
              <div>
                <button
                  type="submit"
                  class="flex w-full justify-center rounded-md bg-indigo-600 py-2 px-3 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                >
                  Sign in
                </button>
              </div>
            </form:form>
          </div>
        </div>
      </div>
    </div>
    <div class="relative hidden w-0 flex-1 lg:block">
      <img src="/img/register.jpg" alt="books" />
    </div>
  </div>
</html>
