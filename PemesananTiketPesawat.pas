program PemesananTiketPesawatOnline;
{ Bismillah tugas besar DAP semoga lancar dan diberikan kemudahan aamiin... :-) }

uses crt;

type
    Tiket  = record
            nama : string;
            alamat : string;
            nomortelepon : string;
            kelas : string;
            kotaasal : string;
            kotatujuan : string;
            tanggalberangkat : string;
            jamberangkat : string ;
            harga: string;
    end;

type
    Update = record
        tanggal : string;
        kotaasal : string;
        kotatujuan : string;
        hargatiketekonomi : string;
        hargatiketbisnis : string;
    end;

type
    JenisKota = record
        Harga : array [1..10] of Update;
    end;
type
    Jumlah = record
        namakota : string;
        nTotal : integer;
    end;

procedure menuAwal(); forward;
procedure menuAdminAwal(); forward;
procedure menuAdmin1(); forward;
procedure updateHargaTiket(); forward;
procedure updatesalahsatu(); forward;
procedure menuPemesanAwal(); forward;
procedure informasiPenerbangan(); forward;
procedure cariKota(); forward;
procedure BockingTiket(); forward;
procedure hapus(); forward;
procedure penutup(); forward;
procedure Urutan(); forward;

var
    HargaSeluruhnya : array [1..10] of JenisKota;
    Data : array [1..9999] of Tiket;
    Urut : array [1..10] of Jumlah;
    HasilUrut : array [1..10] of Jumlah;
    i : integer;
    bandung : integer;
    malang : integer;
    yogjakarta : integer;
    bandarlampung : integer;
    surabaya : integer;
    medan : integer;
    denpasar : integer;
    palembang : integer;
    bandaaceh : integer;
    lombok : integer;

    {deklarasi File}
    dataupdate : text;
    datapesan : text;
    dataurut : text;



procedure menuAwal();
{procedure untuk menampilkan menu diawal aplikasi}
var
        pilihan : string;
begin
        clrscr;
        gotoxy(30,2); writeln('Selamat Datang Di Layanan Pemesanan Tiket Pesawat Online');
        gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
        gotoxy(15,4); writeln('================================================================================');
        writeln;
        gotoxy(20,6); writeln('Masuk Sebagai :');
        gotoxy(20,8); writeln('1. Admin');
        gotoxy(20,9); writeln('2. Pemesan ');
        gotoxy(20,10); writeln('3. Exit');
        gotoxy(20,12); write('Masukan Pilihan : '); readln (pilihan);

        if  (pilihan = '1') then
                 menuAdminAwal()
        else if  (pilihan ='2') then
                 menuPemesanAwal()
        else if (pilihan='3') then
                 exit;
end;

procedure menuAdminAwal();
{Procedure Menu untuk memasukan ID Admin}
var
        id : string;
begin
        clrscr;
        gotoxy(30,2); writeln('Selamat Datang Di Layanan Pemesanan Tiket Pesawat Online');
        gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
        gotoxy(15,4); writeln('================================================================================');
        writeln;
        gotoxy(29,7); write('Masukan ID : '); readln(id);

        if (id='qwertyuiop') then
             begin
                menuAdmin1()
             end
        else

               gotoxy(20,9); writeln('ID Tidak Terdaftar');
                repeat
                        begin
                                gotoxy(20,11); write('Masukan ID : '); readln(id);

                                if (id='qwertyuiop') then
                                        menuAdmin1()
                                else
                                        gotoxy(20,13); writeln ('ID Tidak Terdaftar');

                        end;
                until (id='qwertyuiop');
end;

procedure menuAdmin1();
{Procedure menu jika admin berhasil memasukan ID}
var
        pilihan : string;
