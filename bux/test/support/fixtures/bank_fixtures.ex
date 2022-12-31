defmodule Bux.BankFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bux.Bank` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        balance: 42,
        description: "some description"
      })
      |> Bux.Bank.create_account()

    account
  end
end
