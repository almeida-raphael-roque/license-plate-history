SELECT DISTINCT
    coalesce(iv.BOARD,it.BOARD,itt.BOARD) as "placa",
    coalesce(iv.chassi,it.chassi,itt.chassi) as "chassi",
    coalesce(iv.id,it.id,itt.id) as "id_placa",
    ir.id as "Matricula",
    irs.id as "Conjunto",
    -- ^^ informações acima ^^

    irs.data_registration  as "data_registro",

    cast(irs.date_cancellation as date) as "data_cancelamento_conjunto",
    cast(coalesce(irs.date_inital_effect, date_add('day', -364, irs.date_final_effect)) as date) as "data_ativacao_conjunto",
    iss.description as "status_conjunto",
    'Segtruck' as empresa,



    --irs.id_renovated_set as "id_renovacao", (ele foi renovado no passado)

    CAST('1900-01-01 00:00:00' AS TIMESTAMP) 
    + (irsc.UPDATED_AT - 599266080000000000) / 864000000000 * INTERVAL '1' DAY AS "data_atualizacao"
   
    
from silver.insurance_registration ir
        left outer join silver.insurance_reg_set irs on irs.parent = ir.id
        left outer join silver.cliente clie on clie.codigo = ir.CUSTOMER_ID
        left outer join silver.catalogo cat on cat.cnpj_cpf = clie.cnpj_cpf
        left outer join silver.representante r on r.codigo = irs.id_unity
        left outer join silver.catalogo cata on cata.cnpj_cpf = r.cnpj_cpf
        left outer join silver.insurance_status iss on iss.id = irs.id_status
        left outer join silver.INSURANCE_REG_SET_COVERAGE irsc ON irsc.PARENT = irs.ID
        left outer join silver.INSURANCE_VEHICLE iv on iv.ID = irsc.ID_VEHICLE
        left outer join silver.TIPO_VEICULO tv on tv.CODIGO = iv.CODE_TYPE_VEHICLE 
        left outer join silver.INSURANCE_REG_SET_COV_TRAILER irsct on irsct.PARENT = irsc.ID
        left outer join silver.INSURANCE_TRAILER it on it.ID = irsct.ID_TRAILER
        left outer join silver.insurance_trailer itt on itt.id = irsc.ID_TRAILER
        left outer join silver.insurance_status isss on isss.id = irsc.id_status
        
WHERE (
    coalesce(iv.BOARD,it.BOARD,itt.BOARD) is not null
    and coalesce(iv.chassi,it.chassi,itt.chassi) is not null
)

-----------------------------------------------------------------------
UNION ALL
-----------------------------------------------------------------------

SELECT DISTINCT
    coalesce(iv.BOARD,it.BOARD,itt.BOARD) as "placa",
    coalesce(iv.chassi,it.chassi,itt.chassi) as "chassi",
    coalesce(iv.id,it.id,itt.id) as "id_placa",
    ir.id as "Matricula",
    irs.id as "Conjunto",
    -- ^^ informações acima ^^

    irs.data_registration  as "data_registro",

    cast(irs.date_cancellation as date) as "data_cancelamento_conjunto",
    cast(coalesce(irs.date_inital_effect, date_add('day', -364, irs.date_final_effect)) as date) as "data_ativacao_conjunto",
    iss.description as "status_conjunto",
    'Stcoop' as empresa,



    --irs.id_renovated_set as "id_renovacao", (ele foi renovado no passado)

    CAST('1900-01-01 00:00:00' AS TIMESTAMP) 
    + (irsc.UPDATED_AT - 599266080000000000) / 864000000000 * INTERVAL '1' DAY AS "data_atualizacao"
   
    
