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
        let valueA, valueB;
        
        if(sortType === "추천순") {
        	console.log("추천순 실행");
        	// productId를 랜덤으로 정렬?
        	valueA = Math.random();
            valueB = Math.random();
        } else if(sortType === "최신순") {
        	console.log("최신순 실행");
        	// productId 내림차순 정렬(최근 등록한 상품이 최상단)
        	/*해결 이미지에는 productId가 나오는데 이름에는 나오지 않음
        	$(b).find(".product_name a").attr("href")에서 이미 productDetail?productId= 만 나옴
        	split하게되면 ["productDetail?productId=", ""] 가 나오게 된다
        	결론 : 갓갓 DevTools 쓰세욤*/
        	valueA = parseInt($(b).find(".product_name a").attr("href").split("=")[1]);
            valueB = parseInt($(a).find(".product_name a").attr("href").split("=")[1]);
        } else if(sortType === "낮은가격") {
        	console.log("낮은가격 실행");
        	// 가격을 기준으로 오름차순 정렬
        	valueA = parseInt($(a).find(".product_price").text().replace(/[^\d]/g, ""));
        	valueB = parseInt($(b).find(".product_price").text().replace(/[^\d]/g, ""));
        } else if(sortType === "높은가격") {
        	console.log("높은가격 실행");
            // 가격을 기준으로 내림차순 정렬
        	valueA = parseInt($(b).find(".product_price").text().replace(/[^\d]/g, ""));
        	valueB = parseInt($(a).find(".product_price").text().replace(/[^\d]/g, ""));
        } else if(sortType === "브랜드") {
        	console.log("브랜드 실행");
        	// productName 앞자리가 브랜드이름으로 되어있음
        	// productMaker비교
        	valueA = $(a).find(".product_name a").text().split(" ")[0];
            valueB = $(b).find(".product_name a").text().split(" ")[0];
        }

        // 비교 결과에 따라 정렬 순서 반환
        return valueA > valueB ? 1 : -1;
    });

    // 리스트를 비우고 정렬된 상품 리스트를 다시 출력
    productList.empty().append(items);
}
