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
    <title>Library Management</title>
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
      class="flex flex-1 flex-col justify-center py-12 px-4 sm:px-6 lg:flex-none lg:px-20 xl:px-24"
    >
      <div class="mx-auto w-full max-w-sm lg:w-96">
        <div>
          <h1 class="flex justify-center text-3xl font-bold tracking-tight text-gray-900">
            Welcome to MyLibrary
          </h1>
          <h2 class="flex justify-center mt-2 text-2xl font-bold tracking-tight text-gray-900">
            Sign in to your account
          </h2>
        </div>
        <div class="mt-8">
          <div class="mt-6">
            <form:form action="/login" method="post" modelAttribute="newLogin" class="space-y-6">
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
                    class="block w-full rounded-md border-0 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
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
                    class="block w-full rounded-md border-0 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                  <form:errors path="password" />
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
            <p class="flex justify-center mt-2 text-sm text-gray-600">
              <a
              href="/register/account"
              class="font-medium text-indigo-600 hover:text-indigo-500"
              >Register here.
              </a>
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="relative hidden w-0 flex-1 lg:block">
      <img src="/img/books.jpg" alt="books" />
    </div>
  </div>
</html>
