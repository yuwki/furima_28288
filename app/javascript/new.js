window.addEventListener("DOMContentLoaded", () => {

  const itemPrice = document.getElementById("item-price")
  const addTax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('input', () => {
    
    addTax.innerHTML = (itemPrice.value * 0.1);
    profit.innerHTML = (itemPrice.value * 0.9);
  })
})