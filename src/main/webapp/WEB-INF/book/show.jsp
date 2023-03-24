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
    <script type="text/javascript" src="/js/app.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
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
                >Home
              </a>
              <a
                href="/my/books"
                class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700"
                >My Books
              </a>
              <a
                href="/book/new"
                class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700"
                >New Books
              </a>
              <a
                href="/logout"
                class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-sky-500 hover:border-sky-300 hover:text-sky-700"
                >Logout
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="sm:hidden" id="mobile-menu">
        <div class="space-y-1 pt-2 pb-4">
          <a
            href="/my/books"
            class="block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-sky-500 hover:border-sky-300 hover:bg-sky-50 hover:text-sky-700"
            >My Books
          </a>
          <a
            href="/issue"
            class="block border-l-4 border-indigo-500 bg-indigo-50 py-2 pl-3 pr-4 text-base font-medium text-indigo-700"
            >Issue Book
          </a>
          <a
            href="/logout"
            class="block border-l-4 border-transparent py-2 pl-3 pr-4 text-base font-medium text-sky-500 hover:border-sky-300 hover:bg-sky-50 hover:text-sky-700"
            >Logout
          </a>
        </div>
      </div>
    </nav>
    <h1
      class="mt-5 text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight flex justify-center flex justify-center"
    >
      ${book.title}
    </h1>
    <div class="overflow-hidden bg-white shadow sm:rounded-lg">
      <div class="border-t border-gray-200 mt-2">
        <dl>
          <!-- <div
            class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6"
          >
            <dt class="text-sm font-medium text-gray-500">Title</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
              ${book.title}
            </dd>
          </div> -->
          <div
            class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6"
          >
            <dt class="text-sm font-medium text-gray-500">Author</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
              ${book.author}
            </dd>
          </div>
          <div
            class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6"
          >
            <dt class="text-sm font-medium text-gray-500">Description</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
              ${book.description}
            </dd>
          </div>
          <div
            class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6"
          >
            <dt class="text-sm font-medium text-gray-500">Genre</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
              ${book.genre}
            </dd>
          </div>
          <div
            class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6"
          >
            <dt class="text-sm font-medium text-gray-500">My Thoughts</dt>
            <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0">
              ${book.thoughts}
            </dd>
          </div>
          <c:if test="${book.user.id == userId}">
            <div class="bg-white px-4 py-5 sm:grid-cols-3 sm:gap-4 sm:px-6">
              <a href="/book/${book.id}/edit"
                ><button
                  type="button"
                  class="rounded-md bg-blue-700 py-1.5 px-2.5 text-md font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-700"
                >
                  Edit
                </button>
              </a>
            </div>
          </c:if>
        </dl>
      </div>
    </div>
  </body>
</html>
