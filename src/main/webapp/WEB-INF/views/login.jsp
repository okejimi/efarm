<%@ include file="head.jsp"%>
<!-- Main -->

<div id="main-wrapper">
	<div class="container">

		<!-- Banner -->

		<div class="row">
			<div class="9u right-border">
				<div id="banner">
					<!-- start login form -->
					<form class="pure-form pure-form-aligned" id="login-form"
						action="login" method="post">
						<fieldset>
						<div class="pure-control-group">
							<c:if test="${param.error != null}">
								<p>Invalid username and password.</p>
							</c:if>
							</div>
							<div class="pure-control-group">
								<label for="name">Username</label> <input id="name" type="text" name="username"
									placeholder="Username">
							</div>

							<div class="pure-control-group">
								<label for="password">Password</label> <input id="password"
									type="password" placeholder="Password" name="password">
							</div>

							<div class="pure-controls">
								<button type="submit" class="pure-button pure-button-primary">Submit</button>
							</div>
						</fieldset>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<!-- end login form -->

				</div>
			</div>
			<div class="3u">
				<div class="acct-msg msg-reg">
					<h3>No Account Yet?</h3>
					<p class="reg-text-label">
						<a href="register">signup</a> today
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