
    alter table ORGA_PEOPLE 
        drop constraint ORGA_PEOPLE_ORGA_FKC;

    alter table ORGA_PEOPLE 
        drop constraint ORGA_PEOPLE_PEOPLE_FKC;

    alter table PEOPLE_ROLE 
        drop constraint PEOPLE_ROLE_ROLE_FKC;

    alter table PEOPLE_ROLE 
        drop constraint PEOPLE_ROLE_PEOPLE_FKC;

    alter table ROLE_OPERATE 
        drop constraint ROLE_OPERATE_ROLE_FKC;

    alter table ROLE_OPERATE 
        drop constraint ROLE_OPERATE_HANDLE_FKC;

    alter table WLTRWITHOR 
        drop constraint WLTRWITHOR_ORDER_ROW_FKC;

    alter table WLTRWITHOR 
        drop constraint WLTRWITHOR_TASK_ROW_FKC;

    alter table WL_ACCIDENT 
        drop constraint WL_ACCIDENT_BREAKER_FKC;

    alter table WL_ACCIDENT 
        drop constraint WL_ACCIDENT_BOOKER_FKC;

    alter table WL_ACCIDENT 
        drop constraint WL_ACCIDENT_VOITURE_FKC;

    alter table WL_ACCIDENT 
        drop constraint WL_ACCIDENT_REPORTER_FKC;

    alter table WL_CARD 
        drop constraint WL_CARD_VOITURE_FKC;

    alter table WL_CARRY_COST 
        drop constraint WL_CARRY_COST_AFFIRMER_FKC;

    alter table WL_CARRY_COST 
        drop constraint WL_CARRY_COST_VOITURE_FKC;

    alter table WL_CARRY_COST 
        drop constraint WL_CARRY_COST_START_STEER_ROWC;

    alter table WL_CARRY_COST 
        drop constraint WL_CARRY_COST_FILLER_FKC;

    alter table WL_CERTIFICATE 
        drop constraint WL_CERTIFICATE_OWNER_FKC;

    alter table WL_CERTIFICATE 
        drop constraint WL_CERTIFICATE_PEOPLE_FKC;

    alter table WL_COMPENSATE 
        drop constraint WL_COMPENSATE_TASK_ROW_FKC;

    alter table WL_COMPENSATE 
        drop constraint WL_COMPENSATE_CUSTOMER_FKC;

    alter table WL_COMPENSATE 
        drop constraint WL_COMPENSATE_ORDER_FKC;

    alter table WL_COMPENSATE 
        drop constraint WL_COMPENSATE_PEOPLE_FKC;

    alter table WL_CONTRACT 
        drop constraint WL_CONTRACT_CUSTOMER_FKC;

    alter table WL_CONTRACT 
        drop constraint WL_CONTRACT_DEP_FKC;

    alter table WL_CONTRACT 
        drop constraint WL_CONTRACT_ORDER_CODE_FKC;

    alter table WL_CONTRACT 
        drop constraint WL_CONTRACT_PEOPLE_FKC;

    alter table WL_CUSTOMER 
        drop constraint WL_CUSTOMER_PLACE_FKC;

    alter table WL_CUSTOMER 
        drop constraint WL_CUSTOMER_PEOPLE_FKC;

    alter table WL_CUST_CODE 
        drop constraint WL_CUST_CODE_CUSTOMER_FKC;

    alter table WL_CUST_PRODUCT 
        drop constraint WL_CUST_PRODUCT_CODE_I_D_FKC;

    alter table WL_CUST_PRODUCT 
        drop constraint WL_CUST_PRODUCT_PACK_FKC;

    alter table WL_FEE_LIST 
        drop constraint WL_FEE_LIST_APP_MANAGER_FKC;

    alter table WL_FEE_LIST 
        drop constraint WL_FEE_LIST_CUSTOMER_FKC;

    alter table WL_FEE_LIST 
        drop constraint WL_FEE_LIST_MAKE_PEOPLE_FKC;

    alter table WL_FEE_LIST 
        drop constraint WL_FEE_LIST_MANAGER_FKC;

    alter table WL_FEE_LIST 
        drop constraint WL_FEE_LIST_CHARGE_PEOPLE_FKC;

    alter table WL_FEE_ROW 
        drop constraint WL_FEE_ROW_PRINTER_FKC;

    alter table WL_FEE_ROW 
        drop constraint WL_FEE_ROW_ORDER_ROW_FKC;

    alter table WL_FEE_ROW 
        drop constraint WL_FEE_ROW_RECEIVER_FKC;

    alter table WL_FEE_ROW 
        drop constraint WL_FEE_ROW_FEE_LIST_FKC;

    alter table WL_INSURANCE 
        drop constraint WL_INSURANCE_CUSTOMER_FKC;

    alter table WL_INSURANCE 
        drop constraint WL_INSURANCE_ORDER_FKC;

    alter table WL_LABORAGE 
        drop constraint WL_LABORAGE_PEOPLE_FKC;

    alter table WL_LOAN 
        drop constraint WL_LOAN_RETURN_BOOKER_FKC;

    alter table WL_LOAN 
        drop constraint WL_LOAN_BORROWER_FKC;

    alter table WL_LOAN 
        drop constraint WL_LOAN_RETURNER_FKC;

    alter table WL_LOAN 
        drop constraint WL_LOAN_TASK_FKC;

    alter table WL_LOAN 
        drop constraint WL_LOAN_AGENT_FKC;

    alter table WL_OPINION 
        drop constraint WL_OPINION_TASK_ROW_FKC;

    alter table WL_OPINION 
        drop constraint WL_OPINION_BOOKER_FKC;

    alter table WL_OPINION 
        drop constraint WL_OPINION_REPORTER_FKC;

    alter table WL_OPINION 
        drop constraint WL_OPINION_PEOPLE_FKC;

    alter table WL_ORDER 
        drop constraint WL_ORDER_BOOKER_FKC;

    alter table WL_ORDER 
        drop constraint WL_ORDER_CUSTOMER_FKC;

    alter table WL_ORDER 
        drop constraint WL_ORDER_PATH_FKC;

    alter table WL_ORDER 
        drop constraint WL_ORDER_TASK_PEOPLE_FKC;

    alter table WL_ORDER 
        drop constraint WL_ORDER_UNLOAD_COMPANY_FKC;

    alter table WL_ORDER 
        drop constraint WL_ORDER_FETCH_COMPANY_FKC;

    alter table WL_ORDER 
        drop constraint WL_ORDER_PAY_COMPANY_FKC;

    alter table WL_ORDER 
        drop constraint WL_ORDER_WLOPERATOR_FKC;

    alter table WL_ORDER_QUOTATION 
        drop constraint WL_ORDER_QUOTATION_CONTRACT_FC;

    alter table WL_ORDER_ROW 
        drop constraint WL_ORDER_ROW_ORDER_FKC;

    alter table WL_ORDER_ROW 
        drop constraint WL_ORDER_ROW_PRODUCT_FKC;

    alter table WL_PART 
        drop constraint WL_PART_REPAIR_ROW_FKC;

    alter table WL_PATH 
        drop constraint WL_PATH_END_PLACE_FKC;

    alter table WL_PATH 
        drop constraint WL_PATH_START_PLACE_FKC;

    alter table WL_PEOPLE_COST 
        drop constraint WL_PEOPLE_COST_AFFIRMER_FKC;

    alter table WL_PEOPLE_COST 
        drop constraint WL_PEOPLE_COST_TASK_FKC;

    alter table WL_PEOPLE_COST 
        drop constraint WL_PEOPLE_COST_FILLER_FKC;

    alter table WL_PEOPLE_COST 
        drop constraint WL_PEOPLE_COST_PEOPLE_FKC;

    alter table WL_PEO_PROVIDE 
        drop constraint WL_PEO_PROVIDE_SIGN_PEOPLE_FKC;

    alter table WL_PEO_PROVIDE 
        drop constraint WL_PEO_PROVIDE_PEOPLE_FKC;

    alter table WL_QUOTATION 
        drop constraint WL_QUOTATION_CONTRACT_FKC;

    alter table WL_QUOTATION 
        drop constraint WL_QUOTATION_PATH_FKC;

    alter table WL_REPAIR_ROW 
        drop constraint WL_REPAIR_ROW_REPAIR_CUSTOMERC;

    alter table WL_REPAIR_ROW 
        drop constraint WL_REPAIR_ROW_CHECKER_FKC;

    alter table WL_REPAIR_ROW 
        drop constraint WL_REPAIR_ROW_REPAIR_MAN_FKC;

    alter table WL_REPAIR_ROW 
        drop constraint WL_REPAIR_ROW_FILL_PEOPLE_FKC;

    alter table WL_REPAIR_ROW 
        drop constraint WL_REPAIR_ROW_VOITURE_FKC;

    alter table WL_REPAIR_ROW 
        drop constraint WL_REPAIR_ROW_PLACE_FKC;

    alter table WL_STEER_ROW 
        drop constraint WL_STEER_ROW_BOOKER_FKC;

    alter table WL_STEER_ROW 
        drop constraint WL_STEER_ROW_VOITURE_FKC;

    alter table WL_STEER_ROW 
        drop constraint WL_STEER_ROW_TASK_FKC;

    alter table WL_STEER_ROW 
        drop constraint WL_STEER_ROW_PLACE_FKC;

    alter table WL_STEER_ROW 
        drop constraint WL_STEER_ROW_REPORTER_FKC;

    alter table WL_TASK 
        drop constraint WL_TASK_VOITURE_FKC;

    alter table WL_TASK 
        drop constraint WL_TASK_MANAGER_FKC;

    alter table WL_TASK 
        drop constraint WL_TASK_MASTER_DRIVER_FKC;

    alter table WL_TASK 
        drop constraint WL_TASK_ASSIST_DRIVER_FKC;

    alter table WL_TASK_ROW 
        drop constraint WL_TASK_ROW_UNLOAD_UNIT_FKC;

    alter table WL_TASK_ROW 
        drop constraint WL_TASK_ROW_FETCH_UNIT_FKC;

    alter table WL_TASK_ROW 
        drop constraint WL_TASK_ROW_PATH_FKC;

    alter table WL_TASK_ROW 
        drop constraint WL_TASK_ROW_VOITURE_FKC;

    alter table WL_TASK_ROW 
        drop constraint WL_TASK_ROW_TASK_FKC;

    alter table WL_TASK_ROW 
        drop constraint WL_TASK_ROW_MASTER_DRIVER_FKC;

    alter table WL_TASK_ROW 
        drop constraint WL_TASK_ROW_ASSIST_DRIVER_FKC;

    alter table WL_TASK_ROW_COST 
        drop constraint WL_TASK_ROW_COST_AFFIRMER_FKC;

    alter table WL_TASK_ROW_COST 
        drop constraint WL_TASK_ROW_COST_TASK_ROW_FKC;

    alter table WL_TASK_ROW_COST 
        drop constraint WL_TASK_ROW_COST_FILLER_FKC;

    alter table WL_VOITURE 
        drop constraint WL_VOITURE_DEPART_FKC;

    alter table WL_VOITURE 
        drop constraint WL_VOITURE_MASTER_DRIVER_FKC;

    alter table WZ_ACCEPT_FORM 
        drop constraint WZ_ACCEPT_FORM_ACCEPTOR_FKC;

    alter table WZ_ACCEPT_FORM 
        drop constraint WZ_ACCEPT_FORM_TRANSFER_FKC;

    alter table WZ_ACCEPT_FORM 
        drop constraint WZ_ACCEPT_FORM_PEOPLE_FKC;

    alter table WZ_ARRIVE_FLOW 
        drop constraint WZ_ARRIVE_FLOW_LOCATION_FKC;

    alter table WZ_ARRIVE_FLOW 
        drop constraint WZ_ARRIVE_FLOW_CUST_PRODUCT_FC;

    alter table WZ_ARRIVE_FLOW 
        drop constraint WZ_ARRIVE_FLOW_ORDERFLOW_FKC;

    alter table WZ_ARRIVE_FLOW 
        drop constraint WZ_ARRIVE_FLOW_PACK_FKC;

    alter table WZ_FETCH_FLOW 
        drop constraint WZ_FETCH_FLOW_CUST_PRODUCT_FKC;

    alter table WZ_FETCH_FLOW 
        drop constraint WZ_FETCH_FLOW_FETCHFORM_FKC;

    alter table WZ_FETCH_FORM 
        drop constraint WZ_FETCH_FORM_FETCHER_FKC;

    alter table WZ_FETCH_FORM 
        drop constraint WZ_FETCH_FORM_DEPART_FKC;

    alter table WZ_FETCH_FORM 
        drop constraint WZ_FETCH_FORM_PEOPLE_FKC;

    drop table ENUMERATION if exists;

    drop table HANDLE_INFO if exists;

    drop table ORGA_INFO if exists;

    drop table ORGA_PEOPLE if exists;

    drop table PEOPLE if exists;

    drop table PEOPLE_ROLE if exists;

    drop table ROLE_INFO if exists;

    drop table ROLE_OPERATE if exists;

    drop table WLTRWITHOR if exists;

    drop table WL_ACCIDENT if exists;

    drop table WL_CARD if exists;

    drop table WL_CARD_FULL if exists;

    drop table WL_CARRY_COST if exists;

    drop table WL_CERTIFICATE if exists;

    drop table WL_COMPENSATE if exists;

    drop table WL_CONTRACT if exists;

    drop table WL_CUSTOMER if exists;

    drop table WL_CUST_CODE if exists;

    drop table WL_CUST_PRODUCT if exists;

    drop table WL_FEE_LIST if exists;

    drop table WL_FEE_ROW if exists;

    drop table WL_FILE_REGINFO if exists;

    drop table WL_INSURANCE if exists;

    drop table WL_LABORAGE if exists;

    drop table WL_LOAN if exists;

    drop table WL_LOCATION if exists;

    drop table WL_OPINION if exists;

    drop table WL_ORDER if exists;

    drop table WL_ORDER_QUOTATION if exists;

    drop table WL_ORDER_ROW if exists;

    drop table WL_PACK if exists;

    drop table WL_PART if exists;

    drop table WL_PATH if exists;

    drop table WL_PEOPLE_COST if exists;

    drop table WL_PEO_PROVIDE if exists;

    drop table WL_PLACE if exists;

    drop table WL_QUOTATION if exists;

    drop table WL_REPAIR_ROW if exists;

    drop table WL_STEER_ROW if exists;

    drop table WL_STORE_ZONE if exists;

    drop table WL_TASK if exists;

    drop table WL_TASK_ROW if exists;

    drop table WL_TASK_ROW_COST if exists;

    drop table WL_VOITURE if exists;

    drop table WZ_ACCEPT_FORM if exists;

    drop table WZ_ARRIVE_FLOW if exists;

    drop table WZ_FETCH_FLOW if exists;

    drop table WZ_FETCH_FORM if exists;
