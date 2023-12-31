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

/**
 * 상품 리스트를 주제에 따라 정렬하는 함수
 * 
 * @param sortType 동작을 감지한 이벤트 핸들러
 * @returns 리스트를 한번 비우고 정렬한 리스트로 다시 출력
 */
function sortProductList(sortType) {
    const productList = $(".productList");
    const items = productList.children(".item_list");

    items.sort(function(a, b) {
        let valueA, valueB;
        
        if(sortType === "추천순") {
        	// productId를 랜덤으로 정렬?
        	valueA = Math.random();
            valueB = Math.random();
        } else if(sortType === "최신순") {
        	// productId 내림차순 정렬(최근 등록한 상품이 최상단)
        	valueA = parseInt($(b).find(".product_name a").attr("href").split("=")[1]);
            valueB = parseInt($(a).find(".product_name a").attr("href").split("=")[1]);
        } else if(sortType === "낮은가격") {
        	// 가격을 기준으로 오름차순 정렬
        	valueA = parseInt($(a).find(".product_price").text().replace(/[^\d]/g, ""));
        	valueB = parseInt($(b).find(".product_price").text().replace(/[^\d]/g, ""));
        } else if(sortType === "높은가격") {
            // 가격을 기준으로 내림차순 정렬
        	valueA = parseInt($(b).find(".product_price").text().replace(/[^\d]/g, ""));
        	valueB = parseInt($(a).find(".product_price").text().replace(/[^\d]/g, ""));
        } else if(sortType === "브랜드") {
        	// productName 앞자리가 브랜드이름으로 되어있음
        	// productMaker비교
        	valueA = $(a).find(".product_name a").text().split(" ")[0];
            valueB = $(b).find(".product_name a").text().split(" ")[0];
        }

        // 비교 결과에 따라 정렬 순서 반환(삼항 조건 연산자)
        return valueA > valueB ? 1 : -1;
    });

    // 리스트를 비우고 정렬된 상품 리스트를 다시 출력
    productList.empty().append(items);
}
