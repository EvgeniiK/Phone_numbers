class CreatePhoneNumberService
  MIN_NUMBER = 111_111_1111
  MAX_NUMBER = 999_999_9999

  attr_reader :result, :error_message

  def initialize(number: nil)
    @number = number
  end

  def perform
    @result = @number ? custom : incremental
    self
  end

  def success?
    result.present?
  end

  private

  def incremental(phone_number: nil)
    n = phone_number || PhoneNumber.where(custom: false).last&.number
    return if max?(n)
    pn = PhoneNumber.new(number: n ? n + 1 : MIN_NUMBER )
    pn.save ? pn.number : incremental(phone_number: n + 1)
  end

  def custom
    pn = PhoneNumber.new(number: @number.to_i, custom: true)
    pn.save ? pn.number : incremental
  end

  def max?(n)
    if n == MAX_NUMBER
      @error_message = 'out of range'
      true
    else
      false
    end
  end
end