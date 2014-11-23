<%@ include file="head.jsp"%>
<!-- Main -->

<div id="main-wrapper">
	<div class="container">

		<!-- Banner -->

		<div class="row">
			<div class="9u right-border">
				<div id="banner">
				<span class="error">${message}</span>
					<!-- start reg form -->
					<form class="pure-form pure-form-aligned" id="reg-form"
						action="register?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
						<fieldset>
							<div class="pure-control-group">
								<label for="name">Name (FirstName LastName)</label> <input
									id="name" name="name" type="text"
									placeholder="FirstName LastName" required="required"
									style="width: 500px">
							</div>
							<div class="pure-control-group">
								<label for="email">Email Address</label> <input id="email"
									name="email" type="email" placeholder="Email Address"
									required="required">
							</div>
							<div class="pure-control-group">
								<label for="phone">Phone number</label> <input id="phone"
									name="phone" type="text" placeholder="phone"
									required="required">
							</div>

							<div class="pure-control-group">
								<label for="password">Password</label> <input id="password"
									type="password" placeholder="Password" required="required"
									name="password">
							</div>

							<div class="pure-control-group">
								<label for="address">Address Line 1</label> <input
									name="address[0].street" id="address1" type="text"
									placeholder="Address line 1" style="width: 500px">
							</div>
							<div class="pure-control-group">
								<label for="address">Address Line 2</label> <input
									name="address[0].city" id="address2" type="text"
									placeholder="Address line 2" style="width: 500px">
							</div>
							<div class="pure-control-group">
								<label for="country">Country</label> <select style="width: auto"
									name="address[0].country">
									<option value="nigeria">Nigeria</option>
								</select>
							</div>
							<!-- <div class="pure-control-group">
								<label for="type">Are you a seller or buyer</label> 
								<select style="width:auto" name="personType[0]">
									<option value="seller">Seller</option>
									<option value="buyer">Buyer</option>
								</select>
							</div> -->
							<div class="pure-control-group">
								<label for="photo">Photo</label> <input type="file" id="file"
									name="file" placeholder="Photo">
							</div>

							<div class="pure-controls">
								<label for="cb" class="pure-checkbox"> <input id="cb"
									type="checkbox"> I've read the terms and conditions
								</label>

								<button type="submit" class="pure-button pure-button-primary">Submit</button>
							</div>
						</fieldset>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<!-- end reg form -->

				</div>
			</div>
			<div class="3u">
				<div class="acct-msg msg-login">
					<h3>Have an Account?</h3>
					<p class="reg-text-label">
						If you already have a password, please <a href="login">signin</a>
					</p>
				</div>
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