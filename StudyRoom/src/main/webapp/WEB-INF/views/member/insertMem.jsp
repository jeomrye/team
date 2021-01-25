<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<style>
body{
  background-color:#F7F8E0;
  font-family:sans-serif;
}
h3{
  color:black;
  font-family:sans-serif;
  margin-bottom:40px;
}
#button-one{
  display:block;
  margin:0px auto;
  margin-bottom:50px;
  
  width:500px;
  height: 100px;
  
  position:relative;
  background-color:#FF8000;
  padding:1.4rem 1.8rem;
  border:none;
  font-size:2rem;
  font-weight:bold;
  letter-spacing:3px;
  color:#eee;
  cursor:pointer;
}
#button-two{
  display:block;
  margin:0px auto;
  margin-bottom:50px;
  
  width:500px;
  height: 100px;
  
  position:relative;
  background-color:#0B614B;
  padding:1.4rem 1.8rem;
  border:none;
  font-size:2rem;
  font-weight:bold;
  letter-spacing:3px;
  color:#eee;
  cursor:pointer;
}
.btn-wrapper{
  text-align:center;
  padding-top:5%;
}

@-webkit-keyframes top-frames{
  0%{
    top:0px;
    border-color:#eee;
    border-width:5px;
    opacity:1;
  }
  100%{
    top:1rem;
    opacity:0;
    border-width:1px;
  }
}
@-moz-keyframes top-frames{
  0%{
    top:0px;
    border-color:#eee;
    border-width:5px;
    opacity:1;
  }
  100%{
    top:1rem;
    opacity:0;
    border-width:1px;
  }
}
@keyframes top-frames{
  0%{
    top:0px;
    border-color:#eee;
    border-width:5px;
    opacity:1;
  }
  100%{
    top:1rem;
    opacity:0;
    border-width:1px;
  }
}
@-webkit-keyframes bottom-frames{
  0%{
    bottom:0px;
    border-color:#eee;
    border-width:5px;
    opacity:1;
  }
  100%{
    bottom:1rem;
    border-width:1px;
    opacity:0;
  }
}
@-moz-keyframes bottom-frames{
  0%{
    bottom:0px;
    border-color:#eee;
    border-width:5px;
    opacity:1;
  }
  100%{
    bottom:1rem;
    border-width:1px;
    opacity:0;
  }
}
@keyframes bottom-frames{
  0%{
    bottom:0px;
    border-color:#eee;
    border-width:5px;
    opacity:1;
  }
  100%{
    bottom:1rem;
    border-width:1px;
    opacity:0;
  }
}
#button-one:hover{
  -webkit-animation:button-two .5s;
  -moz-animation:button-two .5s;
  animation:button-two .5s;
}
#button-two:hover{
  -webkit-animation:button-two .5s;
  -moz-animation:button-two .5s;
  animation:button-two .5s;
}
@-webkit-keyframes button-one{
  50%{
    letter-spacing:6px;
  }
  100%{
    letter-spacing:3px;
  }
}
@-webkit-keyframes button-two{
  50%{
    letter-spacing:6px;
  }
  100%{
    letter-spacing:3px;
  }
}
@-moz-keyframes button-one{
  50%{
    letter-spacing:6px;
  }
  100%{
    letter-spacing:3px;
  }
}
@-moz-keyframes button-two{
  50%{
    letter-spacing:6px;
  }
  100%{
    letter-spacing:3px;
  }
}
@keyframes button-one{
  50%{
    letter-spacing:6px;
  }
  100%{
    letter-spacing:3px;
  }
}
@keyframes button-two{
  50%{
    letter-spacing:6px;
  }
  100%{
    letter-spacing:3px;
  }
}
</style>

<div class="btn-wrapper">
  <h3>회원가입</h3><br/>
  <button id="button-one" onclick="movemember();">일반 사용자</button>
  <button id="button-two" onclick="movecom();">기업 사용자</button>
</div>




<script type="text/javaScript">
function movemember(){
     location.href = "/member/joinForm1";
}
function movecom(){
     location.href = "/member/joinForm2";
}
</script>













    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

</body>
</html>