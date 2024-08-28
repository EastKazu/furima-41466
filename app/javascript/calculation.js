const price = () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    const addTaxPrice = document.getElementById('add-tax-price');
    const addProfit = document.getElementById('profit');

    priceInput.addEventListener('input', function() {
      const price = parseFloat(priceInput.value);
      const tax = Math.floor(price * 0.10);
      const profit = price - tax;
      addTaxPrice.textContent = tax;
      addProfit.textContent = profit;
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);