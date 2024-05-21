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
@app.route('/getStazioni/<string:nome>', methods=['GET'])
@app.route('/getStazioni/<int:stazione_id>', methods=['GET'])
def getStazioni(nome=None, stazione_id=None):
    # nome passato
    if nome:
        # prendo stazione tramite nome
        query = "SELECT * FROM stazioni WHERE nome = %s;"
        stazioni = execute_query(query, (nome,))
    elif stazione_id:
        # prendo stazione tramite id
        query = "SELECT * FROM stazioni WHERE stazione_id = %s;"
        stazioni = execute_query(query, (stazione_id,))
    else:
        # prendo tutte le stazioni
        query = "SELECT * FROM stazioni;"
        stazioni = execute_query(query)
        
    # controllo il risultato
    if stazioni:
        # ritorno stazioni
        return jsonify(stazioni)
    else:
        # ritorno errore
        return jsonify({'message': 'Nessuna stazione trovata.'}), 404
    
# ENDPOINT PER ELIMINARE LE STAZIONI
@app.route('/deleteStazioni', methods=['GET'])
@app.route('/deleteStazioni/<string:nome>', methods=['GET'])
@app.route('/deleteStazioni/<int:stazione_id>', methods=['GET'])
def deleteStazioni(nome=None, stazione_id=None):
    # nome passato
    if nome:
        # elimino stazione tramite nome
        query = "DELETE FROM stazioni WHERE nome = %s;"
        num_righe = execute_query(query, (nome,))
    elif stazione_id:
        # elimino stazione tramite id
        query = "DELETE FROM stazioni WHERE stazione_id = %s;"
        num_righe = execute_query(query, (stazione_id,))
    else:
        # elimino tutte le stazioni
        query = "DELETE * FROM stazioni;"
        num_righe = execute_query(query)
        
    # controllo il risultato
    if num_righe > 0:
        # ritorno numero di righe
        return jsonify({'numero_righe': num_righe})
    else:
        # ritorno errore
        return jsonify({'message': 'Nessuna stazione eliminata.'}), 404
    
# ENDPOINT PER CERCARE LE BICICLETTE
@app.route('/getBiciclette', methods=['GET'])
@app.route('/getBiciclette/<string:codice>', methods=['GET'])
def getBiciclette(codice=None):
    # codice passato
    if codice:
        # prendo bicicletta tramite codice
        query = "SELECT * FROM biciclette WHERE codice = %s;"
        biciclette = execute_query(query, (codice,))
    else:
        # prendo tutte le biciclette
        query = "SELECT * FROM biciclette;"
        biciclette = execute_query(query)
        
    # controllo il risultato
    if biciclette:
        # ritorno biciclette
        return jsonify(biciclette)
    else:
        # ritorno errore
        return jsonify({'message': 'Nessuna bicicletta trovata.'}), 404

# ENDPOINT PER ELIMINARE LE BICICLETTE
@app.route('/deleteBiciclette', methods=['GET'])
@app.route('/deleteBiciclette/<string:codice>', methods=['GET'])
def deleteBiciclette(codice=None):
    # codice passato
    if codice:
        # elimino bicicletta tramite codice
        query = "DELETE FROM biciclette WHERE codice = %s;"
        num_righe = execute_query(query, (codice,))
    else:
        # elimino tutte le biciclette
        query = "DELETE * FROM biciclette;"
        num_righe = execute_query(query)
        
    # controllo il risultato
    if num_righe > 0:
        # ritorno numero di righe
        return jsonify({'numero_righe': num_righe})
    else:
        # ritorno errore
        return jsonify({'message': 'Nessuna bicicletta eliminata.'}), 404

# ENDPOINT PER MODIFICARE IL NUMERO DI SLOT DELLE STAZIONI
@app.route('/aggiungiSlot/<int:numero>', methods=['GET'])
@app.route('/aggiungiSlot/<int:numero>/<int:stazione_id>', methods=['GET'])
@app.route('/rimuoviSlot/<int:numero>/<int:stazione_id>', methods=['GET'])
def updateSlotStazione(numero, stazione_id=None):
    # controllo se devo aggiungere o rimuovere
    if request.path.startswith('/aggiungiSlot'):
        # id stazione passato
        if stazione_id:
            # aggiungo slot
            query = "UPDATE stazioni SET slotMax = slotMax + %s WHERE id = %s;"
            params = (numero, stazione_id)
        else:
            # aggiungo slot a tutte le stazioni
            query = "UPDATE stazioni SET slotMax = slotMax + %s;"
            params = (numero)
    elif request.path.startswith('/rimuoviSlot'):
        # id stazione passato
        if stazione_id:
            # rimuovo slot
            query = "UPDATE stazioni SET slotMax = slotMax - %s WHERE id = %s;"
            params = (numero, stazione_id)
        else:
            # rimuovo slot a tutte le stazioni
            query = "UPDATE stazioni SET slotMax = slotMax - %s;"
            params = (numero)
    
    # eseguo la query
    num_righe = execute_query(query, params)
    
    # controllo il risultato
    if num_righe:
        return jsonify({'message': 'Numero di slot aggiornato con successo.', 'num_righe': num_righe})
    else:
        return jsonify({'message': 'ERRORE nell\'aggiornamento del numero di slot.'}), 500

# ENDPOINT PER MODIFICARE IL CODICE DELLA BICICLETTA
@app.route('/updateBicicletta/<string:codice>/<string:nuovoCodice>', methods=['GET'])
@app.route('/updateBicicletta/<int:km_percorsi>/<int:bicicletta_id>', methods=['GET'])
@app.route('/updateBicicletta/<int:codice>/<float:latitudine>/<float:longitudine>', methods=['GET'])
def updateBicicletta(codice=None, nuovoCodice=None, km_percorsi=None, bicicletta_id=None, latitudine=None, longitudine=None):
    if codice and nuovoCodice:
        # modifico codice
        query = "UPDATE biciclette SET codice = %s WHERE codice = %s;"
        params = (nuovoCodice, codice)
    elif km_percorsi and bicicletta_id:
        # modifico chilometri percorsi
        query = "UPDATE biciclette SET km_percorsi = km_percorsi + %s WHERE bicicletta_id = %s;"
        params = (km_percorsi, bicicletta_id)
    elif codice and latitudine and longitudine:
        # modifico latitudine e longitudine
        query = "UPDATE biciclette SET latitudine = %s, longitudine = %s WHERE codice = %s;"
        params = (latitudine, longitudine, codice)
    
    # eseguo query
    num_righe = execute_query(query, params)
        
    # controllo il risultato
    if num_righe > 0:
        # ritorno numero di righe
        return jsonify({'numero_righe': num_righe})
    else:
        # ritorno errore
        return jsonify({'message': 'Nessuna bicicletta modificata.'}), 404

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
    params = (tipo, data_ora, km_percorsi, tariffa, cliente_id, stazione_id, bicicletta_id)
    
    # eseguo query
    id = execute_query(query, params)
    
    if id > 0:
        return jsonify({'stato': True, 'message': "Operazione eseguita con successo"})
    
    return jsonify({'stato': True, 'message': "ERRORE! Operazione non eseguita"})

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
        
    result = execute_query(query)
    
    return jsonify({'result': result})
