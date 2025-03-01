CREATE DATABASE Progetto_S3_L5;
USE Progetto_S3_L5;

CREATE TABLE Anagrafica(
idanagrafica UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
Cognome NVARCHAR(50) NOT NULL,
Nome NVARCHAR(50) NOT NULL,
Indirizzo VARCHAR(200) NOT NULL,
Citta VARCHAR(30) NOT NULL,
Cap INT NOT NULL,
Codice_Fiscale VARCHAR(16) NOT NULL
);
CREATE TABLE Violazione(
idviolazione UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
Descrizione VARCHAR(50) NOT NULL,
);
CREATE TABLE Verbale (
idVerbale UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
DataViolazione DateTime NOT NULL,
IndirizzoViolazione VARCHAR(200) NOT NULL,
NominativoAgente NVARCHAR(100) NOT NULL,
DataTrascrizioneVerbale DATE NOT NULL,
Importo Decimal(9,2) NOT NULL,
DecurtamentoPunti int NOT NULL
);
--alter da datetime a date
ALTER TABLE Verbale ALTER COLUMN DataViolazione DATE NOT NULL; 
--Aggiunta FKs
ALTER TABLE Verbale ADD idanagrafica UNIQUEIDENTIFIER NOT NULL;
ALTER TABLE Verbale ADD idviolazione UNIQUEIDENTIFIER NOT NULL;
--AggiuntaConstraint
ALTER TABLE Verbale ADD CONSTRAINT Fk_Anagrafica_Verbale FOREIGN KEY (idanagrafica) REFERENCES Anagrafica(idanagrafica);
ALTER TABLE Verbale ADD CONSTRAINT Fk_Violazione_Verbale FOREIGN KEY (idviolazione) REFERENCES Violazione(idviolazione);
ALTER TABLE Anagrafica ADD CONSTRAINT Unique_CF unique (Codice_Fiscale);
--AGGIUNTA Dati Tab violazione
INSERT INTO Violazione (idviolazione, Descrizione)
VALUES 
    (NEWID(), 'Eccesso di velocit�'),
    (NEWID(), 'Parcheggio in zona vietata'),
    (NEWID(), 'Soste irregolari'),
    (NEWID(), 'Passaggio con semaforo rosso'),
    (NEWID(), 'Mancata revisione del veicolo'),
    (NEWID(), 'Guida senza cinture di sicurezza');
