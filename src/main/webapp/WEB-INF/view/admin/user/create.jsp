<!-- filepath: d:\Learn\Web\New folder\Shop-Project\src\main\webapp\WEB-INF\view\Admin\User\Create.jsp -->
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Create New User</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h2 class="mb-4">Create New User</h2>
                            <form:form action="/admin/user/create1" method="post" modelAttribute="newUser">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <form:input path="email" type="email" class="form-control" id="email" name="email"
                                        required="required" />
                                </div>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <form:input path="fullName" type="text" class="form-control" id="fullName"
                                        name="fullName" required="required" />
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <form:input path="password" type="password" class="form-control" id="password"
                                        name="password" required="required" />
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <form:input path="address" type="text" class="form-control" id="address"
                                        name="address" required="required" />
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <form:input path="phone" type="tel" class="form-control" id="phone" name="phone" />
                                </div>
                                <button type="submit" class="btn btn-primary">Create User</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>