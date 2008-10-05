#! /bin/false

# We use prelinking on this site!
# We do not want address space randomization, because this
# contradicts the effect of prelinking.
sysctl -q -w kernel.randomize_va_space=0