begin
        clrscr;
        gotoxy(40,2); writeln('Layanan Pemesanan Tiket Pesawat Online');
        gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
        gotoxy(15,4); writeln('================================================================================');
        writeln;
        gotoxy(20,6);  writeln('Silahkan Pilih Menu Dibawah ini :');
        gotoxy(20,8);  writeln('1. Update Data Seluruhnya');
        gotoxy(20,9);  writeln('2. Update Salah Satu Data');
        gotoxy(20,10); writeln('3. Manu Awal');
        gotoxy(20,11); writeln('4. Exit');
        gotoxy(20,12); write('Masukan Pilihan : '); readln (pilihan);


        if (pilihan= '1') then
            begin
                updateHargaTiket();
            end
        else if (pilihan='2') then
            begin
                updatesalahsatu();
            end
        else if (pilihan = '3') then
            begin
                menuAwal();
            end
        else
            exit;
end;

procedure updateHargaTiket();
{procedure untuk mengupdate harga tiket pesawat}
var
     j,k : integer;
     pilihan : string;
begin
    clrscr;
    assign(dataupdate, 'DATA UPDATE HARGA.txt');
    rewrite(dataupdate);

    gotoxy(40,2); writeln('Halaman Update Harga Tiket Pesawat Online');
    gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
    writeln('======================================================================================================================');
    writeln;

    for  k := 1 to 10 do
    {perulangan yang datanya disimpan ke array HargaSeluruhnya}
        begin
            for  j := 1 to 9 do
            {perulangan yang datanya disimpan ke array Harga}
                begin
                    write('Tanggal Keberangkatan      : '); readln (HargaSeluruhnya[k].Harga[j].tanggal); writeln (dataupdate, HargaSeluruhnya[k].Harga[j].tanggal);
                    write('Kota Asal                  : '); readln (HargaSeluruhnya[k].Harga[j].kotaasal); writeln (dataupdate, HargaSeluruhnya[k].Harga[j].kotaasal);
                    write('Kota Tujuan                : '); readln (HargaSeluruhnya[k].Harga[j].kotatujuan); writeln (dataupdate, HargaSeluruhnya[k].Harga[j].kotatujuan);
                    write('Harga Tiket Kelas Ekonomi  : '); readln (HargaSeluruhnya[k].Harga[j].hargatiketekonomi); writeln (dataupdate, HargaSeluruhnya[k].Harga[j].hargatiketekonomi);
                    write('Harga Tiket Kelas Bisnis   : '); readln (HargaSeluruhnya[k].Harga[j].hargatiketbisnis); writeln (dataupdate, HargaSeluruhnya[k].Harga[j].hargatiketbisnis);
                    writeln;
                end;
        end;

    close(dataupdate);

    writeln;
    write('Selesai (Yes/No) : '); readln(pilihan);
    { hanya untuk memindahkan halaman ke halaman admin1}

    if (upcase(pilihan) ='YES') then
        menuAdmin1()
    else if (upcase(pilihan) = 'NO') then
        menuAdmin1();

end;

procedure updatesalahsatu();
var
    asal : string;
    tujuan : string;
    pernyataan : string;
    o : integer;
    l : integer;
    pos : integer;
