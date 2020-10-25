defmodule FirstServer do
  use GenServer

  # API
  def start(initial_state) do
    GenServer.start(__MODULE__, initial_state, name: __MODULE__)
  end

  def get_state() do
    GenServer.call(__MODULE__, :get_state)
  end

  def set_state(new_state) do
    GenServer.cast(__MODULE__, {:set_state, new_state})
  end

  # Callback functions
  def init(state) do
    IO.puts("Starting First Server...")
    {:ok, state}
  end

  def handle_call(:get_state, _, state) do
    {:reply, state, state}
  end

  def handle_cast({:set_state, new_state}, _state) do
    {:noreply, new_state}
  end
end
