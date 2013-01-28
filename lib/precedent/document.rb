# encoding: utf-8
# Autogenerated from a Treetop grammar. Edits may be lost.


require File.dirname(__FILE__) + '/paragraph'
require File.dirname(__FILE__) + '/heading'
require File.dirname(__FILE__) + '/meta'

module Precedent
  module Document
    include Treetop::Runtime

    def root
      @root ||= :root
    end

    include Paragraph

    include Heading

    include Meta

    def _nt_root
      start_index = index
      if node_cache[:root].has_key?(index)
        cached = node_cache[:root][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        r1 = _nt_block
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
      end

      node_cache[:root][start_index] = r0

      r0
    end

    module Block0
      def content
        elements[0]
      end

      def block_end
        elements[1]
      end
    end

    def _nt_block
      start_index = index
      if node_cache[:block].has_key?(index)
        cached = node_cache[:block][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      i1 = index
      r2 = _nt_comment
      if r2
        r1 = r2
      else
        r3 = _nt_meta
        if r3
          r1 = r3
        else
          r4 = _nt_paragraph
          if r4
            r1 = r4
          else
            r5 = _nt_heading
            if r5
              r1 = r5
            else
              @index = i1
              r1 = nil
            end
          end
        end
      end
      s0 << r1
      if r1
        r6 = _nt_block_end
        s0 << r6
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Block0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:block][start_index] = r0

      r0
    end

    def _nt_block_end
      start_index = index
      if node_cache[:block_end].has_key?(index)
        cached = node_cache[:block_end][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_blank_lines
      if r1
        r0 = r1
      else
        r2 = _nt_eof
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:block_end][start_index] = r0

      r0
    end

    module Comment0
      def content
        elements[1]
      end
    end

    module Comment1
      def build
        { :type => :comment, :content => content.text_value }
      end
    end

    def _nt_comment
      start_index = index
      if node_cache[:comment].has_key?(index)
        cached = node_cache[:comment][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("%", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("%")
        r1 = nil
      end
      s0 << r1
      if r1
        s2, i2 = [], index
        loop do
          if has_terminal?('\G[^\\n]', true, index)
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
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Comment0)
        r0.extend(Comment1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:comment][start_index] = r0

      r0
    end

    module BlankLines0
    end

    def _nt_blank_lines
      start_index = index
      if node_cache[:blank_lines].has_key?(index)
        cached = node_cache[:blank_lines][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      s1, i1 = [], index
      loop do
        if has_terminal?(' ', false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(' ')
          r2 = nil
        end
        if r2
          s1 << r2
        else
          break
        end
      end
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      s0 << r1
      if r1
        s3, i3 = [], index
        loop do
          if has_terminal?("\n", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("\n")
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
        s0 << r3
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(BlankLines0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:blank_lines][start_index] = r0

      r0
    end

    def _nt_eof
      start_index = index
      if node_cache[:eof].has_key?(index)
        cached = node_cache[:eof][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      if index < input_length
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("any character")
        r1 = nil
      end
      if r1
        r0 = nil
      else
        @index = i0
        r0 = instantiate_node(SyntaxNode,input, index...index)
      end

      node_cache[:eof][start_index] = r0

      r0
    end

  end

  class DocumentParser < Treetop::Runtime::CompiledParser
    include Document
  end

end
