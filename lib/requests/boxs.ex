defmodule Mercadopago.Requests.Boxs do
    @moduledoc """
    Documentation for Mercadopago.Requests.Boxs
    """

    @doc """
    Search in boxes
    [docs](https://www.mercadopago.com.br/developers/pt/reference/pos/_pos/get)    

    ## Examples

        iex> Mercadopago.Requests.Boxs.search()
        {:ok,%{
        paging: %{limit: 30, offset: 0, total: 1},
        results: [...]}
        }    
    """
    def search() do
        Mercadopago.API.get("/pos")
    end

    @doc """
    Get box
    [docs](https://www.mercadopago.com.br/developers/pt/reference/pos/_pos_id/get)    

    ## Examples

        iex> Mercadopago.Requests.Boxs.show("1212121")
        {:ok,%{
        date_created: "2020-07-07T15:21:20.000-04:00",
        date_last_updated: "2020-09-30T08:09:11.000-04:00",
        external_id: "default",
        fixed_amount: false,
        ...
        } 
    """
    def show(box_id) do
        Mercadopago.API.get("/pos/#{box_id}")
    end    
end