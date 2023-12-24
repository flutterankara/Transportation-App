import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/bloc/profile_bloc.dart';
import '../viewModel/profile_view_model.dart';


@RoutePage()
class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final profileViewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(  // BlocProvider ile UserProfileBloc'u sağlıyoruz.
      create: (context) => ProfileBloc(profileViewModel),  // UserProfileViewModel sınıfını burada sağlamalısınız.
      child: BlocBuilder<ProfileBloc, ProfileState>(  // BlocBuilder ile state değişimlerini dinliyoruz.
        builder: (context, state) {
          // İlk state UserProfileInitial ise, profil bilgilerini yüklemek için LoadUserProfile event'ini tetikliyoruz.
          if (state is ProfileInitial) {
            BlocProvider.of<ProfileBloc>(context).add(LoadUserProfile());
            return CircularProgressIndicator();  // Yükleniyor göstergesini gösteriyoruz.
          }

          // Eğer state yükleme durumundaysa, yükleniyor göstergesini gösteriyoruz.
          if (state is ProfileLoading) {
            return CircularProgressIndicator();
          }

          // Eğer yükleme başarılı olmuşsa, yüklenen kullanıcı bilgilerini gösteriyoruz.
          if (state is ProfileLoaded) {
            return Scaffold(
        appBar: AppBar(
          title: Text("Profili Düzenle"),
        ),
        body: Form(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            children: <Widget>[
            ],
          ),
        )
      );
          }

          // Eğer bir hata olmuşsa, hatayı ekrana yazdırıyoruz.
          if (state is ProfileError) {
            return Text('Error: ${state.error}');
          }

          return SizedBox.shrink();  // Diğer durumlar için boş bir widget döndürüyoruz.
       },
      ),
    );
  }
}