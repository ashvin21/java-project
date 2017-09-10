<%
if(session.getAttribute("email") != null){
    
        %>
<%@page import="demo.MyJavaBean"%>
<!DOCTYPE html>
<html>
<head>
<title>Barcode Generator</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
</head>
	
<body>
<!-- header -->

	<div class="logo_products">
		<div class="container">
		<div class="w3ls_logo_products_left1">
				<ul class="phone_email">
					<li><i class="fa fa-phone" aria-hidden="true"></i>call us : +91 7501731397</li>
					
				</ul>
			</div>
			<div class="w3ls_logo_products_left">
				<h1><a href="#">Barcode Generator</a></h1>
			</div>
               <div class="w3l_search">
			
                    <jsp:useBean id="mybean" class="demo.MyJavaBean" scope="session"/>
                    <jsp:setProperty property="*" name="mybean"/>			
                    <%
                        mybean = (demo.MyJavaBean) session.getAttribute("mybean");
                    %>
                    <b><%out.println("Welcome, "+mybean.getName());%><b>
		</div>
			
                    
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->
<!-- navigation -->
	<div class="navigation-agileits">
		<div class="container">
			<nav class="navbar navbar-default">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header nav_2">
								<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							</div> 
							<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
								<ul class="nav navbar-nav">
								<li><a href="items.jsp" class="act">Home</a></li>	
									<!-- Mega Menu -->
									
									
						
									<li><a href="nproduct.jsp">Register New product</a></li>
                                      <li class="active"><a href="rproduct.jsp"> Registered Product </a></li>
									<li><a href="sbarcode.jsp">See Barcode</a></li>
                                    <li><a href="logout.jsp">Logout</a></li>
								</ul>
							</div>
							</nav>
			</div>
		</div>
		
<!-- //navigation -->
<!-- breadcrumbs -->
	
<!-- //breadcrumbs -->
<!-- register -->
	<div class="register">
		<div class="container">
        
		<jsp:setProperty property="*" name="mybean"/>
                <% 
                    mybean = (demo.MyJavaBean)session.getAttribute("mybean");
                    %>
			<h2>Register Here</h2>
			<div class="login-form-grids">
				<h5>Register your Product</h5>
				<form action="barcodeservlet" method="post">
                <input type="text" disabled name = "cname" value="<%=mybean.getName()%>" ><br/>
		<input type="text"  disabled value="<%=mybean.getLicense()%>" ><br/>
                    <input type="text"   disabled value="<%=mybean.getBatch()%>"><br/>
                    <input type="text" placeholder="Product Name" name="product" required><br/>
                    <input type="text" placeholder="Product Id" name="productid" required><br/>
                      <input type="text" placeholder="Product price" name="price" required><br/>
                      <input type="date" placeholder="Mfg.date 17/12/2019" name="mdate" required><br/>
                      <input type="date" placeholder="Exp.date 19/12/2019" name="edate" required><br/>
                    
                   <input type="submit" value="Generate Barcode">
				</form>
				
			</div>
			
		</div>
	</div>
<!-- //register -->
<!-- //footer -->
<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>Contact</h3>
					
					<ul class="address">
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>HIT, Haldia <span>West Bengal</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="barcodegen@barcode.com">barcodegen@barcode.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+917501731397</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Information</h3>
					<ul class="info"> 
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="index.jsp">About Us</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="contact.jsp">Contact Us</a></li>
					
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="faq.jsp">FAQ's</a></li>
						
					</ul>
				</div>
			
				
				<div class="clearfix"> </div>
			</div>
		</div>
		
		<div class="footer-copy">
			
			<div class="container">
				<p>© 2017 Barcode Generator. All rights reserved | Design by <a href="contact.jsp">Barcode</a></p>
			</div>
		</div>
		
	</div>	
	<div class="footer-botm">
			<div class="container">
				<div class="w3layouts-foot">
					<ul>
						<li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="payment-w3ls">	
					<img src="images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //footer -->	
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- top-header and slider -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/minicart.min.js"></script>
<script>
	// Mini Cart
	paypal.minicart.render({
		action: '#'
	});

	if (~window.location.search.indexOf('reset=true')) {
		paypal.minicart.reset();
	}
</script>
<!-- main slider-banner -->
<script src="js/skdslider.min.js"></script>
<link href="css/skdslider.css" rel="stylesheet">
<script type="text/javascript">
		jQuery(document).ready(function(){
			jQuery('#demo1').skdslider({'delay':5000, 'animationSpeed': 2000,'showNextPrev':true,'showPlayButton':true,'autoSlide':true,'animationType':'fading'});
						
			jQuery('#responsive').change(function(){
			  $('#responsive_wrapper').width(jQuery(this).val());
			});
			
		});
</script>	
<!-- //main slider-banner --> 
</body>
</html>
 <%
}
else{
    %>
    <jsp:forward page="index.jsp"/>
<%
}
%>
