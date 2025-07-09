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
                        <div class="col-md-6">
                            <div class="card shadow">
                                <div class="card-header bg-danger text-white">
                                    <h4 class="mb-0">Confirm Delete</h4>
                                </div>
                                <div class="card-body text-center">
                                    <p class="mb-4">Are you sure you want to delete user
                                        <strong>${user.fullName}</strong> (ID: ${user.id})?
                                    </p>

                                    <form:form action="/admin/user/delete" method="post" modelAttribute="newUser"
                                        class="d-flex justify-content-between">
                                        <div class="mb-3" hidden>
                                            <label class="form-label">ID</label>
                                            <form:input value="${user.id}" path="id" type="hidden"
                                                class="form-control" />
                                        </div>
                                        <button class="btn btn-danger">Delete</button>
                                        <a href="${pageContext.request.contextPath}/admin/user"
                                            class="btn btn-secondary me-2">Cancel</a>
                                    </form:form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>