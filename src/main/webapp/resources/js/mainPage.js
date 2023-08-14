/*$(init);

function init(sortType) {
	const productList = $(".productList");
    const items = productList.children(".product-entry");
    
    items.sort(function(a, b) {
    	let valueA, valueB;
    	
    	valueA = parseInt($(b).find(".product_name a").attr("href").split("=")[1]);
        valueB = parseInt($(a).find(".product_name a").attr("href").split("=")[1]);
        
        return valueA > valueB ? 1 : -1;
    });
    productList.empty().append(items);
};*/


window.onload = function() {
	const productList = $(".productList");
    const items = productList.children(".product-entry");
    
    items.sort(function(a, b) {
    	let valueA, valueB;
    	
    	valueA = parseInt($(b).find(".product_name a").attr("href").split("=")[1]);
        valueB = parseInt($(a).find(".product_name a").attr("href").split("=")[1]);
        
        return valueA > valueB ? 1 : -1;
    });
    productList.empty().append(items);
}