class Boleto
  attr_reader :description

  def initialize(value)
    @value = value
    @pay = false
  end

  def done?
    @done
  end

  def mark_as_pay!
    @done = true
  end
end