begin
    clrscr;

    assign(dataupdate, 'DATA UPDATE HARGA.txt');
    reset (dataupdate);

    gotoxy(40,2); writeln('Halaman Update Harga Tiket Pesawat Online');
    gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
    writeln('======================================================================================================================');
    writeln;

    o:=0;
    pos :=0;
    write('Masukan Kota Asal  : '); readln(asal);
    write('Masukan Kota Tujuan : '); readln(tujuan);
    clrscr;
    gotoxy (40,1); writeln('INFORMASI HARGA TIKET');


    repeat
        begin
             o:=o+1;

             for l:= 1 to 10 do
                begin
                    readln (dataupdate, HargaSeluruhnya[o].Harga[l].tanggal);
                    readln (dataupdate, HargaSeluruhnya[o].Harga[l].kotaasal);
                    readln (dataupdate, HargaSeluruhnya[o].Harga[l].kotatujuan);
                    readln (dataupdate, HargaSeluruhnya[o].Harga[l].hargatiketekonomi);
                    readln (dataupdate, HargaSeluruhnya[o].Harga[l].hargatiketbisnis);

                    if (upcase(HargaSeluruhnya[o].Harga[l].kotaasal) = upcase(asal)) and (upcase(HargaSeluruhnya[o].Harga[l].kotatujuan) = upcase(tujuan)) then
                        begin

                            pos:= pos +1;

                            writeln('Tanggal Keberangkatan      : ', HargaSeluruhnya[o].Harga[l].tanggal);
                            writeln('Kota Asal                  : ', HargaSeluruhnya[o].Harga[l].kotaasal);
                            writeln('Kota Tujuan                : ', HargaSeluruhnya[o].Harga[l].kotatujuan);
                            writeln('Harga Tiket Kelas Ekonomi  : ', HargaSeluruhnya[o].Harga[l].hargatiketekonomi);
                            writeln('Harga Tiket Kelas Bisnis   : ', HargaSeluruhnya[o].Harga[l].hargatiketbisnis);
                            writeln;

                            write('Apakah data ini akan di update ? (Yes/No) : '); readln(pernyataan);
                            writeln;
                            if (upcase(pernyataan) ='YES') then
                                begin
                                    write('Tanggal Keberangkatan      : '); readln (HargaSeluruhnya[o].Harga[l].tanggal); writeln (dataupdate, HargaSeluruhnya[o].Harga[l].tanggal);
                                    write('Kota Asal                  : '); readln (HargaSeluruhnya[o].Harga[l].kotaasal); writeln (dataupdate, HargaSeluruhnya[o].Harga[l].kotaasal);
                                    write('Kota Tujuan                : '); readln (HargaSeluruhnya[o].Harga[l].kotatujuan); writeln (dataupdate, HargaSeluruhnya[o].Harga[l].kotatujuan);
                                    write('Harga Tiket Kelas Ekonomi  : '); readln (HargaSeluruhnya[o].Harga[l].hargatiketekonomi); writeln (dataupdate, HargaSeluruhnya[o].Harga[l].hargatiketekonomi);
                                    write('Harga Tiket Kelas Bisnis   : '); readln (HargaSeluruhnya[o].Harga[l].hargatiketbisnis); writeln (dataupdate, HargaSeluruhnya[o].Harga[l].hargatiketbisnis);
                                    writeln;
                                end
                            else if (upcase(pernyataan) = 'NO') then
                                    begin
                                        menuAwal();
                                    end;
                        end;
                end;
        end;
    until (o=9999);

    if (pos = 0) then
        begin
            writeln('Kota yang anda cari tidak ditemukan');
        end;

    close(dataupdate);
    menuAwal();

end;


procedure menuPemesanAwal();
{procedure untuk menampilkan menu awal pemesan jika user memilih menu pemesan}
var
        pilihan : string;
begin
        clrscr;
        gotoxy(30,2); writeln('Selamat Datang Di Layanan Pemesanan Tiket Pesawat Online');
        gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
        gotoxy(15,4); writeln('================================================================================');
        writeln;
        gotoxy(20,6);  writeln('Silahkan Pilih Menu Dibawah ini :');
        gotoxy(20,8);  writeln('1. Informasi Penerbangan');
        gotoxy(20,9);  writeln('2. Informasi Kota Tujuan Terlaris');
        gotoxy(20,10); writeln('3. Bocking Tiket');
        gotoxy(20,11); writeln('4. Batalkan Pesanan');
        gotoxy(20,12); writeln('5. Manu Awal');
        gotoxy(20,13); writeln('6. Exit');
        gotoxy(20,15); write('Masukan Pilihan : '); readln(pilihan);

        if (pilihan = '1') then
            begin
                informasiPenerbangan();
            end
        else if (pilihan='2') then
            begin
                Urutan();
            end
        else if (pilihan='3') then
            begin
                BockingTiket();
            end
        else if (pilihan ='4') then
            begin
                hapus();
            end
        else if (pilihan='5') then
            begin
                menuAwal();
            end
        else
            exit;
