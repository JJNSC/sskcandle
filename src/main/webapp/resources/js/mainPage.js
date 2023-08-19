$(function() {
    $(".review_userName").each(function() {
        const originalUsernameElement = $(this).find("#format_userName");
        const originalUsername = originalUsernameElement.text();

        const charCount = Math.ceil(originalUsername.length * 0.2); // 뒤쪽 20%의 글자 수 계산
        const maskedPart = '*'.repeat(charCount); // *로 대체된 문자열 생성
        const maskedUsername = originalUsername.slice(0, -charCount) + maskedPart; // 기존 문자열의 뒷부분을 *로 대체한 문자열로 변경
        originalUsernameElement.text(maskedUsername); // 변경된 문자열로 엘리먼트 내용 갱신
    });
});