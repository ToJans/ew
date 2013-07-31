defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn = conn.assign(:layout, 'main')
    conn.fetch(:params)
  end

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html"
  end

  post "/" do
    quotes = YahooFinance.get_historical_quotes(conn.params[:symbol],365) 
      |> Enum.reverse() 
      |> quotes_to_json()
    conn = conn.assign(:quotes,quotes)
    conn = conn.assign(:symbol,conn.params[:symbol])
    render conn,"views/chart.html"
  end

  defp quotes_to_json(quotes) do 
    Enum.map_join quotes,",\n",fn x-> 
      "['#{x.date}',#{x.low},#{x.open},#{x.close},#{x.high}]" 
    end
  end 
end
