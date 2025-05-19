import pandas as pd
import awswrangler as awr
import openpyxl

#declaring date variables
today = pd.Timestamp.today().date()
yesterday = today - pd.Timedelta(days=1)
friday = today - pd.Timedelta(days=3)

file_path = r"C:\Users\raphael.almeida\Documents\Processos\historico_placas\sql\all_boards_sets.sql"

with open (file_path, 'r') as file:
    query = file.read()

df = awr.athena.read_sql_query(query, database='silver')

#making sure that columns are datetime
df['data_ativacao_conjunto'] = pd.to_datetime(df['data_ativacao_conjunto'])
df['data_cancelamento_conjunto'] = pd.to_datetime(df['data_cancelamento_conjunto'])

if today.weekday() != 0:
    df = df[
        (
            (df['data_ativacao_conjunto'].dt.date!=yesterday) &
            (df['data_ativacao_conjunto'].dt.date!=today)
        )|     
             
        (
            (df['data_cancelamento_conjunto'].dt.date!=yesterday) &
            (df['data_cancelamento_conjunto'].dt.date!=today)
        )
        ]
else:
    df = df[
        (df['data_ativacao_conjunto'].dt.date<friday) | 
        (df['data_cancelamento_conjunto'].dt.date<friday) 
    ]

#splitting activation and cancellation and gathering both together in one column (of status and date)

# activation
#df_ativacoes = df[df['data_cancelamento_conjunto'].isnull()]

df_ativacoes = df[df['data_cancelamento_conjunto'].isnull()]

df_ativacoes = df_ativacoes[df_ativacoes['status_conjunto'].isin(['ATIVO', 'NOVO', 'RENOVAÇÃO'])] #averiguar o novo e renovação 

df_ativacoes['data_status'] = df_ativacoes['data_ativacao_conjunto']

df_ativacoes['vigencia'] = 'ATIVO'


# cancellation

df_cancelamentos = df[df['data_cancelamento_conjunto'].notna()]

df_cancelamentos['data_status'] = df_cancelamentos['data_cancelamento_conjunto']

df_cancelamentos['vigencia'] = 'CANCELADO'


#concatenation
df_base = pd.concat([df_ativacoes, df_cancelamentos])

#to excel
save_path = r'C:\Users\raphael.almeida\Documents\Processos\historico_placas\historico_placas_base.xlsx'
df_base.to_excel(save_path, engine = 'openpyxl', index = False, sheet_name= 'historico_placas_base')