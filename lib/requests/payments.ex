defmodule Mercadopago.Requests.Payments do
    @moduledoc """
    Documentation for Mercadopago.Requests.Payments
    """

    @doc """
    Get payment methods
    [docs](https://www.mercadopago.com.br/developers/pt/reference/payment_methods/_payment_methods/get)    

    ## Examples

        iex> Mercadopago.Requests.Payments.methods()
        {:ok, [%{
        deferred_capture: "supported",
        financial_institutions: [],
        id: "amex",
        max_allowed_amount: 60000,
        min_allowed_amount: 0.5,
        name: "American Express",
        payment_type_id: "credit_card",
        processing_modes: ["aggregator"],
        secure_thumbnail: "https://www.mercadopago.com/org-img/MP3/API/logos/amex.gif",
        ...
        }]}    
    """
    def methods() do
        Mercadopago.API.get("/v1/payment_methods")
    end

    @doc """
    Search in payments
    [docs](https://www.mercadopago.com.br/developers/pt/reference/payments/_payments_search/get)    

    ## Examples

        iex> Mercadopago.Requests.Payments.search()
        {:ok, [%{
        date_created: "2023-02-10T19:45:48.000-04:00",
        sponsor_id: nil,
        money_release_status: "released",
        status: "approved",
        date_last_updated: "2023-02-10T19:47:23.000-04:00",
        merchant_number: nil,
        acquirer_reconciliation: [],
        brand_id: nil,
        captured: true,
        order: %{},
        authorization_code: nil,
        date_of_expiration: nil,
        ...
        }]}    
    """
    def search() do
        Mercadopago.API.get("/v1/payments/search")
    end

    @doc """
    Get paid
    [docs](https://www.mercadopago.com.br/developers/pt/reference/payments/_payments_id/get)    

    ## Examples

        iex> Mercadopago.Requests.Payments.show("123456789")
        {:ok, %{
        date_created: "2023-02-10T19:45:48.000-04:00",
        sponsor_id: nil,
        money_release_status: "released",
        status: "approved",
        date_last_updated: "2023-02-10T19:47:23.000-04:00",
        merchant_number: nil,
        acquirer_reconciliation: [],
        brand_id: nil,
        captured: true,
        order: %{},
        authorization_code: nil,
        date_of_expiration: nil,
        ...
        }}    
    """
    def show(payment_id) do
        Mercadopago.API.get("/v1/payments/#{payment_id}")
    end

    @doc """
    Create payment
    [docs](https://www.mercadopago.com.br/developers/pt/reference/payments/_payments/post)    

    ## Examples
        iex> data =
        %{
          "additional_info": %{
            "items": [
              %{
                "id": "MLB2907679857",
                "title": "Point Mini",
                "description": "Producto Point para cobros con tarjetas mediante bluetooth",
                "picture_url": "https://http2.mlstatic.com/resources/frontend/statics/growth-sellers-landings/device-mlb-point-i_medium@2x.png",
                "category_id": "electronics",
                "quantity": 1,
                "unit_price": 58.8
              }
            ],
            "payer": %{
              "first_name": "Test",
              "last_name": "Test",
              "phone": %{
                "area_code": 11,
                "number": "987654321"
              },
              "address": %{}
            },
            "shipments": %{
              "receiver_address": %{
                "zip_code": "12312-123",
                "state_name": "Rio de Janeiro",
                "city_name": "Buzios",
                "street_name": "Av das Nacoes Unidas",
                "street_number": 3003
              }
            },
            "barcode": %{}
          },
          "description": "Payment for product",
          "external_reference": "MP0001",
          "installments": 1,
          "metadata": %{},
          "payer": %{
            "entity_type": "individual",
            "type": "customer",
            "identification": %{}
          },
          "payment_method_id": "visa",
          "transaction_amount": 58.8
        }         
        iex> Mercadopago.Requests.Payments.show(data)

    """
    def create(data) do
        data =
        %{
          additional_info: %{
            payer: %{
              first_name: "Test",
              last_name: "Test",
              phone: %{
                area_code: 11,
                number: "987654321"
              },
            },
            shipments: %{
              receiver_address: %{
                zip_code: "12312-123",
                state_name: "Rio de Janeiro",
                city_name: "Buzios",
                street_name: "Av das Nacoes Unidas",
                street_number: 3003
              }
            }
          },
          description: "Celular Xiaomi Redmi Note 11S 128gb 6gb Ram Versão Global Original azul",
          external_reference: "MP0001",
          installments: 1,
          payer: %{
            entity_type: "individual",
            type: "customer",
            identification: %{}
          },
          payment_method_id: "pix",
          transaction_amount: 58
        }  

        Mercadopago.API.post("/v1/payments", data)
    end

end