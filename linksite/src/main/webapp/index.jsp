<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("ctx",request.getContextPath());
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>LinkSite Index</title>
<link rel="icon" type="image/png" href="images/favicon.png" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="css/ie-fix.css" />
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css" >
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" >
<link rel="stylesheet" type="text/css" href="${ctx}/css/superfish.css" >
<link rel="stylesheet" type="text/css" href="${ctx}/css/colorbox.css" />


<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/superfish.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.eislideshow.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.tweet.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="${ctx}/js/jflickrfeed.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.carouFredSel-5.5.0-packed.js"></script>
<script type="text/javascript" src="${ctx}/js/scrolltopcontrol.js"></script>

<script type="text/javascript" src="${ctx}/js/custom.js"></script>

<script type="text/javascript">
jQuery.noConflict()(function($){
	$('#ei-slider').eislideshow({
						animation			: 'center',
						autoplay			: true,
						slideshow_interval	: 3000,
						titlesFactor		: 0
	                });
	});
</script>
</head>

<body>




<!-- START LOGO SECTION -->
<div id="logo-bar">
	<div class="center-block clearfix">
		<div class="logo"><img src="images/logo.png" alt="Logo" /></div>
		<div class="ads"><a href="http://www.cssmoban.com/?books/freelance-confidential"><img src="images/468x60.png" title="Advertisement" alt="Ads" /></a></div>
	</div><!-- .center-block -->
</div><!-- #logo-bar -->
<!-- END LOGO SECTION -->

<!-- START MENU SECTION -->
<div id="top-line"></div>
<div id="menu-bar">
	<div class="center-block clearfix">
    	<!-- start menu -->
		<div id="menu" class="fix-fish-menu">
			<div class="white-fix-left"></div>
			<ul id="nav" class="sf-menu">
				<li><a href="index-2.html">Home</a></li>
			 		<li class=""> <a href="#">Features</a>
					<ul>
						<li><a href="index-camera.html">Camera Slider</a></li>
						<li><a href="index-elastic.html">Elastic Slider</a></li>
						<li><a href="index-slidorion.html">Slidorion Slider</a></li>
						<li><a href="index-accordion.html">Accordion Slider</a></li>
						<li><a href="index-static-image.html">Static Image</a></li>
						<li><a href="index-video.html">Video Style</a></li>
					</ul>
			    </li>
		 		<li class=""> <a href="#">Typography</a>
					<ul>
						<li><a href="typography-headings.html">Headings</a></li>
						<li><a href="typography-dropcaps.html">Drop Caps</a></li>
							<li><a href="typography-highlights.html">Highlights</a></li>
							<li><a href="typography-layouts.html">Layouts</a></li>
							<li><a href="typography-lists.html">Lists Style</a></li>
							<li><a href="typography-images.html">Float Images</a></li>
							<li><a href="typography-buttons.html">Buttons</a></li>
							<li><a href="typography-tabs-tables.html">Tabs, Tables, Quotes</a></li>
						</ul>
				    </li>
			 	<li class=""> <a href="#" class="active">Pages</a>
					<ul>
						<li><a href="left-content.html">Left + Content</a></li>
						<li><a href="content-right.html">Content + Right</a></li>
						<li><a href="full-width.html">Full Width Page</a></li>
					</ul>
				</li>
		 		<li class=""> <a href="#">Portfolio</a>
					<ul>
						<li><a href="portfolio-1.html">Sortable + 4 Columns</a></li>
						<li><a href="portfolio-4.html">Sortable + 3 Columns</a></li>
						<li><a href="portfolio-2.html">Standard + 4 Columns</a></li>
						<li><a href="portfolio-3.html">Standard + 3 Columns</a></li>
						<li><a href="gallery.html">Gallery</a></li>
						<li><a href="#">Project Item 1</a></li>
						<li><a href="#">Project Item 2</a></li>
					</ul>
			    </li>
                <li class=""><a href="#">Blog</a>
	   				<ul>
						<li><a href="blog-style1.html">Blog Style 1</a></li>
						<li><a href="blog-style2.html">Blog Style 2</a></li>
						<li><a href="blog-post.html">Blog Post</a></li>
					</ul>
	            </li>
 				<li><a href="contacts.html">Contact Us</a></li>
		 		<li><a href="login.jsp">Login</a></li>
		 	</ul>  <!-- end #nav  -->
	 	</div>	<!-- end #menu  -->	
	</div><!-- end .center-block  -->	
