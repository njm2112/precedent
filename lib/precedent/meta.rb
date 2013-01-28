# encoding: utf-8
# Autogenerated from a Treetop grammar. Edits may be lost.


module Precedent
  module Meta
    include Treetop::Runtime

    def root
      @root ||= :meta
    end

    module Meta0
      def prop
        elements[1]
      end
    end

    module Meta1
      def first
        elements[0]
      end

      def more
        elements[1]
      end
    end

    module Meta2
      def build
        {
          :type => :meta,
          :content => more.elements.reduce(first.build) { |mem, e|
            mem.merge(e.prop.build)
          }
        }
      end
    end

    def _nt_meta
      start_index = index
      if node_cache[:meta].has_key?(index)
        cached = node_cache[:meta][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_property
      s0 << r1
      if r1
        s2, i2 = [], index
        loop do
          i3, s3 = index, []
          if has_terminal?("\n", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("\n")
            r4 = nil
          end
          s3 << r4
          if r4
            r5 = _nt_property
            s3 << r5
          end
          if s3.last
            r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
            r3.extend(Meta0)
          else
            @index = i3
            r3 = nil
          end
          if r3
            s2 << r3
          else
            break
          end
        end
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        s0 << r2
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Meta1)
        r0.extend(Meta2)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:meta][start_index] = r0

      r0
    end

    module Property0
    end

    module Property1
      def key
        elements[0]
      end

      def value
        elements[3]
      end
    end

    module Property2
      def build
        return { key.text_value.to_sym => interpreted_value }
      end

      def interpreted_value
        v = value.text_value.strip
        case v
        when /^\d+$/
          v.to_i
        when /^\d\d\d\d-\d\d-\d\d$/
          Date.parse(v)
        when /^true|yes$/i
          true
        when /^false|no$/i
          false
        else
          v
        end
      end
    end

    def _nt_property
      start_index = index
      if node_cache[:property].has_key?(index)
        cached = node_cache[:property][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      i1, s1 = index, []
      if has_terminal?('\G[A-Z]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      s1 << r2
      if r2
        s3, i3 = [], index
        loop do
          if has_terminal?('\G[a-zA-Z]', true, index)
            r4 = true
            @index += 1
          else
            r4 = nil
          end
          if r4
            s3 << r4
          else
            break
          end
        end
        if s3.empty?
          @index = i3
          r3 = nil
        else
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        end
        s1 << r3
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(Property0)
      else
        @index = i1
        r1 = nil
      end
      s0 << r1
      if r1
        if has_terminal?(':', false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(':')
          r5 = nil
        end
        s0 << r5
        if r5
          s6, i6 = [], index
          loop do
            if has_terminal?(' ', false, index)
              r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(' ')
              r7 = nil
            end
            if r7
              s6 << r7
            else
              break
            end
          end
          if s6.empty?
            @index = i6
            r6 = nil
          else
            r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          end
          s0 << r6
          if r6
            s8, i8 = [], index
            loop do
              if has_terminal?('\G[^\\n]', true, index)
                r9 = true
                @index += 1
              else
                r9 = nil
              end
              if r9
                s8 << r9
              else
                break
              end
            end
            if s8.empty?
              @index = i8
              r8 = nil
            else
              r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
            end
            s0 << r8
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Property1)
        r0.extend(Property2)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:property][start_index] = r0

      r0
    end

  end

  class MetaParser < Treetop::Runtime::CompiledParser
    include Meta
  end

end
