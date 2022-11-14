window.addEventListener ('load', function(){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener('input', function(){
    const pre_tax = Number(price.value) * 0.1
    tax.innerHTML = Math.floor(pre_tax)
    const pre_profit =Number(price.value) * (1 - 0.1)
    profit.innerHTML = Math.floor(pre_profit)
  });
});