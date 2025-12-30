{
  config,
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      hop = {
        enable = true;
      };
    };
    keymaps = [
      {
        key = "f";
        # generates weird prompts for some reason
        # action.__raw = ''
        #   	function()
        #   	  require'hop'.hint_char1({
        #   		direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        #   		current_line_only = true
        #   	  })
        #   	end
        #     '';
        action = "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<CR>";
        options.remap = true;
      }
      {
        key = "F";
        # action.__raw = ''
        #   	function()
        #   	  require'hop'.hint_char1({
        #   		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        #   		current_line_only = true
        #   	  })
        #   	end
        #     '';
        action = "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>";
        options.remap = true;
      }
      {
        key = "t";
        # action.__raw = ''
        #   	function()
        #   	  require'hop'.hint_char1({
        #   		direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        #   		current_line_only = true,
        #   		hint_offset = -1
        #   	  })
        #   	end
        #     '';
        action = "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>";
        options.remap = true;
      }
      {
        key = "T";
        # action.__raw = ''
        #   	function()
        #   	  require'hop'.hint_char1({
        #   		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        #   		current_line_only = true,
        #   		hint_offset = 1
        #   	  })
        #   	end
        #     '';
        action = "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })<CR>";
        options.remap = true;
      }

      #hop camel case
      {
        key = "<space><space>";
        action = "<cmd>HopCamelCaseMW<cr>";
      }
      {
        key = "<space>n<space>";
        action = "<cmd>HopCamelCaseAC<cr>";
      }
      {
        key = "<space>f<space>";
        action = "<cmd>HopCamelCaseAC<cr>";
      }
      {
        key = "<space>b<space>";
        action = "<cmd>HopCamelCaseBC<cr>";
      }
      {
        key = "<space>lf<space>";
        action = "<cmd>HopCamelCaseCurrentLineAC<cr>";
      }
      {
        key = "<space>lb<space>";
        action = "<cmd>HopCamelCaseCurrentLineBC<cr>";
      }
      {
        key = "<space>l<space>";
        action = "<cmd>HopCamelCaseCurrentLine<cr>";
      }

      #hop yank
      {
        key = "<space>y";
        action.__raw = ''
          	function()
          	  require'hop-yank'.yank_char1({
          	  })
          	end
            '';
      }
      {
        key = "<space>fy";
        action.__raw = ''
          	function()
          	  require'hop-yank'.yank_char1({
          		direction = require'hop.hint'.hintdirection.after_cursor
          	  })
          	end
            '';
      }
      {
        key = "<space>by";
        action.__raw = ''
          	function()
          	  require'hop-yank'.yank_char1({
          		direction = require'hop.hint'.hintdirection.before_cursor
          	  })
          	end
            '';
      }
      {
        key = "<space>lfy";
        action.__raw = ''
          	function()
          	  require'hop-yank'.yank_char1({
          		direction = require'hop.hint'.hintdirection.after_cursor,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lby";
        action.__raw = ''
          	function()
          	  require'hop-yank'.yank_char1({
          		direction = require'hop.hint'.hintdirection.before_cursor,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>ly";
        action.__raw = ''
          	function()
          	  require'hop-yank'.yank_char1({
          		current_line_only = true
          	  })
          	end
            '';
      }

      #hop paste
      {
        key = "<space>p";
        action.__raw = ''
          	function()
          	  require'hop-yank'.paste_char1({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>np";
        action.__raw = ''
          	function()
          	  require'hop-yank'.paste_char1({
          	  })
          	end
            '';
      }
      {
        key = "<space>fp";
        action.__raw = ''
          	function()
          	  require'hop-yank'.paste_char1({
          		direction = require'hop.hint'.hintdirection.after_cursor
          	  })
          	end
            '';
      }
      {
        key = "<space>bp";
        action.__raw = ''
          	function()
          	  require'hop-yank'.paste_char1({
          		direction = require'hop.hint'.hintdirection.before_cursor
          	  })
          	end
            '';
      }
      {
        key = "<space>lfp";
        action.__raw = ''
          	function()
          	  require'hop-yank'.paste_char1({
          		direction = require'hop.hint'.hintdirection.after_cursor,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lbp";
        action.__raw = ''
          	function()
          	  require'hop-yank'.paste_char1({
          		direction = require'hop.hint'.hintdirection.before_cursor,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lp";
        action.__raw = ''
          	function()
          	  require'hop-yank'.paste_char1({
          		current_line_only = true
          	  })
          	end
            '';
      }

      #hop anywhere
      {
        key = "<space>a";
        action.__raw = ''
          	function()
          	  require'hop'.hint_anywhere({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>na";
        action.__raw = ''
          	function()
          	  require'hop'.hint_anywhere({
          	  })
          	end
            '';
      }
      {
        key = "<space>fa";
        action.__raw = ''
          	function()
          	  require'hop'.hint_anywhere({
          		direction = require'hop.hint'.hintdirection.after_cursor
          	  })
          	end
            '';
      }
      {
        key = "<space>ba";
        action.__raw = ''
          	function()
          	  require'hop'.hint_anywhere({
          		direction = require'hop.hint'.hintdirection.before_cursor
          	  })
          	end
            '';
      }
      {
        key = "<space>lfa";
        action.__raw = ''
          	function()
          	  require'hop'.hint_anywhere({
          		direction = require'hop.hint'.hintdirection.after_cursor,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lba";
        action.__raw = ''
          	function()
          	  require'hop'.hint_anywhere({
          		direction = require'hop.hint'.hintdirection.before_cursor,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>la";
        action.__raw = ''
          	function()
          	  require'hop'.hint_anywhere({
          		current_line_only = true
          	  })
          	end
            '';
      }

      #hop word
      {
        key = "<space>w";
        action.__raw = ''
          	function()
          	  require'hop'.hint_words({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>nw";
        action.__raw = ''
          	function()
          	  require'hop'.hint_words({
          	  })
          	end
            '';
      }
      {
        key = "<space>fw";
        action.__raw = ''
          	function()
          	  require'hop'.hint_words({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>bw";
        action.__raw = ''
          	function()
          	  require'hop'.hint_words({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>lfw";
        action.__raw = ''
          	function()
          	  require'hop'.hint_words({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lbw";
        action.__raw = ''
          	function()
          	  require'hop'.hint_words({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lw";
        action.__raw = ''
          	function()
          	  require'hop'.hint_words({
          		current_line_only = true
          	  })
          	end
            '';
      }

      #hop line
      {
        key = "<space>g";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>ng";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines({
          	  })
          	end
            '';
      }
      {
        key = "<space>fg";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>bg";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines({

          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>lfg";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lbg";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lg";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines({
          		current_line_only = true
          	  })
          	end
            '';
      }

      #hop line start
      {
        key = "<space>h";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines_skip_whitespace({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>nh";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines_skip_whitespace({
          	  })
          	end
            '';
      }
      {
        key = "<space>fh";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines_skip_whitespace({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>bh";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines_skip_whitespace({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>lfh";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines_skip_whitespace({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lbh";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines_skip_whitespace({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lh";
        action.__raw = ''
          	function()
          	  require'hop'.hint_lines_skip_whitespace({
          		current_line_only = true
          	  })
          	end
            '';
      }

      #hop vertical
      {
        key = "<space>v";
        action.__raw = ''
          	function()
          	  require'hop'.hint_vertical({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>nv";
        action.__raw = ''
          	function()
          	  require'hop'.hint_vertical({
          	  })
          	end
            '';
      }
      {
        key = "<space>fv";
        action.__raw = ''
          	function()
          	  require'hop'.hint_vertical({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>bv";
        action.__raw = ''
          	function()
          	  require'hop'.hint_vertical({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>lfv";
        action.__raw = ''
          	function()
          	  require'hop'.hint_vertical({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lbv";
        action.__raw = ''
          	function()
          	  require'hop'.hint_vertical({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lv";
        action.__raw = ''
          	function()
          	  require'hop'.hint_vertical({
          		current_line_only = true
          	  })
          	end
            '';
      }

      #hop pattern
      {
        key = "<space>s";
        action.__raw = ''
          	function()
          	  require'hop'.hint_patterns({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>ns";
        action.__raw = ''
          	function()
          	  require'hop'.hint_patterns({
          	  })
          	end
            '';
      }
      {
        key = "<space>fs";
        action.__raw = ''
          	function()
          	  require'hop'.hint_patterns({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>bs";
        action.__raw = ''
          	function()
          	  require'hop'.hint_patterns({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>lfs";
        action.__raw = ''
          	function()
          	  require'hop'.hint_patterns({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>lbs";
        action.__raw = ''
          	function()
          	  require'hop'.hint_patterns({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
          		current_line_only = true
          	  })
          	end
            '';
      }
      {
        key = "<space>ls";
        action.__raw = ''
          	function()
          	  require'hop'.hint_patterns({
          		current_line_only = true
          	  })
          	end
            '';
      }

      #hop char1
      {
        key = "<space>j";
        action.__raw = ''
          	function()
          	  require'hop'.hint_char1({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>nj";
        action.__raw = ''
          	function()
          	  require'hop'.hint_char1({
          	  })
          	end
            '';
      }
      {
        key = "<space>fj";
        action.__raw = ''
          	function()
          	  require'hop'.hint_char1({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>bj";
        action.__raw = ''
          	function()
          	  require'hop'.hint_char1({
          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR
          	  })
          	end
            '';
      }

      #hop char2
      {
        key = "<space>r";
        action.__raw = ''
          	function()
          	  require'hop'.hint_char2({
          		multi_windows = true,
          	  })
          	end
            '';
      }
      {
        key = "<space>nr";
        action.__raw = ''
          	function()
          	  require'hop'.hint_char2({
          	  })
          	end
            '';
      }
      {
        key = "<space>fr";
        action.__raw = ''
          	function()
          	  require'hop'.hint_char2({
          		direction = require'hop.hint'.HintDirection.AFTER_CURSOR
          	  })
          	end
            '';
      }
      {
        key = "<space>br";
        action.__raw = ''
          	function()
          	  require'hop'.hint_char2({

          		direction = require'hop.hint'.HintDirection.BEFORE_CURSOR
          	  })
          	end
            '';
      }
    ];
  };
}
