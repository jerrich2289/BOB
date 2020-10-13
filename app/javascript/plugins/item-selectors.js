const initSelectableItems = () => {
  const items = document.querySelectorAll(".popup-menu-item");
  items.forEach((item) => {
    item.addEventListener("click", (e) => {
      e.preventDefault();
      const itemID = item.dataset.itemId;
      const form = document.getElementById("selectForm");
      const input = form.querySelector('[name="item_id"]');
      input.value = itemID;
      form.submit();
    })
  })
}

export { initSelectableItems }