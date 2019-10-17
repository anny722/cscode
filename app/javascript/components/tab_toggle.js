const tabToggle = () => {
const tabs = document.querySelectorAll('.tab-language');
tabs.forEach((element) => {
  element.addEventListener("click", (event) => {
    const tabId = element.getAttribute("data-id");
    const forms = document.querySelectorAll('.form-tab-id input');
    forms.forEach((element) => {
      element.setAttribute('value', tabId);
    });
  });
});
};
export { tabToggle };