from stcoop.insurance_registration ir
        left outer join stcoop.insurance_reg_set irs on irs.parent = ir.id
        left outer join stcoop.cliente clie on clie.codigo = ir.CUSTOMER_ID
        left outer join stcoop.catalogo cat on cat.cnpj_cpf = clie.cnpj_cpf
        left outer join stcoop.representante r on r.codigo = irs.id_unity
        left outer join stcoop.catalogo cata on cata.cnpj_cpf = r.cnpj_cpf
        left outer join stcoop.insurance_status iss on iss.id = irs.id_status
        left outer join stcoop.INSURANCE_REG_SET_COVERAGE irsc ON irsc.PARENT = irs.ID
        left outer join stcoop.INSURANCE_VEHICLE iv on iv.ID = irsc.ID_VEHICLE
        left outer join stcoop.TIPO_VEICULO tv on tv.CODIGO = iv.CODE_TYPE_VEHICLE 
        left outer join stcoop.INSURANCE_REG_SET_COV_TRAILER irsct on irsct.PARENT = irsc.ID
        left outer join stcoop.INSURANCE_TRAILER it on it.ID = irsct.ID_TRAILER
        left outer join stcoop.insurance_trailer itt on itt.id = irsc.ID_TRAILER
        left outer join stcoop.insurance_status isss on isss.id = irsc.id_status
        
WHERE (
    coalesce(iv.BOARD,it.BOARD,itt.BOARD) is not null
    and coalesce(iv.chassi,it.chassi,itt.chassi) is not null
)

-----------------------------------------------------------------------
UNION ALL
-----------------------------------------------------------------------

SELECT DISTINCT
    coalesce(iv.BOARD,it.BOARD,itt.BOARD) as "placa",
    coalesce(iv.chassi,it.chassi,itt.chassi) as "chassi",
    coalesce(iv.id,it.id,itt.id) as "id_placa",
    ir.id as "Matricula",
    irs.id as "Conjunto",
    -- ^^ informações acima ^^

    irs.data_registration  as "data_registro",

    cast(irs.date_cancellation as date) as "data_cancelamento_conjunto",
    cast(coalesce(irs.date_inital_effect, date_add('day', -364, irs.date_final_effect)) as date) as "data_ativacao_conjunto",
    iss.description as "status_conjunto",
    'Viavante' as empresa,


    --irs.id_renovated_set as "id_renovacao", (ele foi renovado no passado)

    CAST('1900-01-01 00:00:00' AS TIMESTAMP) 
    + (irsc.UPDATED_AT - 599266080000000000) / 864000000000 * INTERVAL '1' DAY AS "data_atualizacao"
   
    
from viavante.insurance_registration ir
        left outer join viavante.insurance_reg_set irs on irs.parent = ir.id
        left outer join viavante.cliente clie on clie.codigo = ir.CUSTOMER_ID
        left outer join viavante.catalogo cat on cat.cnpj_cpf = clie.cnpj_cpf
        left outer join viavante.representante r on r.codigo = irs.id_unity
        left outer join viavante.catalogo cata on cata.cnpj_cpf = r.cnpj_cpf
        left outer join viavante.insurance_status iss on iss.id = irs.id_status
        left outer join viavante.INSURANCE_REG_SET_COVERAGE irsc ON irsc.PARENT = irs.ID
        left outer join viavante.INSURANCE_VEHICLE iv on iv.ID = irsc.ID_VEHICLE
        left outer join viavante.TIPO_VEICULO tv on tv.CODIGO = iv.CODE_TYPE_VEHICLE 
        left outer join viavante.INSURANCE_REG_SET_COV_TRAILER irsct on irsct.PARENT = irsc.ID
        left outer join viavante.INSURANCE_TRAILER it on it.ID = irsct.ID_TRAILER
        left outer join viavante.insurance_trailer itt on itt.id = irsc.ID_TRAILER
        left outer join viavante.insurance_status isss on isss.id = irsc.id_status
        
WHERE (
    coalesce(iv.BOARD,it.BOARD,itt.BOARD) is not null
    and coalesce(iv.chassi,it.chassi,itt.chassi) is not null
)
