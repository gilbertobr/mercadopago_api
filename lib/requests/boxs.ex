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

    @doc """
    Create Box
    [docs](https://www.mercadopago.com.br/developers/pt/reference/pos/_pos/post)    

    ## Examples
        iex> data =
        %{
          "name": "First POS",
          "fixed_amount": false,
          "store_id": 1234567,
          "external_store_id": "SUC001",
          "external_id": "SUC001POS001",
          "category": 621102
        }         
        iex> Mercadopago.Requests.Boxs.create(data)

    """
    def create(data) do
        Mercadopago.API.post("/pos", data)
    end    

    @doc """
    Update Box
    [docs](https://www.mercadopago.com.br/developers/pt/reference/pos/_pos_id/put)    

    ## Examples
        iex> data =
        %{
          "name": "First POS",
          "fixed_amount": false,
          "category": 621102,
          "store_id": 1234567
        }         
        iex> Mercadopago.Requests.Boxs.update(data)

    """
    def update(box_id, data) do
        Mercadopago.API.post("/pos/#{box_id}", data)
    end        

    @doc """
    Create Box
    [docs](https://www.mercadopago.com.br/developers/pt/reference/pos/_pos_id/delete)    

    ## Examples
        iex> Mercadopago.Requests.Boxs.delete("1")

    """
    def delete(box_id) do
        Mercadopago.API.delete("/pos/#{box_id}")
    end        
end