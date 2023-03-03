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

end