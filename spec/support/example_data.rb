# encoding: utf-8

def test_response(data)
  OpenStruct.new(body: data)
end

def example_loans_data
  data =  load_file('multiple_loans.json')
  JSON.parse data
end

def example_loan_data
  data = load_file('single_loan.json')
  JSON.parse data
end

def example_combined_single_loan_data
  data = load_file('single_combined_loan.json')
  JSON.parse data
end

def example_combined_loan_data
  data = load_file('multiple_combined_loans.json')
  JSON.parse data
end

def load_file(file)
  path = Pathname.new(File.dirname(__FILE__)).join(file)
  File.read(path)
end
