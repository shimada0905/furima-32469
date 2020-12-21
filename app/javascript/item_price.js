function salesProfit (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputPrice = itemPrice.value;
    const addTaxPrice = document.getElementById('add-tax-price');
    addTaxPrice.innerHTML = `${Math.floor(inputPrice * 0.1)}`;
    const profit = document.getElementById('profit')
    profit.innerHTML = `${inputPrice - Math.floor(inputPrice * 0.1)}`;
  });
}

window.addEventListener('load', salesProfit);