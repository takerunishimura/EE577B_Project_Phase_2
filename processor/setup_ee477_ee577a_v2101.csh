#!/bin/tcsh
# #########################################################
# EDA Tools Configurations for Viterbi Server
#    hostnames: viterbi-scf1.usc.edu
#               viterbi-scf2.usc.edu
# Created by: 
#     Soowang Park
#     Tools TA of the Electrical and Computer Engineering Department
# Edited (for new versions) by:
#     Chong Fatt Law
#     Mustafa Altay Karamuftuoglu
# Last modified date: 03/12/2024
# #########################################################

# handy commands by Soowang
alias prepend 'if (-d \!:2) if ("$\!:1" \!~ *"\!:2"*) setenv \!:1 "\!:2":${\!:1}'
alias extend  'if (-d \!:2) if ("$\!:1" \!~ *"\!:2"*) setenv \!:1 ${\!:1}:\!:2'


# #########################################################
# License Setup
# #########################################################
setenv LM_LICENSE_FILE 1720@ics-lic2.usc.edu:1721@lic-cadence.usc.edu


# #########################################################
# Cadence Tools
# #########################################################
setenv SPECTRE_DEFAULTS -E
setenv CDS_Netlisting_Mode "Analog"
setenv CDS_AUTO_64BIT ALL

setenv CDSBASE /usr/local/cadence/

# setenv CDS_INST_DIR $CDSBASE/IC617    # used later in cds.lib
# setenv IC_HOME $CDSBASE/IC617         # Virtuoso
# setenv PVS_HOME $CDSBASE/PVS161       # PVS

setenv CDS_INST_DIR $CDSBASE/ICADVM201
setenv IC_HOME $CDSBASE/ICADVM201
setenv PEGASUS_HOME $CDSBASE/PEGASUS222

setenv QRC_HOME $CDSBASE/QUANTUS221


# setenv QRC_HOME $CDSBASE/EXT152       # EXT (only works on 32-bit)
setenv INC_HOME $CDSBASE/INCISIVE152  # Incisive
setenv INV_HOME $CDSBASE/INNOVUS162   # Innovus
setenv MMS_HOME $CDSBASE/MMSIM151     # MMSIM
setenv CFM_HOME $CDSBASE/CONFRML161   # Conformal
setenv ASR_HOME $CDSBASE/ASSURA41     # ASSURA


# OA path
setenv OA_HOME $CDS_INST_DIR/share/oa
# setenv OA_HOME $CDS_INST_DIR/oa_v22.50.049 # for IC617
# setenv OA_HOME $INV_HOME/oa_v22.50.051 # for Innovus

# prepend PATH for binaries
prepend PATH $IC_HOME/bin
prepend PATH $IC_HOME/tools/bin
prepend PATH $IC_HOME/tools/dfII/bin
# prepend PATH $PVS_HOME/bin
#prepend PATH $QRC_HOME/bin
prepend PATH $INC_HOME/tools/bin
prepend PATH $INV_HOME/tools/bin
prepend PATH $MMS_HOME/tools/bin
prepend PATH $CFM_HOME/tools.lnx86/bin
prepend PATH $ASR_HOME/tools/bin
prepend PATH $ASR_HOME/tools/assura/bin
# prepend PATH $ASR_HOME/tools.lnx86/bin
# prepend PATH $ASR_HOME/tools.lnx86/assura/bin
# prepend PATH $PVS_HOME/tools/bin/
# prepend PATH $PVS_HOME/tools/bin/ckout_test

prepend PATH $PEGASUS_HOME/tools/bin
prepend PATH $QRC_HOME/bin


# EE577B NCSU FreePDK45 for Digital Design
#setenv CDK_DIR  ~ee577/design_pdk/ncsu-cdk-1.6.0.beta


# #########################################################
# Synopsys Tools
# #########################################################
setenv SYNBASE /usr/local/synopsys/

setenv SYNOPSYS_HS      $SYNBASE/HSPICE/default/hspice
setenv SYNOPSYS_DC      $SYNBASE/Design_Compiler/default	
setenv SYNOPSYS_CC      $SYNBASE/customcompiler/P-2019.06-SP1-5
setenv SYNOPSYS_PT      $SYNBASE/PrimeTime/default
setenv SYNOPSYS_CS      $SYNBASE/CosmosScope/default
setenv SYNOPSYS_WV      $SYNBASE/Custom_Waveview/default
setenv SYNOPSYS_TM      $SYNBASE/TetraMAX/default/TetraMAX_Standalone
setenv VCS_HOME         $SYNBASE/VCS_2016/L-2016.06-1
setenv SYNOPSYS_STS     $SYNBASE/TCAD_Sentaurus/default
setenv enableDivaInAdvancedNode true

prepend PATH $SYNOPSYS_HS/bin
prepend PATH $SYNOPSYS_DC/bin
prepend PATH $SYNOPSYS_CC/bin
prepend PATH $SYNOPSYS_PT/bin
prepend PATH $SYNOPSYS_CS/bin
prepend PATH $SYNOPSYS_WV/bin
prepend PATH $SYNOPSYS_TM/bin
prepend PATH $VCS_HOME/bin
prepend PATH $SYNOPSYS_STS/bin

# alias
alias cscope $SYNOPSYS_CS/ai_bin/cscope
alias scope  $SYNOPSYS_CS/ai_bin/scope
alias vcs "$VCS_HOME/bin/vcs -full64" # VCS 64-bit mode
alias dve "$VCS_HOME/bin/dve -full64" # VCS GUI Mode 


# #########################################################
# Mentor Graphics Tools
# #########################################################
# Questa CDC/Formal
#setenv MENTOR_QCF      /usr/local/questa_formal/linux_x86_64
#prepend PATH $MENTOR_QCF/bin

