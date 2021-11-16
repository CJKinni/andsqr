# frozen_string_literal: true

class Hash
  def andsqr(args = [])
    return nil unless self

    r = self
    args.each_with_index do |a, _i|
      return nil if r[a].nil? || (r.class != Hash && r.class != Array)

      r = a.instance_of?(Range) ? a.map { |i| r[i] } : r[a]
    end
    r
  end
end

class Array
  def andsqr(args = [])
    return nil unless self

    r = self
    args.each_with_index do |a, _i|
      return nil if r[a].nil? || (r.class != Hash && r.class != Array)

      r = a.instance_of?(Range) ? a.map { |i| r[i] } : r[a]
    end
    r
  end
end
