def parse_invoices(invoice_data)
  pattern = /^(\d{4}-[0-1][0-9]-[0-3][0-9]) - ([a-zA-Z0-9]*) - ([\s\w]*) - $([\d]*)$/m
  invoice_data.scan(pattern)

  invoice_data = invoice_data.split("\n")
  split_invoice = []
  invoice_data.each do |arr|
    items = arr.split(" - ")
    split_invoice.append(items)
  end

  split_invoice
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries).each do |row|
  puts "Date: #{row[0]}, Invoice Number: #{row[1]}, Client: #{row[2]}, Amount: #{row[3]}"
end
