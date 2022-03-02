<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<header>
	<link rel="stylesheet"
		href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
</header>

<body>
	<div class="wrapper">
		<!--Header Start-->

		<div id="search">
			<button type="button" class="close">Ã</button>
			<form class="search-overlay-form">
				<input type="search" value="" placeholder="type keyword(s) here" />
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div>
		<div id="grid"></div>


		<div class="row">
			<div class="col-md-12">
				<div class="gt-pagination mt20">
					<nav>
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <i class="fas fa-angle-left"></i>
							</a></li>
							<li class="page-item"><a class="page-link" href="notice.do">1</a></li>
							<li class="page-item active"><a class="page-link"
								href="notice1">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <i class="fas fa-angle-right"></i>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	</div>
	</section>
	<!--Causes End-->
	<!--Footer Start-->

	</div>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script>
		const gridData = [ {
			id : '10012',
			city : 'Seoul',
			country : 'South Korea',
		}, {
			id : '10013',
			city : 'Tokyo',
			country : 'Japan',
		}, {
			id : '10014',
			city : 'London',
			country : 'England',
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia',
		}, {
			id : '10016',
			city : 'Reykjavik',
			country : 'Iceland',
		},{
			id : '10012',
			city : 'Seoul',
			country : 'South Korea',
		}, {
			id : '10013',
			city : 'Tokyo',
			country : 'Japan',
		}, {
			id : '10014',
			city : 'London',
			country : 'England',
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia',
		}, {
			id : '10016',
			city : 'Reykjavik',
			country : 'Iceland',
		}, {
			id : '10012',
			city : 'Seoul',
			country : 'South Korea',
		}, {
			id : '10013',
			city : 'Tokyo',
			country : 'Japan',
		}, {
			id : '10014',
			city : 'London',
			country : 'England',
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia',
		}, {
			id : '10016',
			city : 'Reykjavik',
			country : 'Iceland',
		},{
			id : '10012',
			city : 'Seoul',
			country : 'South Korea',
		}, {
			id : '10013',
			city : 'Tokyo',
			country : 'Japan',
		}, {
			id : '10014',
			city : 'London',
			country : 'England',
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia',
		}, {
			id : '10016',
			city : 'Reykjavik',
			country : 'Iceland',
		},{
			id : '10012',
			city : 'Seoul',
			country : 'South Korea',
		}, {
			id : '10013',
			city : 'Tokyo',
			country : 'Japan',
		}, {
			id : '10014',
			city : 'London',
			country : 'England',
		}, {
			id : '10015',
			city : 'Ljubljana',
			country : 'Slovenia',
		}, {
			id : '10016',
			city : 'Reykjavik',
			country : 'Iceland',
		},];

		const grid = new tui.Grid({
			el : document.getElementById('grid'),
			data : gridData,
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '아이디',
				name : 'id',
			}, {
				header : '국가',
				name : 'country',
			}, {
				header : '도시',
				name : 'city',
			}, ],
		});
	</script>

</body>


</html>