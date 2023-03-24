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
    <link rel="stylesheet" href="/templates/style.css" />
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
  </head>
  <body>
    <nav class="bg-gray-800 shadow flex justify-content-end">
      <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="relative flex h-16 justify-between">
          <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
            <button
              type="button"
              class="inline-flex items-center justify-center rounded-md p-2 text-sky-400 hover:bg-sky-100 hover:text-sky-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
              aria-controls="mobile-menu"
              aria-expanded="false"
            >
              <span class="sr-only">Open main menu</span>
              <svg
                class="block h-6 w-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                aria-hidden="true"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
                />
              </svg>
              <svg
                class="hidden h-6 w-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                aria-hidden="true"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
            </button>
          </div>
          <div
            class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start"
          >
            <div class="hidden sm:ml-6 sm:flex sm:space-x-8">
              <h1
                style="font-size: 1.6rem"
                class="mb-2 inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500"
              >
                MyLibrary
              </h1>
              <a
                href="/home"
                class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700"
                >Home</a
              >
              <a
                href="/my/books"
                class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700"
                >My Books</a
              >
              <a
                href="/book/new"
                class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700"
                >New Books</a
              >
              <a
                href="/logout"
                class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700"
                >Logout</a
              >
            </div>
          </div>
        </div>
      </div>
      <div class="sm:hidden" id="mobile-menu">
        <div class="space-y-1 pt-2 pb-4">
          <a
            href="/home"
            class="block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-sky-500 hover:border-sky-300 hover:bg-sky-50 hover:text-sky-700"
            >Home</a
          >
          <a
            href="/my/books"
            class="block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-sky-500 hover:border-sky-300 hover:bg-sky-50 hover:text-sky-700"
            >My Books</a
          >
          <a
            href="/logout"
            class="block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-sky-500 hover:border-sky-300 hover:bg-sky-50 hover:text-sky-700"
            >Logout</a
          >
        </div>
      </div>
    </nav>
    <div class="flex justify-center min-h-full">
      <div class="flex flex-1 flex-col justify-center pt-1 px-4 sm:px-6 lg:flex-none lg:px-20 xl:px-24"
      >
        <div class="mx-auto w-full max-w-sm lg:w-96">
          <h1 style="font-size:1.6rem" class="d-flex justify-content-center mt-3">
            Edit Book
          </h1>
          <div>
            <form:form action="/book/${book.id}" method="post" modelAttribute="book" class="space-y-3">
              <input type="hidden" name="_method" value="put">
              <form:hidden path="user" value="${userId}"></form:hidden>
              <div class="form-group">
                <form:label class="block text-sm font-medium leading-6 text-gray-900"  path="title">Title:</form:label>
                <form:input class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" path="title" />
                <form:errors path="title" />
              </div>
              <div class="form-group">
                <form:label class="block text-sm font-medium leading-6 text-gray-900" path="author">Author:</form:label>
                <form:input class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" path="author" />
                <form:errors path="author" />
              </div>
              <div class="form-group">
                <form:label class="block text-sm font-medium leading-6 text-gray-900" path="genre">Genre:</form:label>
                <form:input class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" path="genre" />
                <form:errors path="genre" />
              </div>
              <div class="form-group">
                <form:label class="block text-sm font-medium leading-6 text-gray-900" path="description">Description:</form:label>
                <form:input class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" path="description" />
                <form:errors path="description" />
              </div>
              <div class="form-group">
                <form:label class="block text-sm font-medium leading-6 text-gray-900" path="thoughts">My Thoughts:</form:label>
                <form:input type="text" size="50" class="block w-full rounded-md border-2 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" path="thoughts" />
                <form:errors path="thoughts" />
              </div>
              <div>
                <button
                  type="submit"
                  value="add book"
                  class="mt-2 rounded-md bg-indigo-600 py-2 px-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Submit</button>
              </div>
            </form:form>
            <form:form action="/book/${book.id}">
              <input type="hidden" name="_method" value="delete" />
              <button type="submit" class="mt-2 rounded-md bg-red-600 py-1.5 px-2.5 text-md font-semibold text-white shadow-sm hover:bg-red-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Delete</button>
            </form:form>
        </div>
        </div>
      </div>
    </div>
  </body>
</html>