end;

procedure informasiPenerbangan();
{procedure untuk memberikan informasi mengenai harga tiket}
var
    asal : string;
    pilih : string;
begin
    clrscr;
    gotoxy(40,2); writeln('Halaman Update Harga Tiket Pesawat Online');
    gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
    writeln('======================================================================================================================');
    writeln;
    writeln('Berikut adalah kota tujuan yang disediakan oleh maskapai penerbangan Abaness Air :');
    writeln;
    writeln('1. Bandung                     7.  Denpasar');
    writeln('2. Malang                      8.  Palembang');
    writeln('3. Yogjakarta                  9.  Banda Aceh' );
    writeln('4. Bandar Lampung              10. Lombok' );
    writeln('5. Surabaya ');
    writeln('6. Medan ');
    writeln;

    cariKota();
end;


procedure cariKota();
{Procedure untuk mencari informasi harga tiket}
var
    cari, ya : string;
    y, z, pos : integer;
begin

    assign(dataupdate, 'DATA UPDATE HARGA.txt');
    reset(dataupdate);
    z:=0;
    pos :=0;
    write('Masukan Kota Asal untuk mengetahui informasi harga tiket : '); readln(cari);

    clrscr;
    gotoxy (40,1); writeln('INFORMASI HARGA TIKET');


    repeat
        begin
             z:=z+1;

             for y:= 1 to 10 do
                begin
                    readln (dataupdate, HargaSeluruhnya[z].Harga[y].tanggal);
                    readln (dataupdate, HargaSeluruhnya[z].Harga[y].kotaasal);
                    readln (dataupdate, HargaSeluruhnya[z].Harga[y].kotatujuan);
                    readln (dataupdate, HargaSeluruhnya[z].Harga[y].hargatiketekonomi);
                    readln (dataupdate, HargaSeluruhnya[z].Harga[y].hargatiketbisnis);

                    if upcase(HargaSeluruhnya[z].Harga[y].kotaasal) = upcase(cari) then
                        begin

                            pos:= pos +1;

                            writeln('Tanggal Keberangkatan      : ', HargaSeluruhnya[z].Harga[y].tanggal);
                            writeln('Kota Asal                  : ', HargaSeluruhnya[z].Harga[y].kotaasal);
                            writeln('Kota Tujuan                : ', HargaSeluruhnya[z].Harga[y].kotatujuan);
                            writeln('Harga Tiket Kelas Ekonomi  : ', HargaSeluruhnya[z].Harga[y].hargatiketekonomi);
                            writeln('Harga Tiket Kelas Bisnis   : ', HargaSeluruhnya[z].Harga[y].hargatiketbisnis);
                            writeln;
                            writeln('Klik ENTER Untuk Informasi Selanjutnya');
                            readln;
                    end;
                end;
        end;
    until (z=10);
    if (pos = 0) then
        begin
            writeln('Kota yang anda cari tidak ditemukan');
        end;

    write('Kembali kemenu utama?(Yes/No) : '); readln(ya);
        if  (upcase(ya) ='YES') then
            begin
                 menuAwal();
            end;
    close(dataupdate);




end;


procedure BockingTiket();
var
        pilihan : string;
        m,n : integer;
