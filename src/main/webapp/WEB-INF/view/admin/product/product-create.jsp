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
                                        <h2 class="mb-4">Create New Product</h2>
                                        <form:form action="/admin/product/create" method="post"
                                            modelAttribute="newProduct" enctype="multipart/form-data">
                                            <div class="mb-3">
                                                <c:set var="nameError">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="priceError">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="quantityError">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="DetailDescError">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>


                                                <label for="name" class="form-label">Product Name</label>
                                                <form:input path="name" type="text"
                                                    class="form-control ${not empty nameError ? 'is-invalid' : ' '}"
                                                    id="name" name="name" />
                                                <form:errors path="name" cssClass="text-danger" />
                                                ${nameError}
                                            </div>
                                            <div class="mb-3">
                                                <label for="price" class="form-label">Price</label>
                                                <form:input path="price" type="text"
                                                    class="form-control ${not empty priceError ? 'is-invalid' : ' '}"
                                                    id="price" name="price" />

                                                <form:errors path="price" cssClass="text-danger" />
                                                ${priceError}
                                            </div>
                                            <div class="mb-3">
                                                <label for="detailDesc" class="form-label">Detail
                                                    Description</label>
                                                <form:input path="detailDesc" type="text"
                                                    class="form-control ${not empty DetailDescError ? 'is-invalid' : ' '}"
                                                    id="detailDesc" name="detailDesc" />
                                                <form:errors path="detailDesc" cssClass="text-danger" />
                                                ${DetailDescError}
                                            </div>
                                            <div class="mb-3">
                                                <label for="shortDesc" class="form-label">Short
                                                    Description</label>
                                                <form:input path="shortDesc" type="text"
                                                    class="form-control ${not empty shortDescError ? 'is-invalid' : ' '}"
                                                    id="shortDesc" name="shortDesc" />
                                                <form:errors path="shortDesc" cssClass="text-danger" />
                                                ${shortDescError}
                                            </div>
                                            <div class="mb-3">
                                                <label for="quantity" class="form-label">Quantity</label>
                                                <form:input path="quantity" type="tel"
                                                    class="form-control ${not empty quantityError ? 'is-invalid' : ' '}"
                                                    id="quantity" name="quantity" />
                                                <form:errors path="quantity" cssClass="text-danger" />
                                                ${quantityError}
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Factory</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="MIDIA">MIDIA</form:option>
                                                        <form:option value="SAMSUNG">SAMSUNG</form:option>
                                                        <form:option value="SONY">SONY</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Target</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="GAMING">Gaming</form:option>
                                                        <form:option value="OFFICE">Office</form:option>
                                                        <form:option value="GRAPHICS">Graphics</form:option>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="avatarFile" class="form-label">Image</label>
                                                <input type="file" class="form-control" id="avatarFile" name="tinFile"
                                                    accept=".jpg, .jpeg, .png" />
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