--AGGIUNTA DATI Anagrafica
INSERT INTO Anagrafica VALUES (NEWID(), 'Rossi', 'Mario', 'Via Roma 10', 'Roma', 00100, 'RSSMRA80A01H501Z');
INSERT INTO Anagrafica VALUES (NEWID(), 'Bianchi', 'Luigi', 'Via Milano 25', 'Milano', 20100, 'BNCLGU85M01H501R');
INSERT INTO Anagrafica VALUES (NEWID(), 'Verdi', 'Giovanni', 'Viale Piave 4', 'Torino', 10100, 'VRDGVN70A01H501C');
INSERT INTO Anagrafica VALUES (NEWID(), 'Neri', 'Francesca', 'Piazza della Libert� 8', 'Napoli', 80100, 'NRIFNC85F50F839C');
INSERT INTO Anagrafica VALUES (NEWID(), 'Gialli', 'Alessandro', 'Via dei Mille 12', 'Firenze', 50100, 'GLIASL75A01F205Z');
INSERT INTO Anagrafica VALUES (NEWID(), 'Lombardi', 'Sofia', 'Corso Vittorio Emanuele 5', 'Bologna', 40100, 'LMBFSO95D43A944P');
INSERT INTO Anagrafica VALUES (NEWID(), 'Esposito', 'Carlo', 'Lungomare 3', 'Cagliari', 09100, 'ESPCRL72M23H501J');
INSERT INTO Anagrafica VALUES (NEWID(), 'Martini', 'Elena', 'Via Guglielmo Marconi 7', 'Genova', 16100, 'MRTLNA89L42L419D');
INSERT INTO Anagrafica VALUES (NEWID(), 'Conti', 'Riccardo', 'Via Garibaldi 21', 'Palermo', 90100, 'CNTRCM88M01A944P');
INSERT INTO Anagrafica VALUES (NEWID(), 'Ferrari', 'Giulia', 'Viale Europa 6', 'Venezia', 30100, 'FRRGIA92F45F839S');
INSERT INTO Anagrafica VALUES (NEWID(), 'Colombo', 'Giuseppe', 'Via San Giovanni 15', 'Bari', 70100, 'CLMGSU73D55A944K');
INSERT INTO Anagrafica VALUES (NEWID(), 'De Luca', 'Marco', 'Via Dante 10', 'Roma', 00100, 'DLCMRC70A01H501X');
INSERT INTO Anagrafica VALUES (NEWID(), 'Romano', 'Anna', 'Piazza Cavour 4', 'Napoli', 80100, 'RMNNAF85C48H501L');
INSERT INTO Anagrafica VALUES (NEWID(), 'Gatti', 'Francesco', 'Viale della Rimembranza 9', 'Verona', 37100, 'GTTFNC75D44F839Q');
INSERT INTO Anagrafica VALUES (NEWID(), 'Corsi', 'Luca', 'Via delle Nazioni 2', 'Trieste', 34100, 'CRSLCA91C10H501A');
INSERT INTO Anagrafica VALUES (NEWID(), 'Perri', 'Maria', 'Viale dei Tigli 11', 'Livorno', 57100, 'PRRMRA87B40F839T');
INSERT INTO Anagrafica VALUES (NEWID(), 'Tedesco', 'Francesca', 'Via Matteotti 18', 'Catania', 95100, 'TDSFNC76C45A944L');
INSERT INTO Anagrafica VALUES (NEWID(), 'Costa', 'Alberto', 'Corso Italia 14', 'Salerno', 84100, 'CSTALB82A01H501N');
INSERT INTO Anagrafica VALUES (NEWID(), 'Rizzo', 'Valeria', 'Via Piave 20', 'Cosenza', 87100, 'RZZVLR91B50F839E');
INSERT INTO Anagrafica VALUES (NEWID(), 'Marini', 'Paolo', 'Piazza delle Belle Arti 1', 'Reggio Calabria', 89100, 'MRNPLO83C40H501F');
-- inserimento dati Violazione

--'Agente Rizzo' 'Agente Tedesco' 'Agente Neri' 'Agente Lombardi' 'Agente Martini'
INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-20', 'Via Roma 10', 'Agente Rizzo', '2025-03-20', 100.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'RSSMRA80A01H501Z'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Eccesso di velocit�'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-21', 'Via Milano 25', 'Agente Neri', '2025-03-21', 80.00, 1, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'BNCLGU85M01H501R'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Parcheggio in zona vietata'));

