from flask import request, jsonify
import mysql.connector
from _config import *
from mysql.connector import Error
from app import app

# FUNZIONE PER CREARE LA CONNESSIONE AL DATABASE
def create_connection():
    # connessione
    connection = None
    try:
        # creo connessione
        connection = mysql.connector.connect(
            host=MYSQL_CONFIG['host'],
            user=MYSQL_CONFIG['user'],
            password=MYSQL_CONFIG['password'],
            database=MYSQL_CONFIG['database']
        )
        
        # controllo la connessione
        if connection.is_connected():
            print("Connesso a MySQL Database")
    except Error as e:
        # errore
        print(f"Errore: '{e}'")
    
    # return connessione
    return connection


# FUNZIONE PER ESEGUIRE UNA QUERY
def execute_query(query, params=None):
    # connessione al database
    conn = create_connection()
    
    # controllo connesssione
    if conn is None:
        return None
    
    # cursore
    cursor = conn.cursor(dictionary=True)  # dictionary=True per ottenere i risultati come dizionari
    try:
        # eseguo query
        cursor.execute(query, params)
        
        # controllo il tipo di query
        query_type = query.strip().split()[0].upper()
        if query_type == 'SELECT':
            # ritorno i risultati trovati
            results = cursor.fetchall()
            return results
        elif query_type == 'INSERT':
            # ritorno id nuovo elemento
            conn.commit()
            last_id = cursor.lastrowid
            return last_id
        elif query_type in ('UPDATE', 'DELETE'):
            # ritorno numero di righe modificate o eliminate
            conn.commit()
            row_count = cursor.rowcount
            return row_count
        else:
            # non ritorno nulla (query come la create table, ecc...)
            conn.commit()
            return None
    except Error as e:
        # errore
        print(f"Errore durante l'esecuzione della query: '{e}'")
        return None
    finally:
        # chiudo connessione
        cursor.close()
        conn.close()


###########################à


# ENDPOINT PER CERCARE LE STAZIONI
@app.route('/getStazioni', methods=['GET'])
def getStazioni():
    # prendo i parametri
    via = request.args.get('via')
    stazione_id = request.args.get('stazione_id')

    # controllo parametri
    if via:
        # cerco per via
        query = "SELECT * FROM stazioni WHERE via = %s;"
        params = (via,)
    elif stazione_id:
        # converto id in intero
        try:
            stazione_id = int(stazione_id)
        except ValueError:
            return jsonify({'message': 'L\'ID della stazione deve essere un numero intero.'}), 400
        
        # cerco per id
        query = "SELECT * FROM stazioni WHERE stazione_id = %s;"
        params = (stazione_id,)
    else:
        # cerco tutte le stazioni
        query = "SELECT * FROM stazioni;"
        params = None
    
    # eseguo query
    stazioni = execute_query(query, params)

    # controllo il risultato
    if stazioni:
        return jsonify(stazioni)
    
    return jsonify({'message': 'Nessuna stazione trovata.'}), 404


# ENDPOINT PER ELIMINARE LE STAZIONI
@app.route('/deleteStazioni', methods=['GET'])
def deleteStazioni():
    # prendo i parametri
    via = request.args.get('via')
    stazione_id = request.args.get('stazione_id')

    # controllo parametri
    if via:
        # elimino per via
        query = "DELETE FROM stazioni WHERE via = %s;"
        params = (via,)
    elif stazione_id:
        # converto id in intero
        try:
            stazione_id = int(stazione_id)
        except ValueError:
            return jsonify({'message': 'L\'ID della stazione deve essere un numero intero.'}), 400
        
        # elimino per id
        query = "DELETE FROM stazioni WHERE stazione_id = %s;"
        params = (stazione_id,)
    else:
        # elimino tutte le stazioni
        query = "DELETE * FROM stazioni;"
        params = None
    
    # eseguo query
    num_righe = execute_query(query, params)

    # controllo il risultato
    if num_righe > 0:
        return jsonify({'message': 'Operazione eseguita con successo'})
    
    return jsonify({'message': 'ERRORE! Operazione non eseguita'}), 404


