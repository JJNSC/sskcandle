
function count(type)  {
  // 결과를 표시할 element
  var resultElement = $('input[name=result]').val();
  console.log("현재 밸류 : "+resultElement);
  // 현재 화면에 표시된 값
  var number = resultElement.innerText;
  console.log("변경전 숫자: " +number);

  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  console.log("변경된 숫자: "+number);
  
  // 결과 출력
  resultElement.innerText = number;
}