begin
    clrscr;
        assign(datapesan, 'DATA PEMESAN.txt');
        append(datapesan);
        assign(dataupdate, 'DATA UPDATE HARGA.txt');
        reset(dataupdate);
        assign(dataurut, 'DATA SORTING.txt');
        rewrite(dataurut);


        repeat
        begin
            clrscr;
            gotoxy(30,2); writeln('Selamat Datang Di Layanan Pemesanan Tiket Pesawat Online');
            gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
            gotoxy(15,4); writeln('================================================================================');
            writeln;
            i := i + 1;
            gotoxy(20,6); writeln('Silahkan Isi Data Dibawah ini ');
            writeln;
            gotoxy(20,8);  write('Nama Lengkap                   : '); readln (Data[i].nama);   writeln (datapesan, Data[i].nama);
            gotoxy(20,9);  write('Alamat                         : '); readln (Data[i].alamat); writeln (datapesan, Data[i].alamat);
            gotoxy(20,10); write('Nomor Telepon                  : '); readln (Data[i].nomortelepon);  writeln (datapesan, Data[i].nomortelepon);
            gotoxy(20,11); write('Kota Asal                      : '); readln (Data[i].kotaasal);  writeln (datapesan, Data[i].kotaasal);
            gotoxy(20,12); write('Kota Tujuan                    : '); readln (Data[i].kotatujuan);  writeln (datapesan, Data[i].kotatujuan);
            gotoxy(20,13); write('Kelas (ekonomi/bisnis)         : '); readln (Data[i].kelas);  writeln (datapesan, Data[i].kelas);
            gotoxy(20,14); write('Tangaal Berangkat (DD/MM/YYYY) : '); readln (Data[i].tanggalberangkat);  writeln (datapesan, Data[i].tanggalberangkat);
            gotoxy(20,15); write('Jam Berangkat                  : '); readln (Data[i].jamberangkat);  writeln (datapesan, Data[i].jamberangkat);

            if ((upcase(Data[i].kotatujuan)) = 'BANDUNG') then
                begin
                    Urut[1].nTotal := bandung + 1; writeln (dataurut, Urut[1].nTotal);
                    Urut[1].namakota := 'Bandung'; writeln (dataurut, Urut[1].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'MALANG') then
                begin
                    Urut[2].nTotal := malang + 1; writeln (dataurut, Urut[2].nTotal);
                    Urut[2].namakota := 'Malang'; writeln (dataurut, Urut[2].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'YOGJAKARTA') then
                begin
                    Urut[3].nTotal := yogjakarta + 1; writeln (dataurut, Urut[3].nTotal);
                    Urut[3].namakota := 'Yogjakarta'; writeln (dataurut, Urut[3].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'BANDAR LAMPUNG') then
                begin
                    Urut[4].nTotal := bandarlampung + 1; writeln (dataurut, Urut[4].nTotal);
                    Urut[4].namakota := 'Bandar Lampung'; writeln (dataurut, Urut[4].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'SURABAYA') then
                begin
                    Urut[5].nTotal := surabaya + 1; writeln (dataurut, Urut[5].nTotal);
                    Urut[5].namakota := 'Surabaya'; writeln (dataurut, Urut[5].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'MEDAN') then
                begin
                    Urut[6].nTotal := medan + 1; writeln (dataurut, Urut[6].nTotal);
                    Urut[6].namakota := 'Medan'; writeln (dataurut, Urut[6].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'DENPASAR') then
                begin
                    Urut[7].nTotal := denpasar + 1; writeln (dataurut, Urut[7].nTotal);
                    Urut[7].namakota := 'Denpasar'; writeln (dataurut, Urut[7].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'PALEMBANG') then
                begin
                    Urut[8].nTotal := palembang + 1; writeln (dataurut, Urut[8].nTotal);
                    Urut[8].namakota := 'Palembang'; writeln (dataurut, Urut[8].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'BANDA ACEH') then
                begin
                    Urut[9].nTotal := bandaaceh + 1; writeln (dataurut, Urut[9].nTotal);
                    Urut[9].namakota := 'Banda Aceh'; writeln (dataurut, Urut[9].namakota);
                end
            else if ((upcase(Data[i].kotatujuan)) = 'LOMBOK') then
                begin
                    Urut[10].nTotal := lombok + 1; writeln (dataurut, Urut[10].nTotal);
                    Urut[10].namakota := 'Lombok'; writeln (dataurut, Urut[10].namakota);
                end;

            gotoxy(40,17); writeln('DATA PESANAN TIKET');

            m := 0;
            repeat
                begin
                    m := m+1;

                    for n:= 1 to 10 do
                        begin
                            readln (dataupdate, HargaSeluruhnya[m].Harga[n].tanggal);
                            readln (dataupdate, HargaSeluruhnya[m].Harga[n].kotaasal);
                            readln (dataupdate, HargaSeluruhnya[m].Harga[n].kotatujuan);
                            readln (dataupdate, HargaSeluruhnya[m].Harga[n].hargatiketekonomi);
                            readln (dataupdate, HargaSeluruhnya[m].Harga[n].hargatiketbisnis);

                            if ((upcase(Data[i].kotaasal)) = (upcase(HargaSeluruhnya[m].Harga[n].kotaasal))) and ((upcase(Data[i].kotatujuan)) = (upcase(HargaSeluruhnya[m].Harga[n].kotatujuan))) then
                                begin
                                    gotoxy(20,18); writeln('Nama Lengkap                   : ', Data[i].nama);
                                    gotoxy(20,19); writeln('Alamat                         : ', Data[i].alamat);
                                    gotoxy(20,20); writeln('Nomor Telepon                  : ', Data[i].nomortelepon);
                                    gotoxy(20,21); writeln('Kota Asal                      : ', HargaSeluruhnya[m].Harga[n].kotaasal);
                                    gotoxy(20,22); writeln('Kota Tujuan                    : ', HargaSeluruhnya[m].Harga[n].kotatujuan);
                                    gotoxy(20,23); writeln('Kelas                          : ', Data[i].kelas);
                                    gotoxy(20,24); writeln('Tangaal Berangkat              : ', Data[i].tanggalberangkat);
                                    gotoxy(20,25); writeln('Jam Berangkat                  : ', Data[i].jamberangkat);

                                    if (upcase(Data[i].kelas) = 'EKONOMI') then
                                        begin
                                            Data[i].harga := HargaSeluruhnya[m].Harga[n].hargatiketekonomi;  writeln(datapesan, Data[i].harga);
                                            gotoxy(20,26); writeln('Jumlah Pembayaran              : ', Data[i].harga);
                                        end
                                    else if (upcase(Data[i].kelas) = 'BISNIS') then
                                        begin
                                            Data[i].harga := HargaSeluruhnya[m].Harga[n].hargatiketbisnis;   writeln(datapesan, Data[i].harga);
                                            gotoxy(20,26); writeln('Jumlah Pembayaran               : ', Data[i].harga);
                                        end;
                                end;
                        end;
                end;
            until (m=10);


            gotoxy(20,28); write('Apakah Anda ingin mengimpiutkan data lagi (Ya/Tidak) : '); readln(pilihan);


            if (upcase(pilihan) = 'TIDAK') then
                begin
                    penutup();
                    menuAwal();
                end;
        end;
        until (upcase(pilihan) ='TIDAK');
        close(datapesan);
        close(dataupdate);
        close(dataurut);
