const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const Button = document.getElementById("button");

  Button.addEventListener("click", function(e){
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form")
    const formData = new FormData(formResult)

    const card = {
      number: formData.get("card_number"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
      cvc: formData.get("cvc")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token type="hidden>`
        renderDom.insertAdjacentHTML("beforeend", tokenObj)
      }

      document.getElementById("card_number").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");

      document.getElementById("charge-form").onsubmit();
    });
  });
};


window.addEventListener("load", pay);
