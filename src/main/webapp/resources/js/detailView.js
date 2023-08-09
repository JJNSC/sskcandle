function count(type)  {
  // 결과를 표시할 element
  var resultElement = $('input[name=result]').val();
  console.log("현재 밸류 : "+resultElement);

  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(resultElement) + 1;
  }else if(type === 'minus')  {
    number = parseInt(resultElement) - 1;
  }
  console.log("변경된 숫자: "+number);
  
  // 결과 출력
  $('input[name=result]').attr('value', number);
}