# ENDPOINT PER CERCARE LE BICICLETTE
@app.route('/getBiciclette', methods=['GET'])
def getBiciclette():
    # prendo i parametri
    codice = request.args.get('codice')

    # controllo parametri
    if codice:
        # cerco per codice
        query = "SELECT * FROM biciclette WHERE codice = %s;"
        params = (codice,)
    else:
        # cerco tutte le biciclette
        query = "SELECT * FROM biciclette;"
        params = None
        
    # eseguo query
    biciclette = execute_query(query, params)

    # controllo il risultato
    if biciclette:
        return jsonify(biciclette)
    
    return jsonify({'message': 'Nessuna bicicletta trovata.'}), 404


# ENDPOINT PER ELIMINARE LE BICICLETTE
@app.route('/deleteBiciclette', methods=['GET'])
def deleteBiciclette():
    # prendo i parametri
    codice = request.args.get('codice')

    # controllo parametri
    if codice:
        # elimino per codice
        query = "DELETE FROM biciclette WHERE codice = %s;"
        params = (codice,)
    else:
        # elimino tutte le biciclette
        query = "DELETE * FROM biciclette;"
        params = None
        
    # eseguo query
    num_righe = execute_query(query, params)

    # controllo il risultato
    if num_righe > 0:
        return jsonify({'message': 'Operazione eseguita con successo'})
    
    return jsonify({'message': 'ERRORE! Operazione non eseguita'}), 404


# ENDPOINT PER AGGIUNGERE SLOT ALLE STAZIONI
@app.route('/aggiungiSlot', methods=['GET'])
def aggiungiSlot():
    # prendo i parametri
    numero = request.args.get('numero')
    stazione_id = request.args.get('stazione_id')
        
    # converto numero in intero
    try:
        numero = int(numero)
    except ValueError:
        return jsonify({'message': 'Il numero di slot deve essere un numero intero.'}), 400        
    
    # controllo parametri
    if stazione_id:
        try:
            stazione_id = int(stazione_id)
        except ValueError:
            return jsonify({'message': 'L\'ID della stazione deve essere un numero intero.'}), 400
        
        # aggiungo slot alla stazione
        query = "UPDATE stazioni SET slotMax = slotMax + %s WHERE id = %s;"
        params = (numero, stazione_id,)
    else:
        # aggiungo slot a tutte le stazioni
        query = "UPDATE stazioni SET slotMax = slotMax + %s;"
        params = (numero,)
            
    # eseguo  query
    num_righe = execute_query(query, params)
    
    # controllo il risultato
    if num_righe > 0:
        return jsonify({'message': 'Operazione eseguita con successo'})
    
    return jsonify({'message': 'ERRORE! Operazione non eseguita'}), 404

# ENDPOINT PER RIMUOVERE SLOT ALLE STAZIONI
@app.route('/rimuoviSlot', methods=['GET'])
def rimuoviSlot():
    # prendo i parametri
    numero = request.args.get('numero')
    stazione_id = request.args.get('stazione_id')
        
    # converto numero in intero
    try:
        numero = int(numero)
    except ValueError:
        return jsonify({'message': 'Il numero di slot deve essere un numero intero.'}), 400
    
    # controllo parametri
    if stazione_id:
        try:
            stazione_id = int(stazione_id)
        except ValueError:
            return jsonify({'message': 'L\'ID della stazione deve essere un numero intero.'}), 400
        
        # aggiungo slot alla stazione
        query = "UPDATE stazioni SET slotMax = slotMax - %s WHERE id = %s;"
        params = (numero, stazione_id,)
    else:
        # aggiungo slot a tutte le stazioni
        query = "UPDATE stazioni SET slotMax = slotMax - %s;"
        params = (numero,)
            
    # eseguo  query
    num_righe = execute_query(query, params)
    
    # controllo il risultato
    if num_righe > 0:
        return jsonify({'message': 'Operazione eseguita con successo'})
    
    return jsonify({'message': 'ERRORE! Operazione non eseguita'}), 404

