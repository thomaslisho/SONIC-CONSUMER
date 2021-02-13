<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="container">
				<h1 align="center">Student List</h1>
				<button type="button" class="btn btn-success btn-lg float-right"
					data-toggle="modal" data-target="#exampleModalCenter">Add
					Student</button>
			</div>
		</div>
		<br />
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Name</th>
						<th scope="col">Department</th>
						<th scope="col">Roll Number</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
						<tr>
							<th scope="row"><c:out value="${item.id}"></c:out></th>
							<td><c:out value="${item.name}"></c:out></td>
							<td><c:out value="${item.dept}"></c:out></td>
							<td><c:out value="${item.rollNo}"></c:out></td>
							<td>
								<div class="container">
									<a class="btn btn-primary" href="/update?id=${item.id}"
										role="button"> <svg xmlns="http://www.w3.org/2000/svg"
											width="16" height="16" fill="currentColor"
											class="bi bi-pencil-square" viewBox="0 0 16 16">
  											<path
												d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  											<path fill-rule="evenodd"
												d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
										</svg>
									</a> 
									<a class="btn btn-danger" href="/delete/${item.id}"
										role="button"> <svg xmlns="http://www.w3.org/2000/svg"
											width="16" height="16" fill="currentColor"
											class="bi bi-trash-fill" viewBox="0 0 16 16">
  										<path
												d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
										</svg>
									</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLongTitle">Add Student</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="add" method="post">
						<div class="form-group">
							<label for="name">Name</label> <input type="text"
								class="form-control" name="name" placeholder="Add Name">
						</div>
						<div class="form-group">
							<label for="dept">Department</label> <input type="text"
								class="form-control" name="dept" placeholder="Department">
						</div>
						<div class="form-group">
							<label for="rollNo">Roll Number</label> <input type="number"
								class="form-control" name="rollNo" placeholder="Roll Number">
						</div>
						<button type="submit" class="btn btn-success">Add the new
							Guy</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>