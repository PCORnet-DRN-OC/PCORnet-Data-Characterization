/*******************************************************************************
*  	 Name: 03_run_edc_prep.sas
*    Date: 2024/06/20
*    Study: PCORnet
*
*  Purpose: Prepare to run the Empirical Data Curation portion of Data Curation Query Package v6.14
* 
*   Inputs: 
*	   1) SAS datasets:   		/dmlocal/datasets created by the Potential Code Errors and Data Curation queries. 
*	   2) SAS programs:			/infolder/edc_prep.sas 

*  Outputs: 
*          1) Print informing the user if all required inputs are present or not

*
*  Requirements:  
*                1) Program run in SAS 9.3 or higher
*                2) Each site is required to create the following sub-directory 
*                   structure on its network/server. The subdirectories must 
*                   reside within an outer folder which contains the query name 
*                  (e.g. PROD_P02_DQA_FDPRO_DCQ_NSD_q610_v01)
*                   a) /dmlocal: folder containing output generated by the 
*                       request that should be saved locally but not returned to
*                       DRN OC. Output may be used locally or to facilitate 
*                       follow-up queries.
*                   b) /drnoc: folder containing output generated by the request 
*                       that should be returned to the DRN OC Data Curation team. These tables 
*						consist of aggregate  data/output and transfer the minimum required to answer
*                       the analytic question.
*                   c) /sasprograms: folder containing the master SAS program 
*                       that must be edited and then executed locally.
*                   d) /infolder: folder containing all input and lookup files 
*                       needed to execute request. Input files are created for 
*                       each request by the DRN OC Data Curation team. The 
*                       contents of this folder should not be edited.
*
*  Actions needed: 
				1) User provides libname path where data resides (section below)
*                     (Example: /ct/pcornet/data/). 
*               2) User provides root network/server paths where the required
*                     sub-directory structure has been created (section below) 
*                     (Example: /ct/pcornet/queries/PROD_P02_DQA_FDPRO_DCQ_NSD_q610_v01/) 
*				###  DO NOT add sub-directory structure (i.e. /dmlocal) ###
*				3) User provides the part of the query group to process (section below)
*                     (Example: Yes or No) (default is Yes for both). 
*******************************************************************************/

********************************************************************************
* Provide user defined values
********************************************************************************;
 /*Enter directory where data is stored:*/             %let dpath=;
 /*Enter network/server directory: */                  %let qpath=;
 
 /*Enter whether to process query group: */ 			%let _part1 = Yes;
                                            			%let _part2 = Yes;

********************************************************************************
* End of user provided values
*******************************************************************************;

********************************************************************************
* Submit EDC_PREP program
********************************************************************************;
%include "&qpath.infolder/edc_prep.sas";
********************************************************************************;