end;

procedure penutup();
{muncul jika user sudah menginputkan data dan sudah berhasil menyimpan data}
begin
         clrscr;
         gotoxy(30,2); writeln('Selamat Datang Di Layanan Pemesanan Tiket Pesawat Online');
         gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
         gotoxy(15,4); writeln('================================================================================');
         writeln;
         gotoxy(20,6); writeln('TERIMAKASIH TELAH MENGGUKANA LAYANAN DARI MASKAPAI PENERBAGNGAN ABANESS AIR');
         gotoxy(40,7); writeln('NIKMATI LAYANAN LAIN DARI ABANESS AIR');
         readln;
end;


procedure hapus();
var
    nama, del : string;
    x: integer;
    pos : boolean;
begin
    clrscr;
    assign(datapesan, 'DATA PEMESAN.txt');
    reset (datapesan);

    gotoxy(30,2); writeln('Halaman Pembatalan Pemesanan Tiket Pesawat Online');
    gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
    gotoxy(15,4); writeln('================================================================================');
    writeln;

    gotoxy (20,6); write('Cari nama : '); readln(nama);

    x := 0;
    pos := false;

    repeat
        begin
            x:= x+1;

            readln (datapesan, Data[x].nama);
            readln (datapesan, Data[x].alamat);
            readln (datapesan, Data[x].nomortelepon);
            readln (datapesan, Data[x].kotaasal);
            readln (datapesan, Data[x].kotatujuan);
            readln (datapesan, Data[x].kelas);
            readln (datapesan, Data[x].tanggalberangkat);
            readln (datapesan, Data[x].jamberangkat);
            readln (datapesan, Data[x].harga);



            if upcase(Data[x].nama) = upcase(nama) then
                begin

                    pos := true;

                    gotoxy(20,8);  writeln('Nama Lengkap                   : ',Data[x].nama);
                    gotoxy(20,9);  writeln('Alamat                         : ',Data[x].alamat);
                    gotoxy(20,10); writeln('Nomor Telepon                  : ',Data[x].nomortelepon);
                    gotoxy(20,11); writeln('Kota Asal                      : ',Data[x].kotaasal);
                    gotoxy(20,12); writeln('Kota Tujuan                    : ',Data[x].kotatujuan);
                    gotoxy(20,13); writeln('Kelas                          : ',Data[x].kelas);
                    gotoxy(20,14); writeln('Tangaal Berangkat              : ',Data[x].tanggalberangkat);
                    gotoxy(20,15); writeln('Jam Berangkat                  : ',Data[x].jamberangkat);
                    gotoxy(20,16); writeln('Jumlah Pembayaran              : ',Data[x].harga);


                    gotoxy(20,18); write('Batalkan Pemesanan ? (Yes/No) : '); readln (del);

                    if (del='Yes') then
                        begin
                            Data[x].nama := '0';
                            Data[x].alamat := '0';
                            Data[x].nomortelepon := '0';
                            Data[x].kotaasal := '0';
                            Data[x].kotatujuan := '0';
                            Data[x].kelas := '0';
                            Data[x].tanggalberangkat := '0';
                            Data[x].jamberangkat := '0';
                            Data[i].harga := '0';
                        end;
                end
        end;
    until (pos=true) or (x=9999);

    if (pos = false) then
        begin
            writeln('Maaf Nama yang Anda Masukan Tidak Tercantum');
        end;
    menuAwal();

