--[[
DO NOT EDIT
This file is autogenerated from gen_lib.lua
To regenerate this file, run `nvim -l gen_lib.lua`
--]]

local ffi=require"ffi"
ffi.cdef[=[
enum {_SYS_IOCTL_H=1};
struct winsize
  {
    unsigned short int ws_row;
    unsigned short int ws_col;
    unsigned short int ws_xpixel;
    unsigned short int ws_ypixel;
  };
struct termio
  {
    unsigned short int c_iflag;
    unsigned short int c_oflag;
    unsigned short int c_cflag;
    unsigned short int c_lflag;
    unsigned char c_line;
    unsigned char c_cc[8];
};
extern int ioctl (int __fd, unsigned long int __request, ...) 
                                                             __attribute__ ((__nothrow__ , __leaf__))
                                                                    ;
enum {TCGETS=21505};
enum {TCSETS=21506};
enum {TCSETSW=21507};
enum {TCSETSF=21508};
enum {TCGETA=21509};
enum {TCSETA=21510};
enum {TCSETAW=21511};
enum {TCSETAF=21512};
enum {TCSBRK=21513};
enum {TCXONC=21514};
enum {TCFLSH=21515};
enum {TIOCEXCL=21516};
enum {TIOCNXCL=21517};
enum {TIOCSCTTY=21518};
enum {TIOCGPGRP=21519};
enum {TIOCSPGRP=21520};
enum {TIOCOUTQ=21521};
enum {TIOCSTI=21522};
enum {TIOCGWINSZ=21523};
enum {TIOCSWINSZ=21524};
enum {TIOCMGET=21525};
enum {TIOCMBIS=21526};
enum {TIOCMBIC=21527};
enum {TIOCMSET=21528};
enum {TIOCGSOFTCAR=21529};
enum {TIOCSSOFTCAR=21530};
enum {FIONREAD=21531};
enum {TIOCLINUX=21532};
enum {TIOCCONS=21533};
enum {TIOCGSERIAL=21534};
enum {TIOCSSERIAL=21535};
enum {TIOCPKT=21536};
enum {FIONBIO=21537};
enum {TIOCNOTTY=21538};
enum {TIOCSETD=21539};
enum {TIOCGETD=21540};
enum {TCSBRKP=21541};
enum {TIOCSBRK=21543};
enum {TIOCCBRK=21544};
enum {TIOCGSID=21545};
enum {TIOCGRS485=21550};
enum {TIOCSRS485=21551};
enum {TCGETX=21554};
enum {TCSETX=21555};
enum {TCSETXF=21556};
enum {TCSETXW=21557};
enum {TIOCVHANGUP=21559};
enum {FIONCLEX=21584};
enum {FIOCLEX=21585};
enum {FIOASYNC=21586};
enum {TIOCSERCONFIG=21587};
enum {TIOCSERGWILD=21588};
enum {TIOCSERSWILD=21589};
enum {TIOCGLCKTRMIOS=21590};
enum {TIOCSLCKTRMIOS=21591};
enum {TIOCSERGSTRUCT=21592};
enum {TIOCSERGETLSR=21593};
enum {TIOCSERGETMULTI=21594};
enum {TIOCSERSETMULTI=21595};
enum {TIOCMIWAIT=21596};
enum {TIOCGICOUNT=21597};
enum {TIOCPKT_DATA=0};
enum {TIOCPKT_FLUSHREAD=1};
enum {TIOCPKT_FLUSHWRITE=2};
enum {TIOCPKT_STOP=4};
enum {TIOCPKT_START=8};
enum {TIOCPKT_NOSTOP=16};
enum {TIOCPKT_DOSTOP=32};
enum {TIOCPKT_IOCTL=64};
enum {TIOCSER_TEMT=1};
]=]
return ffi.load"c" --[[@as table]]