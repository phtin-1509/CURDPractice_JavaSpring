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
                            <div class="container mt-5">
                                <div class="row justify-content-center">
                                    <div class="col-md-7 col-lg-6">
                                        <div class="card shadow">
                                            <div class="card-header bg-primary text-white">
                                                <h3 class="mb-0">Update Product</h3>
                                            </div>
                                            <div class="card-body">
                                                <form:form action="/admin/product/update/${id}" method="post"
                                                    modelAttribute="product" enctype="multipart/form-data">
                                                    <div class="mb-3">
                                                        <label for="id" class="form-label">ID</label>
                                                        <form:input path="id" type="text" class="form-control" id="id"
                                                            name="id" disabled="true" />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="name" class="form-label">Name</label>
                                                        <form:input path="name" type="text" class="form-control"
                                                            id="name" name="name" required="required" />
                                                    </div>

                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <label for="price" class="form-label">Price</label>
                                                            <form:input path="price" type="number" class="form-control"
                                                                id="price" name="price" required="required" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="quantity" class="form-label">Quantity</label>
                                                            <form:input path="quantity" type="number"
                                                                class="form-control" id="quantity" name="quantity"
                                                                required="required" />
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="detailDesc" class="form-label">Detail
                                                            Description</label>
                                                        <form:input path="detailDesc" type="text" class="form-control"
                                                            id="detailDesc" name="detailDesc" required="required" />
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="shortDesc" class="form-label">Short
                                                            Description</label>
                                                        <form:input path="shortDesc" type="text" class="form-control"
                                                            id="shortDesc" name="shortDesc" required="required" />
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <label for="factory" class="form-label">Factory</label>
                                                            <form:select class="form-select" path="factory">
                                                                <form:option value="MIDIA">MIDIA</form:option>
                                                                <form:option value="SAMSUNG">SAMSUNG</form:option>
                                                                <form:option value="SONY">SONY</form:option>
                                                            </form:select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="target" class="form-label">Target</label>
                                                            <form:select class="form-select" path="target">
                                                                <form:option value="GAMING">Gaming</form:option>
                                                                <form:option value="OFFICE">Office</form:option>
                                                                <form:option value="HOME">Home</form:option>
                                                            </form:select>
                                                        </div>
                                                    </div>


                                                    <div class="mb-3">
                                                        <label for="imageFile" class="form-label">Image</label>
                                                        <input type="file" class="form-control" id="imageFile"
                                                            name="updateImage" accept=".jpg, .jpeg, .png" />
                                                    </div>
                                                    <div class="mb-3">
                                                        <img id="previewImage"
                                                            src="/images/product/product/${product.imageUrl}"
                                                            alt="${product.name}" style="max-height: 230px;" />
                                                        <br>
                                                    </div>

                                                    <!-- <div class="mb-3 col-12 col-md-6">
                                                        <label for="avatarFile" class="form-label">Image</label>
                                                        <input type="file" class="form-control" id="avatarFile"
                                                            name="updateImage" accept=".jpg, .jpeg, .png" />
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <img id="avatarPreview" alt="${product.name}"
                                                            style="max-height: 200px;display: none;" />
                                                    </div> -->


                                                    <div class="d-flex justify-content-between">
                                                        <a href="${pageContext.request.contextPath}/admin/product"
                                                            class="btn btn-secondary">Cancel</a>
                                                        <button type="submit" class="btn btn-primary text-white">Update
                                                            Product</button>
                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <!-- footer -->
                        <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
                    </div>
                </div>
            </body>
            <script>
                $(document).ready(() => {
                    const $avatarFile = $('#avatarFile');
                    const orgImage = "${newProduct.image}";

                    if (orgImage) {
                        const urlImage = "/images/product/" + orgImage;
                        $("#avatarPreview")
                            .attr("src", urlImage)
                            .css({ "display": "block" });
                    }

                    avatarFile.change(function (e) {


                        const imgURL = URL.createObjectURL(e.target.files[0]);
                        $('#avatarPreview')
                            .attr('src', imgURL)
                            .css({ 'display': 'block' });
                    });
                });

            </script>

            </html>