INSERT INTO Verbale VALUES
    (NEWID(), '2025-02-22', 'Viale Piave 4', 'Agente Tedesco', '2025-03-22', 120.00, 3, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'VRDGVN70A01H501C'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Soste irregolari'));
INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-23', 'Piazza della Libert� 8', 'Agente Neri', '2025-03-23', 150.00, 4, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'NRIFNC85F50F839C'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Passaggio con semaforo rosso'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-24', 'Via dei Mille 12', 'Agente Rizzo', '2025-03-24', 200.00, 5, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'GLIASL75A01F205Z'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Mancata revisione del veicolo'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-25', 'Viale Europa 6', 'Agente Lombardi', '2025-03-25', 50.00, 1, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'LMBFSO95D43A944P'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Guida senza cinture di sicurezza'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-26', 'Lungomare 3', 'Agente Tedesco', '2025-03-26', 130.00, 3, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'ESPCRL72M23H501J'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Eccesso di velocit�'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-27', 'Via Guglielmo Marconi 7', 'Agente Martini', '2025-03-27', 90.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'MRTLNA89L42L419D'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Parcheggio in zona vietata'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-28', 'Via Garibaldi 21', 'Agente Lombardi', '2025-03-28', 70.00, 1, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'CNTRCM88M01A944P'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Soste irregolari'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2025-01-03', 'Viale dei Tigli 11', 'Agente Lombardi', '2025-02-03', 110.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'PRRMRA87B40F839T'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Passaggio con semaforo rosso'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-03', 'Via Matteotti 18', 'Agente Tedesco', '2025-03-03', 160.00, 4, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'TDSFNC76C45A944L'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Mancata revisione del veicolo'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2024-03-03', 'Corso Italia 14', 'Agente Tedesco', '2024-04-03', 75.00, 1, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'CSTALB82A01H501N'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Guida senza cinture di sicurezza'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2024-04-22', 'Via Piave 20', 'Agente Rizzo', '2024-05-22', 100.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'RZZVLR91B50F839E'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Soste irregolari'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2024-05-12', 'Piazza Cavour 4', 'Agente Rizzo', '2024-06-12', 85.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'RMNNAF85C48H501L'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Eccesso di velocit�'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2022-06-03', 'Viale della Rimembranza 9', 'Agente Martini', '2022-07-03', 95.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'GTTFNC75D44F839Q'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Passaggio con semaforo rosso'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2021-01-30', 'Via delle Nazioni 2', 'Agente Neri', '2021-02-28', 110.00, 3, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'CRSLCA91C10H501A'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Mancata revisione del veicolo'));

