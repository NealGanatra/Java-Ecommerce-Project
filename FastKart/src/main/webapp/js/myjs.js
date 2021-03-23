function makeActive(cId){

	var d=document.getElementById('cvalue'+cId);
	d.className +=" active";
	//alert(d.className);
	//d.classList.add(" active");
	
}

function add_to_cart(pid,pname,price){
	let cart=localStorage.getItem("cart");
	if(cart==null){
		let products =[];
		let product={productId:pid,productQuantity:1,productName:pname,productPrice:price};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("Product Added for first Time");
	}
	else{
		
		let pcart=JSON.parse(cart);
		let oldProduct=pcart.find((item)=>item.productId==pid);
		
		if(oldProduct){
			
			pcart.map(
			(item)=>{
				if(item.productId==oldProduct.productId)
					{
					item.productQuantity+=1;
					console.log("Quant is increased");
					}
			}		
			);
			localStorage.setItem("cart",JSON.stringify(pcart));
		}
		else{
			let product={productId:pid,productQuantity:1,productName:pname,productPrice:price};
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("Product is added");
		}
	}
	updateCart();
}


function updateCart(){
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart == null || cart.length == 0){
		console.log('cart is empty');
		$(".cart-items").html("( 0 )");
		//alert("your cart is Empty")
		$(".cart-body").html("<h3>Your cart is Empty</h3>");
		$(".checkout-btn").addClass('disabled');
	}
	else{
		console.log("Cart is filled");
		$(".cart-items").html(`(${cart.length})`);
		let table=`<table class="table">
		<thead>
		<tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Total Price</th>
		<th>Action</th>
		</tr>
		</thead>`;
		let totalPrice=0;
		cart.map((item)=>{table+=
			`<tr>
			<td>${item.productName}</td>
			<td>${item.productPrice}</td>
			<td>${item.productQuantity}</td>
			<td>${item.productQuantity*item.productPrice}</td>
			<td><button class="btn btn-danger btn-sm" onclick='deleteItemFromCart(${item.productId})'>Remove</button></td>
			</tr>`
			totalPrice+=item.productPrice * item.productQuantity;
			
		});
		
		table=table+`
		<tr><td colspan='5' class='text-center font-weight-bold mt-5'><b> Total Price : ${totalPrice}</b></td></tr>
		</table>`;
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass('disabled');
	}
	
	
}

function deleteItemFromCart(pid){
	
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	let newcart=cart.filter((item)=>item.productId !=pid);
	localStorage.setItem("cart",JSON.stringify(newcart));
	updateCart();
	
}

function showToast(){
	$('#toast').addClass('display');
	
	setTimeout(() => {
		$('#toast').removeClass('display');
	}, 2000);
}

$(document).ready(function(){
	updateCart();
}
		);
