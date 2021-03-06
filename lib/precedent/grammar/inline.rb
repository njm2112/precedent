# encoding: UTF-8
# Autogenerated from a Treetop grammar. Edits may be lost.



module Precedent
  module Inline
    include Treetop::Runtime

    def root
      @root ||= :inline
    end

    module Inline0
      def inline_element
        elements[1]
      end
    end

    module Inline1
      def first
        elements[0]
      end

      def subsequent
        elements[1]
      end
    end

    module Inline2
      def build
        elems = subsequent.elements.map(&:build).flatten
        # Members of `subsequent` come in [nil, Node] lists when there
        # is no preceding line break. The car values can't be ignored,
        # as we need to convert newlines to spaces when they occur.
        ret = elems.reduce([first.build]) do |mem, e|
          last = mem.last
          # Start the output list with the first element
          if e.nil?
            mem
          # Concatenate contiguous strings
          elsif last.is_a?(String) && e.is_a?(String)
            mem + [mem.pop + e]
          else # Hash
            mem + [e]
          end
        end
        # If there is just one content element, give the element
        # rather than a one-element list.
        ret.count == 1 ? ret.first : ret
      end
    end

    def _nt_inline
      start_index = index
      if node_cache[:inline].has_key?(index)
        cached = node_cache[:inline][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_inline_element
      s0 << r1
      if r1
        s2, i2 = [], index
        loop do
          i3, s3 = index, []
          r5 = _nt_single_newline
          if r5
            r4 = r5
          else
            r4 = instantiate_node(SyntaxNode,input, index...index)
          end
          s3 << r4
          if r4
            r6 = _nt_inline_element
            s3 << r6
          end
          if s3.last
            r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
            r3.extend(Inline0)
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
        r0.extend(Inline1)
        r0.extend(Inline2)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:inline][start_index] = r0

      r0
    end

    def _nt_inline_element
      start_index = index
      if node_cache[:inline_element].has_key?(index)
        cached = node_cache[:inline_element][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_citation
      if r1
        r0 = r1
      else
        r2 = _nt_emphasis
        if r2
          r0 = r2
        else
          r3 = _nt_smallcaps
          if r3
            r0 = r3
          else
            r4 = _nt_reference
            if r4
              r0 = r4
            else
              r5 = _nt_page_break
              if r5
                r0 = r5
              else
                r6 = _nt_space
                if r6
                  r0 = r6
                else
                  r7 = _nt_word
                  if r7
                    r0 = r7
                  else
                    @index = i0
                    r0 = nil
                  end
                end
              end
            end
          end
        end
      end

      node_cache[:inline_element][start_index] = r0

      r0
    end

    module Smallcaps0
      def content
        elements[1]
      end

    end

    module Smallcaps1
      def build
        { :type => :smallcaps,
          :content => content.build }
      end
    end

    def _nt_smallcaps
      start_index = index
      if node_cache[:smallcaps].has_key?(index)
        cached = node_cache[:smallcaps][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?('<<', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('<<')
        r1 = nil
      end
      s0 << r1
      if r1
        r2 = _nt_inline
        s0 << r2
        if r2
          if has_terminal?('>>', false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('>>')
            r3 = nil
          end
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Smallcaps0)
        r0.extend(Smallcaps1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:smallcaps][start_index] = r0

      r0
    end

    module Emphasis0
      def content
        elements[1]
      end

    end

    module Emphasis1
      def build
        { :type => :emphasis,
          :content => content.build }
      end
    end

    def _nt_emphasis
      start_index = index
      if node_cache[:emphasis].has_key?(index)
        cached = node_cache[:emphasis][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?('\\\\', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('\\\\')
        r1 = nil
      end
      s0 << r1
      if r1
        r2 = _nt_inline
        s0 << r2
        if r2
          if has_terminal?('\\\\', false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('\\\\')
            r3 = nil
          end
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Emphasis0)
        r0.extend(Emphasis1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:emphasis][start_index] = r0

      r0
    end

    module Citation0
      def content
        elements[1]
      end

    end

    module Citation1
      def build
        { :type => :citation,
          :content => content.build }
      end
    end

    def _nt_citation
      start_index = index
      if node_cache[:citation].has_key?(index)
        cached = node_cache[:citation][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?('{{', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('{{')
        r1 = nil
      end
      s0 << r1
      if r1
        r2 = _nt_inline
        s0 << r2
        if r2
          if has_terminal?('}}', false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('}}')
            r3 = nil
          end
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Citation0)
        r0.extend(Citation1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:citation][start_index] = r0

      r0
    end

    module PageBreak0
      def page
        elements[1]
      end

    end

    module PageBreak1
      def build
        { :type => :break,
          :page => page.text_value.to_i }
      end
    end

    def _nt_page_break
      start_index = index
      if node_cache[:page_break].has_key?(index)
        cached = node_cache[:page_break][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?('@@', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('@@')
        r1 = nil
      end
      s0 << r1
      if r1
        s2, i2 = [], index
        loop do
          if has_terminal?('\G[0-9]', true, index)
            r3 = true
            @index += 1
          else
            r3 = nil
          end
          if r3
            s2 << r3
          else
            break
          end
        end
        if s2.empty?
          @index = i2
          r2 = nil
        else
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        end
        s0 << r2
        if r2
          if has_terminal?('@@', false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('@@')
            r4 = nil
          end
          s0 << r4
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(PageBreak0)
        r0.extend(PageBreak1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:page_break][start_index] = r0

      r0
    end

    module Reference0
      def marker
        elements[1]
      end

    end

    module Reference1
      def build
        { :type => :reference,
          :marker => marker.text_value }
      end
    end

    def _nt_reference
      start_index = index
      if node_cache[:reference].has_key?(index)
        cached = node_cache[:reference][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?('[[', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('[[')
        r1 = nil
      end
      s0 << r1
      if r1
        s2, i2 = [], index
        loop do
          if has_terminal?('\G[0-9*†‡]', true, index)
            r3 = true
            @index += 1
          else
            r3 = nil
          end
          if r3
            s2 << r3
          else
            break
          end
        end
        if s2.empty?
          @index = i2
          r2 = nil
        else
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        end
        s0 << r2
        if r2
          if has_terminal?(']]', false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure(']]')
            r4 = nil
          end
          s0 << r4
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Reference0)
        r0.extend(Reference1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:reference][start_index] = r0

      r0
    end

    module SingleNewline0
      def build
        ' '
      end
    end

    def _nt_single_newline
      start_index = index
      if node_cache[:single_newline].has_key?(index)
        cached = node_cache[:single_newline][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("\n", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
        r0.extend(SingleNewline0)
        @index += 1
      else
        terminal_parse_failure("\n")
        r0 = nil
      end

      node_cache[:single_newline][start_index] = r0

      r0
    end

    module Word0
      def char
        elements[1]
      end
    end

    module Word1
      def build
        text_value
      end
    end

    def _nt_word
      start_index = index
      if node_cache[:word].has_key?(index)
        cached = node_cache[:word][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        i1, s1 = index, []
        i2 = index
        i3 = index
        if has_terminal?('{{', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure('{{')
          r4 = nil
        end
        if r4
          r3 = r4
        else
          if has_terminal?('}}', false, index)
            r5 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('}}')
            r5 = nil
          end
          if r5
            r3 = r5
          else
            if has_terminal?('<<', false, index)
              r6 = instantiate_node(SyntaxNode,input, index...(index + 2))
              @index += 2
            else
              terminal_parse_failure('<<')
              r6 = nil
            end
            if r6
              r3 = r6
            else
              if has_terminal?('>>', false, index)
                r7 = instantiate_node(SyntaxNode,input, index...(index + 2))
                @index += 2
              else
                terminal_parse_failure('>>')
                r7 = nil
              end
              if r7
                r3 = r7
              else
                if has_terminal?('[[', false, index)
                  r8 = instantiate_node(SyntaxNode,input, index...(index + 2))
                  @index += 2
                else
                  terminal_parse_failure('[[')
                  r8 = nil
                end
                if r8
                  r3 = r8
                else
                  if has_terminal?(']]', false, index)
                    r9 = instantiate_node(SyntaxNode,input, index...(index + 2))
                    @index += 2
                  else
                    terminal_parse_failure(']]')
                    r9 = nil
                  end
                  if r9
                    r3 = r9
                  else
                    if has_terminal?('\\\\', false, index)
                      r10 = instantiate_node(SyntaxNode,input, index...(index + 2))
                      @index += 2
                    else
                      terminal_parse_failure('\\\\')
                      r10 = nil
                    end
                    if r10
                      r3 = r10
                    else
                      if has_terminal?('@@', false, index)
                        r11 = instantiate_node(SyntaxNode,input, index...(index + 2))
                        @index += 2
                      else
                        terminal_parse_failure('@@')
                        r11 = nil
                      end
                      if r11
                        r3 = r11
                      else
                        @index = i3
                        r3 = nil
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if r3
          r2 = nil
        else
          @index = i2
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r2
        if r2
          r12 = _nt_char
          s1 << r12
        end
        if s1.last
          r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
          r1.extend(Word0)
        else
          @index = i1
          r1 = nil
        end
        if r1
          s0 << r1
        else
          break
        end
      end
      if s0.empty?
        @index = i0
        r0 = nil
      else
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Word1)
      end

      node_cache[:word][start_index] = r0

      r0
    end

    module Space0
      def build
        ' '
      end
    end

    def _nt_space
      start_index = index
      if node_cache[:space].has_key?(index)
        cached = node_cache[:space][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?(' ', false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
        r0.extend(Space0)
        @index += 1
      else
        terminal_parse_failure(' ')
        r0 = nil
      end

      node_cache[:space][start_index] = r0

      r0
    end

    def _nt_char
      start_index = index
      if node_cache[:char].has_key?(index)
        cached = node_cache[:char][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?('\G[\\S]', true, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r0 = nil
      end

      node_cache[:char][start_index] = r0

      r0
    end

  end

  class InlineParser < Treetop::Runtime::CompiledParser
    include Inline
  end

end
