<%@ include file="head.jsp"%>
<!-- Main -->

<div id="main-wrapper">
	<div class="container">

		<!-- Banner -->

		<div class="row">
			<div>
				<form action="buy" method="post">
					<input type="text" name="search" placeholder="Enter a search term"
						id="search" value="${search}"> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div>
						<input type="submit" value="Sign In" />
					</div>
				</form>
			</div>
			<div class="3u">
				<p class="facet-heading">Name</p>
				<form action="buy?search=${search}" method="post" id="facet-form">
					<ul>
						<c:forEach items="${products.productsFacets}" var="facet"
							varStatus="status">
							<li><ul class="inline-list">
									<li><input type="checkbox" title="${facet.value}"
										name="name" value="${facet.value}"
										<c:forEach items="${nameFilters}" var="nameFilter">
								<c:if test="${nameFilter eq facet.value}">checked="checked"</c:if>
							</c:forEach>></li>
									<li>${facet.value}</li>
									<li>${facet.count}</li>
								</ul></li>
						</c:forEach>
					</ul>
					<div class="row">
						<div class="12u">
							<div class="bottom-divider divider-bottom"></div>
						</div>
					</div>
					<p class="facet-heading">Location</p>
					<ul>
						<c:forEach items="${products.locationFacets}" var="facet"
							varStatus="status">
							<li><ul class="inline-list">
									<li><input type="checkbox" title="${facet.value}"
										name="location" value="${facet.value}"
										<c:forEach items="${locationFilters}" var="locationFilter">
								<c:if test="${locationFilter eq facet.value}">checked="checked"</c:if>
							</c:forEach>></li>
									<li>${facet.value}</li>
									<li>${facet.count}</li>
								</ul></li>
						</c:forEach>
					</ul>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
			</div>
			<div class="9u">
				<div class="centre-box">
					<select name="sort" id="sort-select">
						<c:set value="${sort eq 'relevance'}" var="relevance" />
						<c:set value="${sort eq 'created'}" var="created" />
						<option value="relevance" <c:if test="${relevance}">selected</c:if> >Relevance</option>
						<option value="created" <c:if test="${created}">selected</c:if> >Created</option>
					</select>
					<table class="pure-table">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Location</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Description</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${products.products}" var="product"
								varStatus="status">
								<tr class="pure-table-odd">
									<td>${status.count}</td>
									<td>${product.name}</td>
									<td>${product.location}</td>
									<td>${product.price}</td>
									<td>${product.quantity}</td>
									<td>${product.description}</td>
								</tr>
							</c:forEach>
							<!-- <tr class="pure-table-odd">
							<td>1</td>
							<td>Honda</td>
							<td>Accord</td>
							<td>2009</td>
						</tr>

						<tr>
							<td>2</td>
							<td>Toyota</td>
							<td>Camry</td>
							<td>2012</td>
						</tr>
 -->
						</tbody>
					</table>
				</div>
			</div>
			</form>
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