#!/bin/bash

# Create a new res_iterations folder (remove old one)
#touch res_iterations
#rm -rf res_iterations
#mkdir res_iterations


RUNCOMMAND="mpirun -np 1"
PROGRAM="unstructured_lgr_trac"

BRICK="--use_brick"
OUTPRES="--set_outpres"
LINSOLVER="--use_iterative_lin_solver"
TRILINOS="--use_trilinos"
NSSOLVER="--use_lsc"
FSOLVER="--use_amg_for_f --use_amg2v22_for_f"
PSOLVER="--use_amg_for_p"
VISCTERM="--use_stress_div"
RE="--re 500.0"

# Concatenate problem parameters
PROBPARAM="${BRICK} ${OUTPRES}"
PROBPARAM="${PROBPARAM} ${LINSOLVER} ${TRILINOS}"
PROBPARAM="${PROBPARAM} ${NSSOLVER} ${FSOLVER} ${PSOLVER}"
PROBPARAM="${PROBPARAM} ${VISCTERM} ${RE}"

# Stuff to help document solutions
SOLNLABEL="--doc_label fluid_soln"
DOCNUM="--doc_num 1"
TETGENLABEL="--tetgen_label tetgen_notaligned_short/fsi_bifurcation_fluid"
TETGENNUM="--tetgen_num 1"

# Concatenate the documentation parameters
DOCPARAM="${SOLNLABEL} ${DOCNUM} ${TETGENLABEL} ${TETGENNUM}"


# Time stepping parameters
DOUNSTEADY="--do_unsteady"
TSTART="--tstart 0.0"
TEND="--tend 1.0"
DT="--dt 0.025" 

# Concatenate the time stepping parameters
TIMEPARAM="${DOUNSTEADY} ${TSTART} ${TEND} ${DT}"

${RUNCOMMAND} ./${PROGRAM} ${PROBPARAM} ${DOCPARAM} ${TIMEPARAM}

#mpirun -np 1 ./unstructured_lgr_trac --use_brick --use_trilinos --use_iterative_lin_solver --use_lsc --use_amg_for_f --use_amg2v22_for_f --use_amg_for_p  --use_stress_div --re 500.0    --doc_label fluid_soln --tetgen_label tetgen_notaligned_short/fsi_bifurcation_fluid  --tetgen_num 2 --doc_num 2 --do_unsteady --tstart 0.0 --tend 1.0 --dt 0.025  


