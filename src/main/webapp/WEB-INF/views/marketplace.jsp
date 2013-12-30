<%@ include file="head.jsp"%>
<!-- Main -->

<div id="main-wrapper">
	<div class="container">

		<!-- Banner -->

		<div class="row">
			<div class="3u">
				<div>&nbsp;</div>
			</div>
			<div class="9u">
				<div class="centre-form">
					<!--Begin listing form -->
					<h2 style="margin: 0 auto">LIST YOUR ITEM</h2>
					<form class="pure-form pure-form-aligned" id="product-form"
						action="addproduct?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
						<fieldset>
							<div class="pure-control-group">
								<label for="item name">Item</label> <input id="item" type="text"
									name="name" placeholder="Item name e.g yam, cocoa">
							</div>

							<div class="pure-control-group">
								<label for="location">Location</label> <input id="location"
									type="text" placeholder="Item location" name="location">
							</div>

							<div class="pure-control-group">
								<label for="price">Price</label> <input id="price" type="number"
									placeholder="Item price" name="price">
							</div>

							<div class="pure-control-group">
								<label for="quantity">Quantity</label> <input id="quantity"
									type="number" placeholder="Item quantity" name="quantity">
							</div>

							<div class="pure-control-group">
								<label for="description">Item description</label>
								<textarea name="description" id="description"
									style="width: 600px;" placeholder="Enter a short description"></textarea>
							</div>

							<div class="pure-control-group">
								<label for="file">Photo</label> <input type="file" name="file"
									id="file" style="width: 600px;"
									placeholder="Upload a file if any">
							</div>

							<div class="pure-controls">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit" class="pure-button pure-button-primary">Submit</button>
							</div>
						</fieldset>
					</form>

					<!-- End listing form -->
				</div>
			</div>
			<div class="3u">
				<div>&nbsp;</div>
			</div>
		</div>


		<!-- Divider -->

		<div class="row">
			<div class="12u">
				<div class="divider divider-top"></div>
			</div>
		</div>

		<!-- Highlight Box -->

		<div class="row">
			<div class="4u featured">
				<section class="first">
					<figure class="feature-product">
						<img alt="" src="resources/images/cabbage.jpg">
					</figure>
				</section>
			</div>
			<div class="4u featured">
				<section class="first">
					<figure class="feature-product">
						<img alt="" src="resources/images/pepper.jpg">
					</figure>
				</section>
			</div>
			<div class="4u featured">
				<section class="first">
					<figure class="feature-product">
						<img alt="" src="resources/images/carrot.jpg">
					</figure>
				</section>
			</div>
		</div>

		<!-- Divider -->

		<div class="row">
			<div class="12u">
				<div class="divider divider-bottom"></div>
			</div>
		</div>

		<!-- Thumbnails -->

		<!-- <div class="row">
			<div class="12u">
				<section class="thumbnails first last">
					<div>
						<div class="row">
							<div class="4u">
								<div class="thumbnail first">
									<a href="#"><img src="resources/images/pic1.jpg" alt="" /></a>
									<blockquote>Duis neque nisi, dapibus sed mattis et
										quis, rutrum accumsan sed. Suspendisse eu varius nibh.
										Suspendapibus sed mattis quis.</blockquote>
									<cite><strong>Jane Doe</strong> Lorem Ipsum Dolore</cite>
								</div>
							</div>
							<div class="4u">
								<div class="thumbnail">
									<a href="#"><img src="resources/images/pic2.jpg" alt="" /></a>
									<blockquote>Duis neque nisi, dapibus sed mattis et
										quis, rutrum accumsan sed. Suspendisse eu varius nibh.
										Suspenddapibus sed mattis quis.</blockquote>
									<cite><strong>John Doe</strong> Lorem Ipsum Dolore</cite>
								</div>
							</div>
							<div class="4u">
								<div class="thumbnail">
									<a href="#"><img src="resources/images/pic3.jpg" alt="" /></a>
									<blockquote>Duis neque nisi, dapibus sed mattis et
										quis, rutrum accumsan sed. Suspendisse eu varius nibh.
										Suspenddapibus sed mattis quis.</blockquote>
									<cite><strong>Jane Doe</strong> Lorem Ipsum Dolore</cite>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="12u">
								<div class="divider"></div>
							</div>
						</div>
						<div class="row">
							<div class="4u">
								<div class="thumbnail">
									<a href="#"><img src="resources/images/pic4.jpg" alt="" /></a>
									<blockquote>Duis neque nisi, dapibus sed mattis et
										quis, rutrum accumsan sed. Suspendisse eu varius nibh.
										Suspenddapibus sed mattis quis.</blockquote>
									<cite><strong>John Doe</strong> Lorem Ipsum Dolore</cite>
								</div>
							</div>
							<div class="4u">
								<div class="thumbnail">
									<a href="#"><img src="resources/images/pic5.jpg" alt="" /></a>
									<blockquote>Duis neque nisi, dapibus sed mattis et
										quis, rutrum accumsan sed. Suspendisse eu varius nibh.
										Suspenddapibus sed mattis quis.</blockquote>
									<cite><strong>Jane Doe</strong> Lorem Ipsum Dolore</cite>
								</div>
							</div>
							<div class="4u">
								<div class="thumbnail last">
									<a href="#"><img src="resources/images/pic6.jpg" alt="" /></a>
									<blockquote>Duis neque nisi, dapibus sed mattis et
										quis, rutrum accumsan sed. Suspendisse eu varius nibh.
										Suspenddapibus sed mattis quis.</blockquote>
									<cite><strong>John Doe</strong> Lorem Ipsum Dolore</cite>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div> -->

		<!-- Divider -->

		<!-- 	<div class="row">
			<div class="12u">
				<div class="divider divider-top"></div>
			</div>
		</div> -->

		<!-- CTA Box -->

		<div class="row">
			<div class="12u">
				<div class="cta-box">
					<span>Amet lorem varius tempus consequat lorem?</span> <a href="#"
						class="button">Ipsum Consequat</a>
				</div>
			</div>
		</div>

	</div>
</div>
<jsp:include page="foot.jsp"></jsp:include>