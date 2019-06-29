class Boleto
  attr_reader :value

  def initialize(value)
    @value = value
    @paid = false
  end

  def paid?
    @paid
  end

  def mark_as_paid!
    @paid = true
  end
end