# ENDPOINT PER MODIFICARE LE BICICLETTE
@app.route('/updateBicicletta', methods=['GET'])
def updateBicicletta():
    # prendo i parametri
    codice = request.args.get('codice')
    nuovoCodice = request.args.get('nuovoCodice')
    km_percorsi = request.args.get('km_percorsi')
    bicicletta_id = request.args.get('bicicletta_id')
    latitudine = request.args.get('latitudine')
    longitudine = request.args.get('longitudine')
    
    # converto codice in intero
    try:
        codice = int(codice)
    except ValueError:
        return jsonify({'message': 'Il codice della bicicletta deve essere un numero intero.'}), 400
    
    # converto nuovoCodice in intero
    try:
        nuovoCodice = int(nuovoCodice)
    except ValueError:
        return jsonify({'message': 'il nuovo codice della bicicletta deve essere un numero intero.'}), 400
    
    # converto km_percorsi in float
    try:
        km_percorsi = float(km_percorsi)
    except ValueError:
        return jsonify({'message': 'I chilometri percorsi devono essere un numero.'}), 400
    
    # converto id in intero
    try:
        bicicletta_id = int(bicicletta_id)
    except ValueError:
        return jsonify({'message': 'L\'ID della bicicletta deve essere un numero intero.'}), 400
    
    # converto latitudine in float
    try:
        latitudine = float(latitudine)
    except ValueError:
        return jsonify({'message': 'La latitudine deve essere un numero.'}), 400
    
    # converto longitudine in float
    try:
        longitudine = float(longitudine)
    except ValueError:
        return jsonify({'message': 'La longitudine deve essere un numero.'}), 400
    
    # controllo parametri
    if codice and nuovoCodice:
        # modifico codice
        query = "UPDATE biciclette SET codice = %s WHERE codice = %s;"
        params = (nuovoCodice, codice,)
    elif km_percorsi and bicicletta_id:
        # modifico chilometri percorsi
        query = "UPDATE biciclette SET km_percorsi = km_percorsi + %s WHERE bicicletta_id = %s;"
        params = (km_percorsi, bicicletta_id,)
    elif bicicletta_id and latitudine and longitudine:
        # modifico latitudine e longitudine
        query = "UPDATE biciclette SET latitudine = %s, longitudine = %s WHERE bicicletta_id = %s;"
        params = (latitudine, longitudine, bicicletta_id,)
    
    # eseguo query
    num_righe = execute_query(query, params)
        
    # controllo il risultato
    if num_righe > 0:
        return jsonify({'message': 'Operazione eseguita con successo'})
    
    return jsonify({'message': 'ERRORE! Operazione non eseguita'}), 404


# ENDPOINT PER INSERIRE UN OPERAZIONE
@app.route('/insertOperazione', methods=['GET'])
def insert_operazione():
    # prendo i parametri
    tipo = request.args.get('tipo')
    data_ora = request.args.get('data_ora')
    km_percorsi = request.args.get('km_percorsi')
    tariffa = request.args.get('tariffa')
    cliente_id = request.args.get('cliente_id')
    stazione_id = request.args.get('stazione_id')
    bicicletta_id = request.args.get('bicicletta_id')

    # converto i parametri per evitare SQL injection
    km_percorsi = int(km_percorsi) if km_percorsi else None
    tariffa = int(tariffa) if tariffa else None
    cliente_id = int(cliente_id)
    stazione_id = int(stazione_id)
    bicicletta_id = int(bicicletta_id)

    # imposto attributi a None per il tipo noleggio
    if tipo == 'noleggio':
        tariffa = None
        km_percorsi = None

    # query
    query = " INSERT INTO operazioni (tipo, data_ora, km_percorsi, tariffa, cliente_id, stazione_id, bicicletta_id) \
        VALUES (%s, %s, %s, %s, %s, %s, %s); "
    params = (tipo, data_ora, km_percorsi, tariffa, cliente_id, stazione_id, bicicletta_id,)
    
    # eseguo query
    id = execute_query(query, params)
    
    if id > 0:
        return jsonify({'message': "Operazione eseguita con successo"})
    
    return jsonify({'message': "ERRORE! Operazione non eseguita"})


# ENDPOINT PER OTTENERE IL NUMERO DI SLOT LIBERI PER OGNI STAZIONE
@app.route('/getSlotLiberi', methods=['GET'])
def getSlotLiberi():
    # Query per trovare il numero di slot liberi nelle varie stazioni
    query = " SELECT \
            stazioni.stazione_id, \
            stazioni.via AS nome_stazione, \
            stazioni.slotMax - COUNT(operazioni.operazione_id) AS slot_liberi \
        FROM stazioni \
        LEFT JOIN \
            operazioni ON stazioni.stazione_id = operazioni.stazione_id AND operazioni.tipo = 'noleggio' \
        GROUP BY stazioni.stazione_id "
        
    slotLiberi = execute_query(query)
    
    return jsonify({'slotLiberi': slotLiberi})