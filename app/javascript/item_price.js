window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    // 価格
    const inputValue = priceInput.value;
    // 販売手数料
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    // 販売利益
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(inputValue - inputValue * 0.1)
  })
});