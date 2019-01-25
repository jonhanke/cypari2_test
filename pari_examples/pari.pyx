

## Python function using the C++ function calling the PARI library
def pari_test():
    """
    Returns the results of a few PARI routines.
    """
    print "Entering pari_test()"

    ## Initialize the PARI stack with 4MB and all primes up to 2.
    pari_init(4000000, 2)

    ## Create a PARI matrix
    PARI_MATRIX = gp_read_str("[1, 0; 0, 1]")

    ## Print the matrix
    pari_printf("%Pd\n", PARI_MATRIX)
    pari_flush()

    print "Leaving pari_test()"	




## Compute an isomorphism between two quadratic forms (if one exists)
def pari_qfrep0():
    """
    The qfrep0() routine from PARI.  This takes a square symmetric integer Gram matrix
    and returns the theta series. 
    """
    ## Initialize the PARI stack with 4MB and all primes up to 2.
    pari_init(4000000, 2)
    
    ## Call the PARI function qfrep0
    PARI_MATRIX = gp_read_str("[1, 0; 0, 1]")
    PARI_PRECISION = gp_read_str("20")
    ans_GEN = qfrep0(PARI_MATRIX, PARI_PRECISION, 0)

    ## Print the answer
    pari_printf("%Pd\n", ans_GEN)
    pari_flush()




## Compute an isomorphism between two quadratic forms (if one exists)
def pari_qfisom():
    """
    The qfisom() routine from PARI.  This takes two square symmetric integer matrices and either returns 
    False or a matrix that gives this automorphism.  
    """
    ## Initialize the PARI stack with 4MB and all primes up to 2.
    pari_init(4000000, 2)

    ## Call the PARI function qfisom
    PARI_MATRIX = gp_read_str("[1, 0; 0, 1]")
    ans_GEN = qfisom(PARI_MATRIX, PARI_MATRIX, NULL, NULL)

    ## Print the answer
    pari_printf("%Pd\n", ans_GEN)
    pari_flush()
