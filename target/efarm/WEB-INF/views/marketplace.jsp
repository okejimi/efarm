<%@ include file="head.jsp"%>
<!-- Main -->

<div id="main-wrapper">
	<div class="container">

		<!-- Banner -->

		<div class="row">
			<div class="12u">
				<div id="banner">
					<a href="#"><img src="resources/images/banner.jpg" alt="" /></a>
					<!-- <div class="caption">
						<span><strong>Arcana</strong>: A responsive HTML5 site
							template by HTML5 UP</span> <a href="#" class="button">Find Out
							More!</a>
					</div> -->
				</div>
			</div>
		</div>

		<!-- Features -->

		<div class="row">
			<div class="4u">
				<section class="first">
					<figure>
						<img alt="" src="resources/images/leaf.png">
					</figure>
					<h2>WHY US?</h2>
					<p>Mauris fermentum dictum magneuam leo. Ut telloribus eget
						elementum vel curleifend elit. Aean auctorisi et urnaliqt.
						Duirpis. Inteerutrm ante eu lastibulumiamur ulla fn nec eros.
						Vestiblum ante ipsum primis faorci lucs et utrices posuere
						cubilipende sollicitudin vd leo pharetra aug ne.ugue. Nlit
						magnandrerit siet tiidunt aciverra sed nullanec porta diam eu
						massa.</p>
					<div class="btn-align">
						<a class="more-link" target="_self"
							title="learn more" href="about">learn more</a>
					</div>
				</section>
			</div>
			<div class="4u">
				<section>
					<figure>
						<img alt="" src="resources/images/cloud.png">
					</figure>
					<h2>WHO WE ARE</h2>
					<p>Duirpis. Inteerutrm ante eu lastibulumiam Estiblum ante
						ipsum primis faorci lucs et utrices posuere cubilipende
						sollicitudin veied leo pharetra aug neaugue. Nlit magnandrerit
						siet tinidunt aciverra sed nulla.onec porta diam eu massa. Quisque
						diam lorem interdum apibus ac scelerisque vitpede. Donec eget
						tellus non erat lacinia fer mentum. Donec in velit vel ipsum auct.</p>
						<div class="btn-align">
						<a class="more-link" target="_self"
							title="learn more" href="about">learn more</a>
					</div>
				</section>
			</div>
			<div class="4u">
				<section class="last">
					<figure>
						<img alt="" src="resources/images/news.png">
					</figure>
					<h2>IN THE NEWS</h2>
					<ul class="style-list">
						<c:forEach items="${news}" var="title" end="4">
						
							<span class="bold-list"><c:out value="${fn:substring(title, 0, 1)}" /></span><li>${title}</li>
						</c:forEach>
					</ul>
				</section>
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