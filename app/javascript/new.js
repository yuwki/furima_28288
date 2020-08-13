window.addEventListener("DOMContentLoaded", () => {

  const itemPrice = document.getElementById("item-price")
  const addTax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('input', () => {
    addTax.textContent = (itemPrice.value * 0.1);
    profit.textContent = (itemPrice.value * 0.9);
  })
})