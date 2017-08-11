class Hash
    def andsqr(args=[])
        if self
            r = self
            args.each_with_index do |a, i|
                return nil if r[a].nil? || (r.class != Hash && r.class != Array)
                r = r[a]
            end
            r
        else
            nil
        end
    end
end

class Array
    def andsqr(args=[])
        if self
            r = self
            args.each_with_index do |a, i|
                return nil if r[a].nil? || (r.class != Hash && r.class != Array)
                r = r[a]
            end
            r
        else
            nil
        end
    end
end