INSERT INTO Verbale VALUES 
    (NEWID(), '2024-08-01', 'Piazza delle Belle Arti 1', 'Agente Martini', '2024-09-01', 80.00, 1, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'MRNPLO83C40H501F'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Guida senza cinture di sicurezza'));
INSERT INTO Verbale VALUES 
    (NEWID(), '2024-08-02', 'Piazza delle Belle Arti 1', 'Agente Martini', '2024-09-02', 80.00, 1, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'MRNPLO83C40H501F'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Guida senza cinture di sicurezza'));
--aggiunti per es5
INSERT INTO Verbale VALUES 
    (NEWID(), '2009-02-27', 'Via Pisa 24', 'Agente Martini', '2009-03-27', 90.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'MRTLNA89L42L419D'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Parcheggio in zona vietata'));
INSERT INTO Verbale VALUES 
    (NEWID(), '2009-05-15', 'Via Pisa 24', 'Agente Martini', '2009-06-15', 90.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'CNTRCM88M01A944P'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Parcheggio in zona vietata'));
--inserimento per es 9
INSERT INTO Verbale VALUES 
    (NEWID(), '2024-05-12', 'Piazza Cavour 4', 'Agente Rizzo', '2024-06-12', 85.00, 2, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'CRSLCA91C10H501A'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Eccesso di velocit�'));
--inserimento per es 11
INSERT INTO Verbale VALUES 
    (NEWID(), '2025-02-21', 'Via Napoli 17', 'Agente Neri', '2025-03-21', 280.00, 7, 
     (SELECT idanagrafica FROM Anagrafica WHERE Codice_Fiscale = 'VRDGVN70A01H501C'), 
     (SELECT idviolazione FROM Violazione WHERE Descrizione = 'Eccesso di velocit�'));




--DOPO DECENNI A SCRIVERE LE INSERT inizia la parte divertente??
--1. Conteggio dei verbali trascritti
SELECT COUNT(*) as TotaleVerbali FROM Verbale;

--2 Conteggio dei verbali trascritti raggruppati per anagrafe, 
SELECT A.Codice_Fiscale,A.Cognome, A.Nome, Count(Ve.idverbale) as TotaleVerbaliPersona
FROM Anagrafica as A
LEFT JOIN
Verbale as Ve ON A.idanagrafica = Ve.idanagrafica
GROUP BY A.Codice_Fiscale,A.Cognome, A.Nome;

--3. Conteggio dei verbali trascritti raggruppati per tipo di violazione, 
SELECT Vi.Descrizione ,Count(Ve.idverbale) as TotaleVerbaliTipo
FROM Violazione as Vi
LEFT JOIN 
Verbale AS Ve ON Vi.idviolazione = Ve.idviolazione
GROUP BY Vi.Descrizione;

--4. Totale dei punti decurtati per ogni anagrafe  LeftJoin per mostrare anche i null 
Select A.Codice_Fiscale,A.Cognome, A.Nome, Sum(Ve.DecurtamentoPunti) as Punti_Decurtati
FROM Anagrafica as A
LEFT JOIN
Verbale as Ve On A.idanagrafica= Ve.idanagrafica
GROUP BY A.Codice_Fiscale,A.Cognome, A.Nome;

--5. Cognome, Nome, Data violazione, Indirizzo violazione, importo e punti decurtati per tutti gli anagrafici residenti a Palermo
SELECT A.Cognome, A.Nome, Ve.DataViolazione, Ve.IndirizzoViolazione, Ve.Importo,ve.DecurtamentoPunti
FROM Anagrafica as A
INNER JOIN
Verbale as ve On A.idanagrafica = Ve.idanagrafica
WHERE Citta = 'Palermo';
--6. Cognome, Nome, Indirizzo, Data violazione, importo e punti decurtati per le violazioni fatte tra il febbraio 2009 e luglio 2009 
SELECT A.Cognome, A.Nome, Ve.DataViolazione, Ve.IndirizzoViolazione, Ve.Importo,ve.DecurtamentoPunti
FROM Anagrafica as A
INNER JOIN 
Verbale as Ve On A.idanagrafica= Ve.idanagrafica
WHERE ve.DataViolazione BETWEEN '2009-02-01' AND '2009-07-31';

--7. Totale degli importi per ogni anagrafico leftJoin per i valori null
SELECT A.Codice_Fiscale,A.Cognome, A.Nome, Sum(Ve.Importo) as ImportoTotale
FROM Anagrafica AS A
LEFT JOIN
Verbale AS Ve ON A.idanagrafica = Ve.idanagrafica
Group by A.Codice_Fiscale,A.Cognome, A.Nome;
--8. Visualizzazione di tutti gli anagrafici residenti a Palermo, 
SELECT * FROM Anagrafica WHERE Citta = 'Palermo';

--9. Query che visualizzi Data violazione, Importo e decurtamento punti relativi ad una certa data, 
SELECT DataViolazione , Importo, DecurtamentoPunti 
FROM Verbale
WHERE DataViolazione = '2024-05-12'; --data formato aaaa-mm-gg

--10. Conteggio delle violazioni contestate raggruppate per Nominativo dell�agente di Polizia
SELECT NominativoAgente, Count(idverbale) as numeroViolazioni
From Verbale 
Group BY NominativoAgente;

--11. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino il decurtamento di 5 punti, 
SELECT A.Cognome, A.Nome,Ve.IndirizzoViolazione, Ve.DataViolazione,  Ve.Importo, ve.DecurtamentoPunti
FROM Anagrafica as A
INNER JOIN
Verbale as Ve On A.idanagrafica = Ve.idanagrafica
WHERE ve.DecurtamentoPunti > 5;

--12. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino l�importo di 400 euro.  --Non ci sono record con 400 puo essere verificato con un importo minore
SELECT A.Cognome, A.Nome, Ve.IndirizzoViolazione, Ve.DataViolazione,  Ve.Importo, ve.DecurtamentoPunti
FROM Anagrafica as A
INNER JOIN
Verbale as Ve On A.idanagrafica = Ve.idanagrafica
WHERE Ve.Importo > 400.00;

--Query 13 - Numero di verbali e importo totale delle multe emesse per ogni agente di polizia
SELECT NominativoAgente, Count(idVerbale)as NumeroVerbali , Sum(Importo) As ImportoTotale
FROM Verbale
GROUP BY NominativoAgente;

--Query 14 - Media degli importi delle multe per tipo di violazione
Select Vi.Descrizione, AVG(Ve.Importo) as Media_Importi_Multe
FROM Verbale AS Ve
INNER JOIN
Violazione As Vi On Ve.idviolazione = Vi.idviolazione
GROUP BY Vi.Descrizione;
