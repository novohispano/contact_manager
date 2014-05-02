module ContactsHelper
  def to_path(contact)
    contact.class.to_s.underscore.pluralize
  end
end
