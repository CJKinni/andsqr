class Hash
    def andsqr(args=[])
        if self
            r = self
            args.each do |a|
                return nil if r[a].nil?
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
            args.each do |a|
                return nil if r[a].nil?
                r = r[a]
            end
            r
        else
            nil
        end
    end
end