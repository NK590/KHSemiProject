<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <title>����-�ʾ�</title>
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
    <header>
        <div class="row justify-content">
            <div class="col-4">
                <img src="images/project_logo.PNG" class="d-block w-100" id="main-logo">
            </div>
            <div class="col" id="nav-item">
                <nav class="nav">
                    <a class="nav-link" href="/product.pro">��ǰ ����</a>
<<<<<<< HEAD
                    <a class="nav-link" href="#">����</a>
=======
                    <a class="nav-link" href="/review.bo?currentPage=1">����</a>
>>>>>>> 1ddeba4c379d3d0ae61170930344163fc52988b8
                    <a class="nav-link" href="/inquiry.iq?currentPage=1">������</a>
                    <a class="nav-link" href="#">�α���</a>
                    <a class="nav-link" href="#">ȸ������</a>
                    <a class="nav-link" style="color: rgb(255, 94, 0);" href="/petInput.pet">�����ϱ�</a>
                </nav>
            </div>
        </div>
    </header>
	
    <!--ĳ������ �������� �� �̺�Ʈ �ȳ�-->
    <div class="row justify-content-center">
        <div class="col-4">
            <div id="banner-caption" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#banner-caption" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#banner-caption" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#banner-caption" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/banner-1.JPG">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="notice-txt">
                                <h1><strong style="background-color: #ffdcbcd7;">����ϴ� ���� ���� ģ���� ���� ����</strong></h1>
                                <h4>6��, �ٿ�Ϳ� �¹¿� �Բ��� �ı⸦ ����ּ��� ��ǰ�� ��ٸ��� �ֽ��ϴ�</h4>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/banner-1.JPG">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="notice-txt">
                                <h1><strong style="background-color: #ffdcbcd7;">����ϴ� ���� ���� ģ���� ���� ����</strong></h1>
                                <h4>6��, �ٿ�Ϳ� �¹¿� �Բ��� �ı⸦ ����ּ��� ��ǰ�� ��ٸ��� �ֽ��ϴ�</h4>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/banner-1.JPG">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="notice-txt">
                                <h1><strong style="background-color: #ffdcbcd7;">����ϴ� ���� ���� ģ���� ���� ����</strong></h1>
                                <h4>6��, �ٿ�Ϳ� �¹¿� �Բ��� �ı⸦ ����ּ��� ��ǰ�� ��ٸ��� �ֽ��ϴ�</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#banner-caption"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#banner-caption"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <!--���ο���-->
    <!--���м�-->
    <hr class="divider" style="width: 1200px; margin-left: 123px;">
    <div class="container">
        <!--��ǰ �̹��� �����Դϴ� �ش� �̹����� Ŭ�� �� ��ǰ �������� �̵�-->
        <div class="row justify-content-around">
            <div class="col" id="product-imgs" style="margin-left: 100px;">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
            <div class="col order-5">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
            <div class="col order-1">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-around">
            <div class="col" id="product-imgs" style="margin-left: 100px;">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
            <div class="col order-5">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
            <div class="col order-1">
                <br>
                <a href="#"><img src="images/project_product.PNG" class="d-block w-100"></a>
            </div>
        </div>
    </div>
    <br>
    <br>
    <hr class="divider" style="width: 1200px; margin-left: 123px;">
    <!--���� �� ��ǰ �̹��� ���� �̹��� ���м�-->
    <div class="row justify-content-around">
        <!--���� ���� ���� Ŭ�� �� �ش� ���� �Խù��� �̵�-->
        <div class="col-4">
            <br>
            <br>
            <a href="#"><img src="images/project_review.PNG" class="d-block w-100"></a>
        </div>
        <div class="col-4">
            <br>
            <br>
            <a href="#"><img src="images/project_review.PNG" class="d-block w-100"></a>
        </div>
        <div class="row justify-content-around">
            <div class="col-4">
                <br>
                <br>
                <a href="#"><img src="images/project_review.PNG" class="d-block w-100"></a>
            </div>
            <div class="col-4">
                <br>
                <br>
                <a href="#"><img src="images/project_review.PNG" class="d-block w-100"></a>
            </div>
            <div class="footer">
                <ul class="ft-ul">
                    <li>BoriBob Inc. ����� ��鱸 �ູ��</li>
                    <li>��ǥ : ������������ ����ڵ�Ϲ�ȣ : 780-86-01094</li>
                    <li>��ǥ��ȣ : +82)-665-3430 �ѽ���ȣ : +82)-888-3430 Ȩ������ : petvenience.store.com</li>
                    <li>Copyright��BoriBob Inc. All Rights Reserved.</li>
                    <div class="facebookicon">
                        <img src="images/facebook_icon.png" style="border-color: lightblue;">
                    </div>
                    <div class="instagramicon">
                        <img src="images/instagram_icon.png" style="border-color: lightblue;">
                    </div>
                    <div class="youtubeicon">
                        <img src="images/youtube_icon.png" style="border-color: lightblue;">
                    </div>
                    <div class="ft-ul2">
                        <li><strong>������</strong></li>
                        <li style="height: 8px;"></li>
                        <li>���� 10�ú��� ���� 6�ñ���</li>
                        <li>�����, �Ͽ���, ������ �޹�</li>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>