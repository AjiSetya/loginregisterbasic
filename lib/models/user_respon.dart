part of 'models.dart';

class UserRespon {
  String message;
  String hasil;
  List<User> user;

  UserRespon({this.message, this.hasil, this.user});

  UserRespon.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    hasil = json['hasil'];
    if (json['user'] != null) {
      user = new List<User>();
      json['user'].forEach((v) {
        user.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['hasil'] = this.hasil;
    if (this.user != null) {
      data['user'] = this.user.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String idkaryawan;
  String nik;
  String nama;
  String hp;
  String alamat;
  String iduser;
  String username;
  String email;
  String password;
  String usernik;

  User(
      {this.idkaryawan,
        this.nik,
        this.nama,
        this.hp,
        this.alamat,
        this.iduser,
        this.username,
        this.email,
        this.password,
        this.usernik});

  User.fromJson(Map<String, dynamic> json) {
    idkaryawan = json['idkaryawan'];
    nik = json['nik'];
    nama = json['nama'];
    hp = json['hp'];
    alamat = json['alamat'];
    iduser = json['iduser'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    usernik = json['usernik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idkaryawan'] = this.idkaryawan;
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['hp'] = this.hp;
    data['alamat'] = this.alamat;
    data['iduser'] = this.iduser;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['usernik'] = this.usernik;
    return data;
  }
}
