import pandas as pd
import awswrangler as awr
import openpyxl

file_path = r"C:\Users\raphael.almeida\Documents\Processos\historico_placas\sql\all_boards_ATIVOS.sql"

with open (file_path, 'r') as file:
    query = file.read()

today = pd.Timestamp.today().date()
yesterday = today - pd.Timedelta(days=1)

df = awr.athena.read_sql_query(query, database='silver')

df['data_ativacao'] = df['data_ativacao']

df_active_yesterday = df[df['data_ativacao']==yesterday]

#to excel

save_path = r'C:\Users\raphael.almeida\Documents\Processos\historico_placas\historico_placas.xlsx'
df_active_yesterday.to_excel(save_path, engine = 'openpyxl', index = False, sheet_name= 'historico_placas')