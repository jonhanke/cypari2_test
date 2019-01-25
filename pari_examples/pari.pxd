## Declare the PARI header files that we're using in pari.pyx
cdef extern from "pari.h":
    ctypedef long *GEN
    ctypedef unsigned long ulong
    cdef GEN gp_read_str(const char *t)
    cdef GEN qfisom(GEN G, GEN H, GEN fl, GEN grp)
    cdef GEN qfrep0(GEN a, GEN borne, long flag)
    cdef void pari_init(size_t pari_size, ulong maxprime)
    cdef void pari_printf(const char *fmt, ...) 
    cdef void pari_flush()




