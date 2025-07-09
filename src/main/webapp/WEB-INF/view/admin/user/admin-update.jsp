<!-- filepath: d:\Learn\Web\New folder\Shop-Project\src\main\webapp\WEB-INF\view\Admin\User\Create.jsp -->
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Update User</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-7 col-lg-6">
                            <div class="card shadow">
                                <div class="card-header bg-warning text-white">
                                    <h3 class="mb-0">Update User</h3>
                                </div>
                                <div class="card-body">
                                    <form:form action="/admin/user/update/${user.id}" method="post"
                                        modelAttribute="user">
                                        <div class="mb-3">
                                            <label for="id" class="form-label">ID</label>
                                            <form:input path="id" type="text" class="form-control" id="id" name="id"
                                                disabled="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email</label>
                                            <form:input path="email" type="email" class="form-control" id="email"
                                                name="email" disabled="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="fullName" class="form-label">Full Name</label>
                                            <form:input path="fullName" type="text" class="form-control" id="fullName"
                                                name="fullName" required="required" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="address" class="form-label">Address</label>
                                            <form:input path="address" type="text" class="form-control" id="address"
                                                name="address" required="required" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="form-label">Phone</label>
                                            <form:input path="phone" type="tel" class="form-control" id="phone"
                                                name="phone" />
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <a href="${pageContext.request.contextPath}/admin/user"
                                                class="btn btn-secondary">Cancel</a>
                                            <button type="submit" class="btn btn-warning text-white">Update
                                                User</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>