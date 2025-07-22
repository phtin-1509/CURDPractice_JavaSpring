<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User List</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
                    </div>
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container my-3">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h2 class="mb-4">Create New User</h2>
                                        <form:form action="/admin/user/create" method="post" modelAttribute="newUser"
                                            enctype="multipart/form-data">
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Email</label>
                                                <form:input path="email" type="email" class="form-control is-invalid"
                                                    id="email" name="email" />
                                                <form:errors path="email" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3">
                                                <c:set var="nameError">
                                                    <form:errors path="fullName" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="fullName" class="form-label">Full Name</label>
                                                <form:input path="fullName" type="text"
                                                    class="form-control ${not empty nameError ? 'is-invalid' : ' '}"
                                                    id="fullName" name="fullName" />
                                                <form:errors path="fullName" cssClass="text-danger" />
                                                ${nameError}
                                            </div>
                                            <div class="mb-3">
                                                <c:set var="passwordError">
                                                    <form:errors path="password" cssClass="invalid-feedback" />
                                                </c:set>


                                                <label for="password" class="form-label">Password</label>
                                                <form:input path="password" type="password" id="password"
                                                    name="password"
                                                    class="form-control ${not empty passwordError ? 'is-invalid' : ' '}" />
                                                ${passwordError}

                                            </div>
                                            <div class="mb-3">
                                                <label for="address" class="form-label">Address</label>
                                                <form:input path="address" type="text" class="form-control" id="address"
                                                    name="address" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="phone" class="form-label">Phone</label>
                                                <form:input path="phone" type="tel" class="form-control" id="phone"
                                                    name="phone" />
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <label for="avatarFile" class="form-label">Avatar</label>
                                                    <input type="file" class="form-control" id="avatarFile"
                                                        name="tinFile" accept=".jpg, .jpeg, .png" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Role</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="ADMIN">Admin</form:option>
                                                        <form:option value="USER">User</form:option>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Create User</button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <!-- footer -->
                        <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
                    </div>
                </div>
            </body>

            </html>