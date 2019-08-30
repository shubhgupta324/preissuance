<!DOCTYPE html>
<html>
<head>
<title>Max Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/nice-select.css" rel="stylesheet" />
<link href="css/style_mpro.css" rel="stylesheet" />


</head>
<style>

.redtext {
	color: red;
}

.custom-check-2 {
	opacity: 0;
	position: absolute;
}

.otp-form label.cstm-check-label {
	cursor: pointer;
	font-size: 11px;
	font-weight: normal;
	letter-spacing: 0.5px;
	line-height: 18px;
	margin-top: 5px;
	padding: 2px 16px 0px 36px;
	text-align: justify;
	position: relative;
}

.custom-check-2+.cstm-check-label::before {
	background-position: center center;
	border: 2px solid #a6a6a6;
	border-radius: 4px;
	content: "";
	display: inline-block;
	height: 20px;
	left: 0;
	margin: 6px auto;
	margin-left: 6px;
	padding: 2px;
	position: absolute;
	text-align: center;
	top: 1px;
	transition: all 0.5s ease 0s;
	vertical-align: middle;
	width: 20px;
}

.custom-check-2:checked+.cstm-check-label::before {
	background: #004eb4 url("images/right-tick.png") no-repeat center center;
	border-color: #004eb4;
}
.top-content{
	padding: 15px;
}
#my_camera{
	margin: 0 auto;
}
/*#my_camera {
	width: 320px !important;
	margin: 0 auto;
	height: 258px !important;
	overflow: hidden;
	padding-top: 18px;
}

#my_camera video {
	width: 320px !important;
	height: 258px !important;
}
#my_camera img {
	width: 320px !important;
	height: 258px !important;
	margin-bottom: 5px;
	width: auto;	
}

*/
.otp-content .btn-primary{
	width:110px;
}
#my_camera-ios_div{
	width: 100% !important;
	display: block !important;
}
@media ( max-width : 767px) {
	.otp-content{
		width: 100%;
		max-width: 100%;
		padding-top: 0;
	}
	
}



</style>
<body>


	<header>
		<div class="container-fluid">
			<div class="logo">
				<a href="#"><img src="images/logo.png" alt="MAX_Life" /></a>
			</div>
		</div>
	</header>
	<script>
		var count = 0;
	</script>

	<section class="main-content" >
		<div class="otp-content">
			<div class="top-content"  >

				<div id="my_camera" style="width:240px;height:240px">

					<script type="text/javascript">
						function webCamLoad() {
							Webcam.set({
								//width: 240,
								//height: 500,
								//dest_width: 888,
								//dest_height: 500,
								//crop_width: 500,
								//crop_height: 500,
								//image_format : 'jpeg',
								//jpeg_quality : 90
							});
							Webcam.attach('#my_camera');
						}
						function webCamLoadDesk() {
							Webcam.set({

								//width: 240,
								//height: 500,
								//dest_width: 888,
								//dest_height: 500,
								//crop_width: 500,
								//crop_height: 500,
								//image_format : 'jpeg',
								//jpeg_quality : 90
							});
							Webcam.attach('#my_camera');
						}
						var isMobile = /iPhone|iPad|iPod|Android/i
								.test(navigator.userAgent);
						if (isMobile) {
							window.onload = webCamLoad;
						} else {
							window.onload = webCamLoadDesk;
						}
					</script>

				</div>
				<h3 class="textCamera">Position your face inside the frame and click on Take Selfie button</h3>
				<input type=button id="save_image"  class="btn btn-primary" value="Take Selfie"
					onClick="take_snapshot()"> 
						<form class="otp-form" action="mprobuyer" method="post">
				<div class="form-group"></div>
				<div class="">
					<div class="sbtm-btn">
						<button class="btn btn-primary" id="submitbutton" disabled="true">Submit</button> 
						<!-- <button class="btn btn-primary" id="submitbutton">Submit</button>  -->
					</div>
				</div>

				<input type="hidden" name="txnId" value="${TxnId}"> <input
					type="hidden" id="selfiImage" name="selfiImage" value=""> <input
					type="hidden" id="isSelfieCaptured" name="isSelfieCaptured"
					value="true">
					<input
					type="hidden" id="linkViewed" name="linkViewed"
					value="true">
					
			</form>
				<input type="hidden"  id="image_fixed" value="false">	
					<!--<input type=button
					class="btn btn-primary" id="take_selfie" value="Take Selfie"
					onClick="configureWebcam()"> -->
				<script language="JavaScript">
				<!-- Configure a few settings and attach camera  -->
					function configure() {
						Webcam.set({
							 //width: 240,
							//height: 500,
							//dest_width: 888,
							//dest_height: 500,
							//crop_width: 500,
							//crop_height: 500,
							//image_format : 'jpeg',
							//jpeg_quality : 90
						});
						Webcam.attach('#my_camera');
					}

					function configureDesk() {
						Webcam.set({

							 //width: 240,
							//height: 500,
							//dest_width: 888,
							//dest_height: 500,
							//crop_width: 500,
							//crop_height: 500,
							//image_format : 'jpeg',
							//jpeg_quality : 90
						});
						Webcam.attach('#my_camera');
					}

					function configureWebcam() {
						var isMobile = /iPhone|iPad|iPod|Android/i
								.test(navigator.userAgent);
						if (isMobile == 'true') {
							console.log("mobile version is called");
							configure();
						} else {
							console.log("Desktop version has been called");
							configureDesk();
						}
						$('#submitbutton').attr("disabled", true);
					}

					var shutter = new Audio();
					shutter.autoplay = false;
					shutter.src = navigator.userAgent.match(/Firefox/) ? 'shutter.ogg'
							: 'shutter.mp3';
					function take_snapshot() {
                       		

					var image_fixed=$('#image_fixed').val();
                       	if(image_fixed=='false'){
								Webcam
								.snap(function(data_uri, event) {
								document.getElementById("selfiImage").value = data_uri;
						         
								var isMobileDevice = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;	
								var selfie_image;   
								if (isMobileDevice) 
						           {
									selfie_image  = '<img   src="'+data_uri+'"  width="100%" height="100%" >';   
						           }
						           else
						           {
						        	 selfie_image = '<img   src="'+data_uri+'"  width="75%" height="100%" >';
						           }
								
								$('#my_camera').html(selfie_image);
								
								$('#submitbutton').removeAttr("disabled");
									$('#image_fixed').val("true");
                                   $('#save_image').val("Open Camera");
									//Take Selfie , Open Camera   save_image
								});
						}
						else
						{
							configureWebcam();
							$('#image_fixed').val("false");
							$('#save_image').val("Take Selfie");
						}
					}
				</script>

			</div>

		
				
		
		</div>
		
	</section>

	<footer>
		<div class="container-fluid">
			<img src="images/bottom-footer.jpg" alt="Max-life" />
		</div>
	</footer>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>
	
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/webcam.min.js"></script>
</body>
</html>