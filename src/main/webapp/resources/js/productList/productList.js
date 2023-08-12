/**
 * filter_menu 클릭 시 선택 항목 강조표시
 */
$(function() {
    // 정렬 버튼 클릭 시 동작하는 이벤트 핸들러
    $(".filter_menu ul li a").on("click", function(event) {
        event.preventDefault();
        $(".filter_menu ul li a").removeClass("active");
        $(this).addClass("active");
        
        // 클릭한 버튼의 텍스트를 가져옴
        const sortType = $(this).text();
        // 상품 리스트를 해당 주제에 맞게 정렬
        sortProductList(sortType);
    });
});

// 상품 리스트를 주제에 따라 정렬하는 함수
function sortProductList(sortType) {
    const productList = $(".productList");
    const items = productList.children(".item_list");

    items.sort(function(a, b) {
        let priceA, priceB;

        if (sortType === "신상품") {
        	// new 클래스로 주면 될듯?
        } else if (sortType === "낮은가격") {
            // 가격을 기준으로 오름차순 정렬
        	priceA = parseInt($(a).find(".product_price").text().replace(/[^\d]/g, ""));
        	priceB = parseInt($(b).find(".product_price").text().replace(/[^\d]/g, ""));
        } else if (sortType === "높은가격") {
            // 가격을 기준으로 내림차순 정렬
        	priceA = parseInt($(b).find(".product_price").text().replace(/[^\d]/g, ""));
            priceB = parseInt($(a).find(".product_price").text().replace(/[^\d]/g, ""));
        }

        // 비교 결과에 따라 정렬 순서 반환
        return valueA > valueB ? 1 : -1;
    });

    // 정렬된 상품 리스트를 다시 출력
    productList.empty().append(items);
}