</div><!-- end #menu-bar -->
<!-- END MENU SECTION -->



<div id="wrapper">

<!-- START SLIDER -->
		<div id="ei-slider" class="ei-slider"  >
			<ul class="ei-slider-large">

				<!-- start slide #1 -->
				<li>
					<img src="images/sliders/ei-slider/slide01.jpg" alt="image06"/>
					<div class="ei-title">
						<!-- <h2>Clean</h2>
						<h3>Rockable</h3> -->
					</div>
				</li>

				<!-- start slide #2 -->
				<li>
	               	<img src="images/sliders/ei-slider/slide02.jpg" alt="image01" />
	                <div class="ei-title">
						<!-- <h2>Revolutionary</h2>
						<h3>Che Guevara</h3> -->
					</div>
				</li>

				<!-- start slide #3 -->
				<li>
					<img src="images/sliders/ei-slider/slide03.jpg" alt="image02" />
					<div class="ei-title">
						<!-- <h2>Fashion</h2>
						<h3>Audrey</h3> -->
					</div>
				</li>

				<!-- start slide #4 -->
				<li>
					<img src="images/sliders/ei-slider/slide04.jpg" alt="image03"/>
					<div class="ei-title">
						<!-- <h2>True Grit</h2>
						<h3>Rooster Cogburn</h3> -->
					</div>
				</li>

				<!-- start slide #5 -->
				<li>
					<img src="images/sliders/ei-slider/slide05.jpg" alt="image04"/>
					<div class="ei-title">
                    	<h2>Decoding</h2>
	                    <h3>HTML5</h3>
					</div>
				</li>

				<!-- start slide #6 -->
				<li>
					<img src="images/sliders/ei-slider/slide06.jpg" alt="image05"/>
					<div class="ei-title">
						<h2 class="firebrick">Get Fans</h2>
						<h3>Get Results!</h3>
					</div>
				</li>

				<!-- start slide #7 -->
				<li>
					<img src="images/sliders/ei-slider/slide07.jpg" alt="image07"/>
					<div class="ei-title">
						<!-- <h2>Rex</h2>
						<h3>Star Trek</h3> -->
					</div>
				</li>
			</ul><!-- ei-slider-large -->
			
			<ul class="ei-slider-thumbs" >
				<li class="ei-slider-element">Current</li>
				<li><a href="#">Slide 1</a><img src="images/sliders/ei-slider/thumb/slide01.jpg" alt="thumb01" /></li>
				<li><a href="#">Slide 2</a><img src="images/sliders/ei-slider/thumb/slide02.jpg" alt="thumb02" /></li>
				<li><a href="#">Slide 3</a><img src="images/sliders/ei-slider/thumb/slide03.jpg" alt="thumb03" /></li>
				<li><a href="#">Slide 4</a><img src="images/sliders/ei-slider/thumb/slide04.jpg" alt="thumb04" /></li>
				<li><a href="#">Slide 5</a><img src="images/sliders/ei-slider/thumb/slide05.jpg" alt="thumb05" /></li>
				<li><a href="#">Slide 6</a><img src="images/sliders/ei-slider/thumb/slide06.jpg" alt="thumb06" /></li>
				<li><a href="#">Slide 7</a><img src="images/sliders/ei-slider/thumb/slide07.jpg" alt="thumb07" /></li>
			</ul><!-- end ei-slider-thumbs -->
		</div><!-- end ei-slider -->
		<div class="clear"></div>
