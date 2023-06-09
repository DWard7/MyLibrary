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
  <body>
    <nav class="bg-gray-800 shadow flex justify-content-end">
      <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="relative flex h-16 justify-between">
          <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
            <button type="button" class="inline-flex items-center justify-center rounded-md p-2 text-sky-400 hover:bg-sky-100 hover:text-sky-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500" aria-controls="mobile-menu" aria-expanded="false">
              <span class="sr-only">Open main menu</span>
              <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
              </svg>
              <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
          <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
            <div class="hidden sm:ml-6 sm:flex sm:space-x-8">
              <h1 style="font-size:1.6rem" class="mb-2 inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500">MyLibrary</h1>
              <a href="/my/books" class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700">My Books</a>
              <a href="/book/new" class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700">New Books</a>
              <a href="/logout" class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700">Logout</a>
            </div>
          </div>
        </div>
      </div>
      <div class="sm:hidden" id="mobile-menu">
        <div class="space-y-1 pt-2 pb-4">
          <a href="/my/books" class="block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-sky-500 hover:border-sky-300 hover:bg-sky-50 hover:text-sky-700">My Books</a>
          <a href="/logout" class="block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-sky-500 hover:border-sky-300 hover:bg-sky-50 hover:text-sky-700">Logout</a>
        </div>
      </div>
    </nav>
        <div class="px-4 sm:px-6 lg:px-8">
          <div class="sm:flex sm:items-center">
            <div class="mt-3 sm:flex-auto">
              <h2 class="text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">Welcome, ${firstName}</h2>
              <p class="mt-1">List of books in the library</p>
            </div>
          </div>
          <div class="-mx-4 mt-3 ring-1 ring-gray-300 sm:mx-0 sm:rounded-lg">
            <table class="min-w-full divide-y divide-gray-300">
              <thead>
                <tr>
                  <!-- <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Serial No.</th> -->
                  <th scope="col" class="hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 lg:table-cell"></th>
                  <th scope="col" class="hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 lg:table-cell">Title</th>
                  <th scope="col" class="hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 lg:table-cell">Author</th>
                  <th scope="col" class="hidden px-3 py-3.5 text-left text-sm font-semibold text-gray-900 lg:table-cell">Book Description</th>
                  <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                    <span class="sr-only">Select</span>
                  </th>
                </tr>
              </thead>
              <tbody>
                  <c:forEach var="book" items="${books}">
                  <tr>
                    <td class="relative py-4 pl-4 pr-3 text-sm sm:pl-6">
                      <!-- <div class="font-medium text-gray-900">${book.id}</div> -->
                      <div class="mt-1 flex flex-col text-gray-500 sm:block lg:hidden">
                        <span>${book.description} / ${book.title}</span>
                        <span class="hidden sm:inline">·</span>
                        <span>${book.author}</span>
                      </div>
                    </td>
                    <td class="hidden px-3 py-3.5 text-sm text-gray-500 lg:table-cell">${book.title}</td>
                    <td class="hidden px-3 py-3.5 text-sm text-gray-500 lg:table-cell">${book.author}</td>
                    <td class="hidden px-3 py-3.5 text-sm text-gray-500 lg:table-cell">${book.description}</td>
                    <td class="relative py-3.5 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                      <a href="/book/${book.id}"><button type="button" class="inline-flex items-center rounded-md bg-cyan-600 px-2.5 py-1.5 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-cyan-500 disabled:cursor-not-allowed disabled:opacity-30 disabled:hover:bg-blue-500">Select</button></a>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
          </div>
        </div>
        </div>
      </div>
  </body>
</html>
