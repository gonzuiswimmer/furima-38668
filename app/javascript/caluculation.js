window.addEventListener ('load', function(){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener('input', function(){
    tax.innerHTML = Number(price.value) * 0.1
    profit.innerHTML = Number(price.value) * (1 - 0.1)
  });
});