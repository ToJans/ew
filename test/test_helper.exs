Dynamo.under_test(Ew.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Ew.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
