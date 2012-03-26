class Product < ActiveRecord::Base
  # include ActiveModel::AttributeMethods

  attribute_method_prefix 'add_'
  attribute_method_prefix 'reduce_'
  attribute_method_prefix 'move_'
  attribute_method_affix prefix: 'add_', suffix: '_by'

  def method_missing(method_id, *args, &block)
    attrs  = method_id.to_s.gsub('move_', '').split '_to_'
    write_attribute(attrs.first, read_attribute(attrs.first) - 1)
    write_attribute(attrs.last,  read_attribute(attrs.last)  + 1)
  end



  private

  def add_attribute(attr)
    new_count = read_attribute(attr) + 1
    send("#{attr}=", new_count)
  end

  def reduce_attribute(attr)
    new_count = read_attribute(attr) - 1
    new_count = 0 unless new_count > 0
    send("#{attr}=", new_count)
  end

  def add_attribute_by(attr, *args)
    new_count = read_attribute(attr) + args.sum
    send("#{attr}=", new_count)
  end



end
