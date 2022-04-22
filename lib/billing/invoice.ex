defmodule Billing.Invoice do
  defstruct [
    :id,
    :title,
    :number,
    :seller,
    :client,
    :issued_on,
    :payment_due_date,
    :articles,
    :total,
    :payment_information
  ]

  @type t :: %__MODULE__{
          id: pos_integer(),
          title: String.t(),
          number: String.t(),
          seller: Company.t(),
          client: Company.t(),
          issued_on: DateTime.t(),
          payment_due_date: DateTime.t(),
          articles: [Articles.t()],
          total: Total.t(),
          payment_information: PaymentInformation.t()
        }

  defmodule Company do
    defstruct [
      :name,
      :logo,
      :address,
      :zip_code,
      :city,
      :country,
      :registration_number,
      :vat_number
    ]

    @type t :: %__MODULE__{
            name: String.t(),
            logo: String.t(),
            address: String.t(),
            zip_code: String.t(),
            city: String.t(),
            country: String.t(),
            registration_number: String.t(),
            vat_number: String.t()
          }
  end

  defmodule Article do
    defstruct [:details, :qty, :unit_price, :vat, :total_excl_vat, :total]

    @type t :: %__MODULE__{
            details: String.t(),
            qty: integer(),
            unit_price: Money.t(),
            vat: Money.t(),
            total_excl_vat: Money.t(),
            total: Money.t()
          }
  end

  defmodule Total do
    defstruct [:total_excl_vat, :vat_amount, :total]

    @type t :: %__MODULE__{total_excl_vat: Money.t(), vat_amount: Money.t(), total: Money.t()}
  end

  defmodule PaymentInformation do
    defstruct [:bic, :iban, :reference]

    @type t :: %__MODULE__{bic: String.t(), iban: String.t(), reference: String.t()}
  end
end
