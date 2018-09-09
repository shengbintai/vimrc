
 " YouCompleteMe
 set runtimepath+=~/.vim_runtime/my_plugins/YouCompleteMe
 let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
 let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
 let g:syntastic_ignore_files=[".*\.py$"]
 let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
 let g:ycm_complete_in_comments = 1
 let g:ycm_confirm_extra_conf = 0
 let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
 let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
 let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
 let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
 let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
 let g:ycm_global_ycm_extra_conf='~/.vim_runtime/my_plugins/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
 "let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_conf.py' 
 let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
 inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
 " nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
 let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项


"pt

set rnu
if has('mouse')
  set mouse=a
endif
" Enable clipboard from vim to global clipboard 
set clipboard=unnamedplus

" set cursorline 
" set cursorcolumn

set nu
set nowrap
map zl zL
map zh zH
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>eh :e! /home/peter/.vim_runtime/sources_non_forked/vim-snippets/snippets/verilog.snippets<cr>

:ab Zhushi /*********www.mdy-edu.com 明德扬科教 注释开始****************<Enter><Enter>**********www.mdy-edu.com 明德扬科教 注释结束****************/
:ab Shixu always  @(posedge clk or negedge rst_n)begin<Enter>if(rst_n==1'b0)begin<Enter>end<Enter>else begin<Enter>end<Enter>end<ESC>
:ab Zuhe always  @(*)begin<Enter>end<ESC>
:ab Canshu  /*********www.mdy-edu.com 明德扬科教 注释开始****************<Enter>参数定义，明德扬规范要求，verilog内的用到的数字，都使用参数表示。<Enter>参数信号全部大写<Enter>**********www.mdy-edu.com 明德扬科教 注释结束****************/
:ab Module module module_name#(parameter  DATA_W      =   8)(<Enter>input               clk    ,<Enter>input               rst_n  ,<Enter>output[DATA_W-1:0]  dout<Enter>);<Enter>reg                 signal1;<Enter><Enter>always@(*)begin<Enter>end<Enter><Enter>always@(posedge clk or negedge rst_n)begin<Enter>if(rst_n==1'b0)begin<Enter>end<Enter>else begin<Enter>end<Enter>end<Enter><Enter>endmodule<ESC>
:ab Head /************************************************************************************<Enter>本代码由明德扬工作室精心设计和制作。<Enter><Enter>我们希望通过规范、严谨的代码，使同学们接触到纯正的集成电路/FPGA代码。<Enter><Enter>明德扬工作室长期招募成员，可免费培训，欢迎集成电路/FPGA爱好者加入。<Enter><Enter>学习交流群：97925396<Enter><Enter>*************************************************************************************/
:ab Test `timescale 1 ns/1 ns  <Enter><Enter>module testbench_name(); <Enter><Enter><Enter>reg clk  ;<Enter>reg rst_n;<Enter><Enter><Enter>reg[3:0]  din0  ;<Enter>reg       din1  ;<Enter>  <Enter><Enter><Enter>wire      dout0;<Enter>wire[4:0] dout1;<Enter>  <Enter><Enter><Enter>parameter CYCLE    = 20;<Enter><Enter><Enter>parameter RST_TIME = 3 ;<Enter><Enter><Enter>module_name uut(<Enter>.clk          (clk     ), <Enter>.rst_n        (rst_n   ),<Enter>.din0         (din0    ),<Enter>.din1         (din1    ),<Enter>.dout0        (dout0   ),<Enter>.dout1        (dout1   )<Enter>  <Enter>);<Enter><Enter><Enter><Enter>initial begin<Enter>clk = 1;<Enter>forever<Enter>#(CYCLE/2)<Enter>clk=~clk;<Enter>end<Enter><Enter><Enter>initial begin<Enter>rst_n = 1;<Enter>#2;<Enter>rst_n = 0;<Enter>#(CYCLE*RST_TIME);<Enter>rst_n = 1;<Enter>end<Enter><Enter><Enter>initial begin<Enter>#1;<Enter><Enter>din0 = 0;<Enter>#(10*CYCLE);<Enter><Enter><Enter>end<Enter><Enter><Enter>initial begin<Enter>#1;<Enter>din1 = 0;<Enter>#(10*CYCLE);<Enter><Enter>end<Enter><Enter><Enter><Enter>endmodule<ESC>

:ab Ztj    <Enter>always@(posedge clk or negedge rst_n)begin<Enter>if(!rst_n)begin<Enter>state_c <= IDLE;<Enter>end<Enter>else begin<Enter>state_c <= state_n;<Enter>end<Enter>end<Enter><Enter>always@(*)begin<Enter>case(state_c)<Enter>IDLE:begin<Enter>if(idl2s1_start)begin<Enter>state_n = S1;<Enter>end<Enter>else begin<Enter>state_n = state_c;<Enter>end<Enter>end<Enter>S1:begin<Enter>if(s12s2_start)begin<Enter>state_n = S2;<Enter>end<Enter>else begin<Enter>state_n = state_c;<Enter>end<Enter>end<Enter>S2:begin<Enter>if(s22s3_start)begin<Enter>state_n = S3;<Enter>end<Enter>else begin<Enter>state_n = state_c;<Enter>end<Enter>end<Enter>default:begin<Enter>state_n = IDLE;<Enter>end<Enter>endcase<Enter>end<Enter>assign idl2s1_start  = state_c==IDLE && ;<Enter>assign s12s2_start = state_c==S1    && ;<Enter>assign s22s3_start  = state_c==S2    && ;<Enter><Enter>always  @(posedge clk or negedge rst_n)begin<Enter>if(!rst_n)begin<Enter>out1 <=1'b0;<Enter>end<Enter>else if(state_c==S1)begin<Enter>out1 <= 1'b1;<Enter>end<Enter>else begin<Enter>out1 <= 1'b0;<Enter>end<Enter>end<ESC>

:ab Jsq    always @(posedge clk or negedge rst_n)begin<Enter>if(!rst_n)begin<Enter>cnt <= 0;<Enter>end<Enter>else if(add_cnt)begin<Enter>if(end_cnt)<Enter>cnt <= 0;<Enter>else<Enter>cnt <= cnt + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt = ;       <Enter>assign end_cnt = add_cnt && cnt== ;<ESC>

:ab Jsq2 always @(posedge clk or negedge rst_n)begin<Enter>if(!rst_n)begin<Enter>cnt0 <= 0;<Enter>end<Enter>else if(add_cnt0)begin<Enter>if(end_cnt0)<Enter>cnt0 <= 0;<Enter>else<Enter>cnt0 <= cnt0 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt0 = ;<Enter>assign end_cnt0 = add_cnt0 && cnt0== ;<Enter><Enter>always @(posedge clk or negedge rst_n)begin <Enter>if(!rst_n)begin<Enter>cnt1 <= 0;<Enter>end<Enter>else if(add_cnt1)begin<Enter>if(end_cnt1)<Enter>cnt1 <= 0;<Enter>else<Enter>cnt1 <= cnt1 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt1 = end_cnt0;<Enter>assign end_cnt1 = add_cnt1 && cnt1== ;<Enter><ESC>


:ab Jsq3 always @(posedge clk or negedge rst_n)begin<Enter>if(!rst_n)begin<Enter>cnt0 <= 0;<Enter>end<Enter>else if(add_cnt0)begin<Enter>if(end_cnt0)<Enter>cnt0 <= 0;<Enter>else<Enter>cnt0 <= cnt0 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt0 = ;<Enter>assign end_cnt0 = add_cnt0 && cnt0== ;<Enter><Enter>always @(posedge clk or negedge rst_n)begin <Enter>if(!rst_n)begin<Enter>cnt1 <= 0;<Enter>end<Enter>else if(add_cnt1)begin<Enter>if(end_cnt1)<Enter>cnt1 <= 0;<Enter>else<Enter>cnt1 <= cnt1 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt1 = end_cnt0;<Enter>assign end_cnt1 = add_cnt1 && cnt1== ;<Enter><Enter>always @(posedge clk or negedge rst_n)begin<Enter>if(!rst_n)begin<Enter>cnt2 <= 0;<Enter>end<Enter>else if(add_cnt2)begin<Enter>if(end_cnt2)<Enter>cnt2 <= 0;<Enter>else<Enter>cnt2 <= cnt2 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt2 = end_cnt1;<Enter>assign end_cnt2 = add_cnt2 && cnt2== ;<Enter> <ESC>

:ab Shixu2 always  @(posedge clk or negedge rst_n)begin<Enter>if(rst_n==1'b0)begin<Enter>end<Enter>else if()begin<Enter>end<Enter>else if()begin<Enter>end<Enter>end<Enter><ESC>

:ab Shixu1 always  @(posedge clk or negedge rst_n)begin<Enter>if(rst_n==1'b0)begin<Enter>end<Enter>else if()begin<Enter>end<Enter>end<Enter><ESC>
:ab Shixu3 always  @(posedge clk or negedge rst_n)begin<Enter>if(rst_n==1'b0)begin<Enter>end<Enter>else if()begin<Enter>end<Enter>else if()begin<Enter>end<Enter>else if()begin<Enter>end<Enter>end<Enter><ESC>

:ab Zuhe2 always  @(*)begin<Enter>if()begin<Enter>end<Enter>else begin<Enter>end<Enter>end<Enter><ESC>

:ab Zuhe3 always  @(*)begin<Enter>if()begin<Enter>end<Enter>else if()begin<Enter>end<Enter>else begin<Enter>end<Enter>end<Enter><ESC>
:ab Zuhe4 always  @(*)begin<Enter>if()begin<Enter>end<Enter>else if()begin<Enter>end<Enter>else if()begin<Enter>end<Enter>else begin<Enter>end<Enter>end<Enter><ESC>
:ab Output32 output[   31: 0]         ;
:ab Output16 output[   15: 0]         ;
:ab Output8  output[    7: 0]         ;
:ab Output4  output[    3: 0]         ;
:ab Output3  output[    2: 0]         ;
:ab Output2  output[    1: 0]         ;
:ab Output1  output                   ;

:ab Input32 input [   31: 0]         ;
:ab Input16 input [   15: 0]         ;
:ab Input8  input [    7: 0]         ;
:ab Input4  input [    3: 0]         ;
:ab Input3  input [    2: 0]         ;
:ab Input2  input [    1: 0]         ;
:ab Input1  input                    ;

:ab Wire32 wire  [   31: 0]         ;
:ab Wire16 wire  [   15: 0]         ;
:ab Wire8  wire  [    7: 0]         ;
:ab Wire4  wire  [    3: 0]         ;
:ab Wire3  wire  [    2: 0]         ;
:ab Wire2  wire  [    1: 0]         ;
:ab Wire1  wire                     ;

:ab Wire32 wire  [   31: 0]         ;
:ab Wire16 wire  [   15: 0]         ;
:ab Wire8  wire  [    7: 0]         ;
:ab Wire4  wire  [    3: 0]         ;
:ab Wire3  wire  [    2: 0]         ;
:ab Wire2  wire  [    1: 0]         ;
:ab Wire1  wire                     ;

:ab Reg32 reg   [   31: 0]         ;
:ab Reg16 reg   [   15: 0]         ;
:ab Reg8  reg   [    7: 0]         ;
:ab Reg4  reg   [    3: 0]         ;
:ab Reg3  reg   [    2: 0]         ;
:ab Reg2  reg   [    1: 0]         ;
:ab Reg1  reg                      ;

:ab Initial initial begin<Enter>#1;<Enter>end<ESC>


