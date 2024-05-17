let nome = null;
let cognome = null;

// PROCEDO CON LA REGISTRAZIONE
async function avanti()
{
    // prendo i parametri
    nome = $("#nome").val();
    cognome = $("#cognome").val();

    // eseguo i controlli
    let stato = await doControlli(nome, cognome);

    // reindirizzo
    reindizzamento(stato);
}

// CONTROLLI SUI PARAMETRI IN INPUT
async function doControlli(nome, cognome)
{
    // parametri mancanti
    if(nome == "" || cognome == "")
        return "ERRORE! Inserire tutti i campi!";

    // tutto ok
    return true;
}

// REINDIRIZZAMENTO
function reindizzamento(stato)
{
    // controlli ok
    if(stato == true)
    {
        // salvo dati
        salvaDati();

        // reindirizzo
        window.location.href = "fase2.php";
    }
    else
        alert(stato);
}

// FUNZIONE PER SALVARE I DATI DELLA FASE
function salvaDati()
{
    localStorage.setItem('nome', nome);
    localStorage.setItem('cognome', cognome);
}