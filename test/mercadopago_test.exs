defmodule MercadopagoTest do
  use ExUnit.Case
  doctest Mercadopago

  test "Mercadopago Token" do
    assert Mercadopago.get_token() == "mytoken"
  end
end
