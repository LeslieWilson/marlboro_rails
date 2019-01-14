contact_attributes = [
  { first_name: 'Eric', last_name: 'Kelly', phone_number: '1234567890' },
  { first_name: 'Adam', last_name: 'Sheehan', phone_number: '1234567890' },
  { first_name: 'Dan', last_name: 'Pickett', phone_number: '1234567890' },
  { first_name: 'Evan', last_name: 'Charles', phone_number: '1234567890' },
  { first_name: 'Faizaan', last_name: 'Shamsi', phone_number: '1234567890' },
  { first_name: 'Helen', last_name: 'Hood', phone_number: '1234567890' },
  { first_name: 'Corinne', last_name: 'Babel', phone_number: '1234567890' }
]

contact_attributes.each do |attributes|
  contact = Contact.create(attributes)
end
