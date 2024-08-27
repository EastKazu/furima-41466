window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById('add-tax-price')
  
  priceInput.addEventListener('input', function(){
    const price = parseFloat(priceInput.value) 
    const tax = Math.floor(price * 0.10)            
    addTaxPrice.textContent = tax;
  })


})