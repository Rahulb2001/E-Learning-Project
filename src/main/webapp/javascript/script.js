function add_to_cart(cid, cname, cprice) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		let courses = [];
		let course = { courseId: cid, courseName: cname, coursequantity: 1, courseprice: cprice };
		courses.push(course);
		localStorage.setItem("cart", JSON.stringify(courses));
		console.log("course added first time ");
		showToast("Course added to cart")

	} else {
		let ccart = JSON.parse(cart);
		let oldcourse = ccart.find((item) => item.courseId == cid)
		if (oldcourse) {
			oldcourse.coursequantity = oldcourse.coursequantity + 1
			ccart.map((item) => {
				if (item.courseId == oldcourse.courseId) {
					item.coursequantity = oldcourse.coursequantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(ccart))
			console.log("course quantity Increased ");
			showToast("Course already added to cart")

		} else {
			let course = { courseId: cid, courseName: cname, coursequantity: 1, courseprice: cprice };
			ccart.push(course);
			localStorage.setItem("cart", JSON.stringify(ccart));
			console.log("course added ");
			showToast("Course added to cart")
		}

	}
	updatecart()

}
function updatecart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log("cart is empty");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart does not have any item</h3>");
		$(".checkout-btn").attr('disabled',true)
	} else {
		console.log("OKAy")
		$(".cart-items").html(`(${cart.length})`);
		let table = ` 
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Course name</th>
		<th>Course Price</th>
		<th>Total Price</th>
		<th>Action</th>
		</tr>
		</thead>
		`;
		let tp = 0;
		cart.map((item) => {
			table += `
			<tr>
			<td>${item.courseName}</td>
			<td>${item.courseprice}</td>
			<td>${item.courseprice}</td>
			<td><button onclick='deleteitemfromcart(${item.courseId})' class='btn btn-danger btn-sm'>Remove</button></td>
			</tr>
			
			`
			tp += item.courseprice;

		})
		table = table + `
		
		<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${tp}</td></tr>
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false)

	}
}

function deleteitemfromcart(cid) {
	let cart = JSON.parse(localStorage.getItem('cart'));

	let newcart = cart.filter((item) => item.courseId != cid)
	localStorage.setItem('cart', JSON.stringify(newcart))
	
	updatecart();
	showToast("Course Removed From Cart")

}
$(document).ready(function() {
	updatecart()
})

function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>{
		$("#toast").removeClass("display");
	},2000);
}
function gotocheckout(){
	window.location="checkout.jsp";
}
function enroll(coursetitle){
	var f=document.form1;
f.method="post";
	window.location="NUser.jsp";
}