<!-- END SLIDER -->


	<!-- START CONTENT -->
	<div class="center-block">
		<div class="left-content">

			<!-- POST #1 -->
			<div class="post-block-style1 post-bg">
				<div class="post-bg-white">
					<div class="post-meta clearfix">
						<div class="meta-arrow-up"></div>
						<div class="date">
							<h4>23</h4>
							<h6>Mar</h6>
						</div>
						<h4><a href="blog-post.html" class="title">Getting Good with Git Hong Kong riled by latest tiny 'space capsule' homes</a></h4>
					</div><!-- .post-meta -->	
					
					<div class="thumb">
						<img src="images/blog/1/img01.jpg" alt="" />
						<div class="thumb-arrow-up"></div>
					</div><!-- .thumb -->
										
						<span class="meta-info author">Author: ZERGE</span>
						<span class="meta-info comments">Comments: <a href="#">25</a></span>
						<span class="meta-info category">Category: <a href="#">Development</a></span>									
				</div><!-- .post-bg-white -->
			</div><!-- .post-block-style1 -->
			<!-- END POST #1 -->

			<!-- POST #2 -->
			<div class="post-block-style1 post-bg">
				<div class="post-bg-white">
					<div class="post-meta clearfix">
						<div class="meta-arrow-up"></div>
						<div class="date">
							<h4>20</h4>
							<h6>Mar</h6>
						</div>
						<h4><a href="blog-post.html" class="title">Theme Tumblr Like a Pro</a></h4>
					</div><!-- .post-meta -->
					
					<div class="thumb">
						<a href="www.baidu.com"><img src="images/blog/1/img02.jpg" alt="" /></a>
					</div><!-- .thumb -->
						<span class="meta-info author">Author: ﻿Jeffrey Way</span>
						<span class="meta-info comments">Comments: <a href="#">14</a></span>
						<span class="meta-info category">Category: <a href="#">Development</a>, <a href="#">Design</a></span>					
				</div><!-- .post-bg-white -->
			</div><!-- .post-block-style1 -->
			<!-- END POST #2 -->


			<!-- POST #5 -->
			<div class="post-block-style1 post-bg">
				<div class="post-bg-white">
					<div class="no-thumb">
					</div><!-- .no-thumb -->
					<div class="post-meta clearfix">
						<div class="meta-arrow-up"></div>
						<div class="date">
							<h4>08</h4>
							<h6>Apr</h6>
						</div>
						<h4><a href="blog-post.html" class="title">Corporate Motivation Audio Theme</a></h4>
						<span class="meta-info author">Author: romosel</span>
						<span class="meta-info comments">Comments: <a href="#">2</a></span>
						<span class="meta-info category">Category: <a href="#">Audio</a>, <a href="#">Freebie</a></span>
					</div><!-- .post-meta -->
					<audio id="player2"  src="http://color-theme.com/assets/audio/preview.mp3" controls="controls"></audio>
					<div class="text">
						<p>Motivational and inspiring tune. Many atmospheric sounds, pads, bells guitar, 
						piano, bass and light rock drums. Useful for successful corporate visuals.</p>
						<p class="last"><a href="http://audiojungle.net/item/corporate-motivation-theme-15/493544?ref=zerge">Download it for free!</a></p>
					</div><!-- .text -->
				</div><!-- .post-bg-white -->
			</div><!-- .post-block-style1 -->
			<!-- END POST #5 -->

			<!-- START PAGINATION-->
			<div id="nav-pagination">
				<ul class="nav-pagination clearfix">
	   	    	 	<li class="first"><a href="#"></a></li>
	   	    	 	<li><a href="#">1</a></li>
	   	    	 	<li class="current"><a href="#">2</a></li>
	   	    	 	<li><a href="#">3</a></li>
					<li class="dots">...</li>
	   	    	 	<li><a href="#">20</a></li>
	   	    	 	<li><a href="#">21</a></li>
	   	    	 	<li><a href="#">22</a></li>
	   	    	 	<li class="last"><a href="#"></a></li>
	   	    	 </ul>
			</div>
			<!-- END PAGINATION-->	
		</div><!-- .left-content -->



		<div class="right-sidebar">
			<!-- SEARCH -->
			<div class="widget">
				<h5>Search</h5>
				<form method="get" id="searchform" action="http://html.color-theme.com/linkup">
					<fieldset>
						<input type="text" name="s" id="s" value="To search type and hit enter" onfocus="if(this.value=='To search type and hit enter')this.value='';" onblur="if(this.value=='')this.value='To search type and hit enter';">
					</fieldset>
				</form>
			</div><!-- end .widget -->

			<!-- CATEGORIES -->
			<div class="widget">
				<h5>Categories</h5>
				<ul class="list play">
				<li><a href="#" title="Post With Gallery">Post With Gallery</a></li>
				<li><a href="#" title="Quote Post">Quote Post</a></li>
				<li><a href="#" title="Audio Post">Audio Post</a></li>
				<li><a href="#" title="Post With Link">Post With Link</a></li>
				<li><a href="#" title="Post With Featured Image">Post With Featured Image</a></li>
				</ul>
			</div><!-- end .widget -->

			<!-- COMMENTS -->
			<div class="widget">
				<h5>Recent Comments</h5>
				<ul class="list comment">
				<li>zerge on <a href="#" >Post With Gallery</a></li>
				<li>dimetrio on <a href="#">Quote Post</a></li>
				<li>ikea on <a href="#">Audio Post</a></li>
				<li>kseniya on <a href="#">Post With Link</a></li>
				<li>kolyan on <a href="#">Post With Featured Image</a></li>
				</ul>
			</div><!-- end .widget -->

			<!-- RECENT POSTS -->
			<div class="widget">
				<h5>Recent Posts</h5>
				<ul class="list text">
				<li><a href="#">Getting Good with Git</a></li>
				<li><a href="#">Theme Tumblr Like a Pro</a></li>
				<li><a href="#">Post with Slideshow</a></li>
				<li><a href="#">Simple Text Post</a></li>
				<li><a href="#">Corporate Motivation Audio Theme</a></li>
				</ul>
			</div><!-- end .widget -->
		
			<!-- TWITTER -->
			<div class="widget">
				<h5>Twitter Widget</h5>
				<div id="twitter-widget">
					<div class="tweet-sb"><ul class="tweet_list"><li class="tweet_first tweet_odd"> <span class="tweet_text">Your Say: How many emails are in your inbox? <a href="http://t.co/fOiQRKwz">http://t.co/fOiQRKwz</a></span><span class="tweet_time"><a href="http://twitter.com/envato/status/187682527522197504" title="view tweet on twitter"> about 17 hours ago</a></span></li><li class="tweet_even"> <span class="tweet_text">How Long Does It Take to Make a Quality Item? <a href="http://t.co/vZ0yABEI">http://t.co/vZ0yABEI</a></span><span class="tweet_time"><a href="http://twitter.com/envato/status/187456041913556992" title="view tweet on twitter"> about a day ago</a></span></li><li class="tweet_odd"> <span class="tweet_text">@<a href="http://twitter.com/flexihood">flexihood</a> Thanks! we love you too! :D</span><span class="tweet_time"><a href="http://twitter.com/envato/status/187389650955022338" title="view tweet on twitter"> about a day ago</a></span></li></ul></div>	
				</div>
			</div><!-- end .widget -->
			
			<!-- FLICKR -->
			<div class="widget">
				<h5>Flickr Widget</h5>
				<ul id="cbox-sidebar" class="thumbs"></ul>
			</div><!-- end .widget -->
			
			<!-- VIDEO -->
			<div class="widget video">
				<h5>Video Widget</h5>
				<iframe src="http://player.vimeo.com/video/32802400?title=0&amp;byline=0&amp;portrait=0&amp;color=ffe55a" width="213" height="120"></iframe>
				<p>My latest video, watch it!</p>
			</div><!-- end .widget -->

			<!-- ADVERTISING -->
			<div class="widget advertising">
				<h5>Advertising</h5>
				<div class="ads">
					<a href="http://www.cssmoban.com/?books/get-going-with-google-adwords" class="advertising-link"><img src="images/ads/google.jpg" alt=""></a>
					<a href="http://www.cssmoban.com/?books/rockstar-freelancer" class="advertising-link"><img src="images/ads/freelance.jpg" alt=""></a>
					<a href="http://www.cssmoban.com/?books/successful-facebook-marketing" class="advertising-link"><img src="images/ads/facebook.jpg" class="left margin-right-5px no-margin-bottom" alt=""></a>							
					<a href="http://www.cssmoban.com/?books/how-to-be-a-rockstar-wordpress-designer-2" class="advertising-link"><img src="images/ads/wordpress.jpg" class="no-margin-bottom" alt=""></a>														
				</div><!-- .ads -->
			</div><!-- end .widget -->
			
		</div><!-- end .right-sidebar -->
		<div class="clear"></div>
		<!-- END SIDEBAR-->		
		
	</div><!-- .center-block -->
   <div class="clear"></div>		
	<!-- END CONTENT -->
	
