defmodule Mercadopago.Requests.MerchantOrders do
    @moduledoc """
    Documentation for Mercadopago.Requests.MerchantOrders
    """

    @doc """
    Search in orders
    [docs](https://www.mercadopago.com.br/developers/pt/reference/merchant_orders/_merchant_orders_search/get)    

    ## Examples

        iex> Mercadopago.Requests.MerchantOrders.search()
        {:ok,%{..., 
          [...,
          shipments: [],
          shipping_cost: 0,
          site_id: "MLB",
          sponsor_id: nil,
          status: "closed",
          total_amount: 250.74
        }
        ],
        next_offset: 20,
        total: 114
        }
    """
    def search() do
        Mercadopago.API.get("/merchant_orders/search")
    end

    @doc """
    Get order
    [docs](https://www.mercadopago.com.br/developers/pt/reference/merchant_orders/_merchant_orders_id/get)    

    ## Examples

        iex> Mercadopago.Requests.MerchantOrders.show("121221")
        {:ok,%{
        additional_info: "",
        application_id: nil,
        cancelled: false,
        collector: %{},
        ...
        }    
    """
    def show(order_id) do
      Mercadopago.API.get("/merchant_orders/#{order_id}")
    end

    @doc """
    Create order
    [docs](https://www.mercadopago.com.br/developers/pt/reference/merchant_orders/_merchant_orders/post)    

    ## Examples
        iex> data =
        %{
          "external_reference": "default",
          "preference_id": "Preference identification",
          "payer": {
            "id": 123,
            "nickname": "JOHN"
          },
          "site_id": "MLA",
          "items": [
            {
              "id": "item id",
              "category_id": "item category",
              "currency_id": "BRL",
              "description": "item description",
              "picture_url": "item picture",
              "quantity": 1,
              "unit_price": 5,
              "title": "item title"
            }
          ],
          "application_id": 10000000000000000
        }         
        iex> Mercadopago.Requests.MerchantOrders.create(data)

    """
    def create(data) do
      Mercadopago.API.post("/merchant_orders", data)
    end

    @doc """
    Update order
    [docs](https://www.mercadopago.com.br/developers/pt/reference/merchant_orders/_merchant_orders_id/put)    

    ## Examples
        iex> data =
        %{
          "external_reference": "default",
          "preference_id": "Preference identification",
          "payer": {
            "id": 123,
            "nickname": "JOHN"
          },
          "site_id": "MLA",
          "items": [
            {
              "id": "item id",
              "category_id": "item category",
              "currency_id": "BRL",
              "description": "item description",
              "picture_url": "item picture",
              "quantity": 1,
              "unit_price": 5,
              "title": "item title"
            }
          ],
          "application_id": 10000000000000000
        }
        iex> Mercadopago.Requests.MerchantOrders.update("12345", data)

    """
    def update(order_id, data) do
      Mercadopago.API.put("/merchant_orders/#{order_id}", data)
    end

end