end;

procedure Urutan();
var
    depan : integer;
    akhir : integer;
    max : integer;
    q : integer;
    nampung : integer;
    b: integer;
begin
    clrscr;
    assign(dataurut, 'DATA SORTING.txt');
    reset(dataurut);

    gotoxy(30,2); writeln('Halaman Informasi Pemesanan Tiket Pesawat Online');
    gotoxy(42,3); writeln('Maskapai Penerbangan Abaness Air');
    gotoxy(15,4); writeln('================================================================================');
    writeln;

    akhir := 10;

    for depan := 1 to ( akhir-1) do
        begin
            read (dataurut, Urut[depan].nTotal);
            read (dataurut, Urut[depan].namakota);

            max := depan;

            for q := depan + 1 to akhir do
                begin
                    if   (Urut[q].nTotal) >  (Urut[max].nTotal) then
                        begin
                            max := q;
                        end;
                    nampung :=  Urut[max].nTotal;
                    Urut[max].nTotal := Urut[depan].nTotal;
                    Urut[depan].nTotal := nampung;
                end;
        end;

    writeln('Urutan Kota Yang Sering Dikunjungi :');
    writeln;
    for b := 1 to 10 do
        begin
            writeln ('Kota  : ', Urut[b].namakota);
            writeln ('Jumlah : ', Urut[b].nTotal);
            writeln;
        end;
    readln;
    close(dataurut);

end;

BEGIN
        i := 0 ;
        bandung := 0;
        malang := 0;
        yogjakarta := 0;
        bandarlampung := 0;
        surabaya := 0;
        medan := 0;
        denpasar := 0;
        palembang := 0;
        bandaaceh := 0;
        lombok := 0;

        menuAwal();
END.
