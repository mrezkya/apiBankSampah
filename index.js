const express = require('express')
const mysql = require("mysql2");
const cors = require("cors");
const app = express()
const port = 3000

const connection = mysql.createConnection({
  host: "127.0.0.1",
  user: "panini",
  password: "password",
  database: "api_Sank_Sampah",
});
const bodyParser = require("body-parser");
app.use(bodyParser.json());
app.use(cors());


connection.connect((err) => {
    if (err) {
      return console.error("error: " + err.message);
    }
    console.log("Connected to the MySQL server.");
})

app.get('/', (req, res) => {
    connection.query("SELECT * FROM pengguna", (err, results) => {
            if (err) {
              return res.status(500).send(err);
            }
            res.json(results);
    })
})


// bagian login
app.post('/login/', (req, res) => {
    const username = req.body.username
    connection.query(`SELECT * FROM pengguna WHERE NIK = ? ; `, [username], (err, results) => {
            if (results.length === 0) {
                res.json({ Status: false });
            }else{
                res.json({ Status: true });
            }
    })
})
app.get('/user/:username', (req, res) => {
    const username = req.params.username
    connection.query(`SELECT * FROM pengguna WHERE NIK = "${username}"`, (err, results) => {
            if (results.length === 0) {
                res.json({ Status: false });
            }else{
                res.json({ results });
            }
    })
})


app.get("/milestone/:tahun/:bulan", (req, res) => {
  const bulan = req.params.bulan
  const tahun = req.params.tahun;
  connection.query(`select Berat_Sampah from pesanan WHERE month(pesanan.Waktu)=${bulan} and year(pesanan.Waktu)=${tahun}`, (err, results) => {
    let total = 0
    results.forEach((row) => {
      total += row.Berat_Sampah
    })
    res.json({ total })
  })
})



// bagian untuk menambahkan data
app.post("/tambahPesanan", (req,res) => {
    const {
      Nama,
      Jenis_Sampah,
      Berat_Sampah,
      Nomor_HP,
      Alamat,
      kordinat_A,
      kordinat_B,
      Waktu,
    } = req.body;

const querySql = `
  INSERT INTO pesanan (Nama, Jenis_Sampah, Berat_Sampah, Nomor_HP, Alamat, kordinat_A, kordinat_B, Waktu) 
  VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
const values = [
  Nama,
  Jenis_Sampah,
  Berat_Sampah,
  Nomor_HP,
  Alamat,
  kordinat_A,
  kordinat_B,
  Waktu,
];


      connection.query(querySql, values, (err, results) => {
        if(err){
            console.log(err)
        }else{
            res.json({
                status: true})
        }
      })
})
// bagian melihat pesanan
app.get("/pesanan/", (req,res) => {
    connection.query("SELECT * FROM pesanan", (err, results) => {
        if (err) {
          return res.status(500).send(err);
        }
        res.json(results);
    })
} )

app.get("/pesananTest/:tahun/:bulan", (req, res) => {
  const tahun = req.params.tahun
  const bulan = req.params.bulan
  connection.query(`SELECT * FROM pesanan WHERE month(pesanan.Waktu)=${bulan} and year(pesanan.Waktu)=${tahun}`, (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
});

app.get("/pesananDelete/:id", (req, res) => {
  const id = req.params.id;

  // Ganti tanda kutip tunggal dengan backtick untuk tabel dan kolom
  connection.query(
    `DELETE FROM \`pesanan\` WHERE \`id_Pesan\` = ?`,
    [id],
    (err, results) => {
      if (err) {
        res.send("gagal")
      }
      res.json(results);
    }
  );
});


app.post("/tambahPengguna", (req, res) => {
  const { NIK, username, nomor_hp, email, alamat, auth } = req.body;

  const queryTambah = `INSERT INTO pengguna (NIK, username, nomor_hp, email, alamat, auth) VALUES (?, ?, ?, ?, ?, 'user')`;

  connection.query(
    queryTambah,
    [NIK, username, nomor_hp, email, alamat],
    (err, results) => {
      if (err) {
        return res.status(500).send(err);
      }
      res.json({
        status: true,
        message: "Pengguna berhasil ditambahkan",
        results: results,
      });
    }
  );
});



app.listen(port, () => {
    console.log(`http://localhost:${port}`)
})