</div><!-- #wrapper -->

<div class="clear"></div>
<!-- END WRAPPER -->	  


<!-- START FOOTER -->
<div class="divider-100-2px"></div>
<div id="footer">
	<div class="center-block clearfix">
		<div class="widget">
			<h6>Contact Info</h6>
			<p>Pinup is an American multinational compane that designs 
			and markets consumer electronics, computer software, and personal computers.
			</p>
			<div>
				<span class="location">12345 / Some Street<br>New York, USA</span>
				<span class="phone">phone: +1 (44)  123-45-67</span>
				<span class="email"><a href="mailto:support@color-theme.com">support@color-theme.com</a></span>
			</div>			
		</div><!-- .widget -->
		
		<div class="widget">
			<h6>Twitter Feed</h6>
			<div class="tweet"></div>
		</div><!-- .widget -->
		
		<div class="widget">
			<h6>Flickr Photos</h6>
			<ul id="cbox" class="thumbs"></ul>
		</div><!-- .widget -->
		
		<div class="widget">
			<img src="images/logo-mini.png" alt="Logo Mini" class="logo" />
			<p>We are a group of designers combining our skills to create traditional 
			and new creative websites for your communicational issues.</p>
			<ul id="footer-social">
    			<li class="twitter"><a href="http://twitter.com/"></a></li>
    			<li class="dribbble"><a href="http://dribbble.com/"></a></li>
    			<li class="facebook"><a href="http://facebook.com/"></a></li>
    			<li class="google"><a href="http://plus.google.com/"></a></li>
    			<li class="linkedin"><a href="http://linkedin.com/"></a></li>
    			<li class="behance"><a href="http://behance.net/"></a></li>
    			<li class="rss"><a href="#"></a></li>
    		</ul>		
		</div><!-- .widget -->
	</div><!-- .center-block -->
</div><!-- #footer -->
<!-- END FOOTER -->


<!-- START FOOTER MENU  -->
<div id="footer-menu">
	<div class="center-block clearfix">
		<ul id="second-menu">
			<li><a href="#">Home</a></li>
			<li><a href="#">Features</a></li>
			<li><a href="#">Typography</a></li>
			<li><a href="#">Pages</a></li>
			<li><a href="#">Portfolio</a></li>
			<li><a href="#">Blog</a></li>
		</ul>
		<div class="copyright">&copy; Copyright &copy; 2013.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></div>
	</div><!-- .center-block -->
</div><!-- #footer-menu -->
<!-- END FOOTER MENU  -->

</body>
</html>