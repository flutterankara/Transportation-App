import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/bloc/profile_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
    @override
  Widget build(BuildContext context) {

    return BlocProvider(  // BlocProvider ile UserProfileBloc'u sağlıyoruz.
      create: (context) => ProfileBloc(new ProfileViewModel()),  // UserProfileViewModel sınıfını burada sağlamalısınız.
      child: BlocBuilder<UserProfileBloc, UserProfileState>(  // BlocBuilder ile state değişimlerini dinliyoruz.
        builder: (context, state) {
          // İlk state UserProfileInitial ise, profil bilgilerini yüklemek için LoadUserProfile event'ini tetikliyoruz.
          if (state is UserProfileInitial) {
            BlocProvider.of<UserProfileBloc>(context).add(LoadUserProfile());
            return CircularProgressIndicator();  // Yükleniyor göstergesini gösteriyoruz.
          }

          // Eğer state yükleme durumundaysa, yükleniyor göstergesini gösteriyoruz.
          if (state is UserProfileLoading) {
            return CircularProgressIndicator();
          }

          // Eğer yükleme başarılı olmuşsa, yüklenen kullanıcı bilgilerini gösteriyoruz.
          if (state is UserProfileLoaded) {
            return Scaffold(
        backgroundColor: _currentTheme!.colorScheme.background,
        appBar: AppBar(
          title: Text("Profili Düzenle"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            children: <Widget>[
              Text(state.userProfile.email,
                style: TextStyle(color: _currentTheme.textSelectionTheme.selectionColor)),
              TextFormField(
                initialValue: state.userProfile.firstName,
                onChanged: (value) {
                  state.userProfile.firstName = value;
                },
                decoration: InputDecoration(
                  labelText: '${getTranslated(context, 'name')}',
                  labelStyle: TextStyle(color: _currentTheme.textSelectionTheme.selectionColor),
                ),
              ),
              TextFormField(
                
                initialValue: state.userProfile.lastName,
                onChanged: (value) {
                  state.userProfile.lastName = value;
                },
                decoration: InputDecoration(
                  labelText: '${getTranslated(context, 'Surname')}',
                  labelStyle: TextStyle(color: _currentTheme.textSelectionTheme.selectionColor),
                ),
              ),
              if (state.userProfile is TeacherProfileModel)
              TextFormField(
                
                initialValue: (state.userProfile as TeacherProfileModel).branch,
                onChanged: (value) {
                  (state.userProfile as TeacherProfileModel).branch = value;
                },
                decoration: InputDecoration(
                  labelText: '${getTranslated(context, 'Branch')}',
                  labelStyle: TextStyle(color: _currentTheme.textSelectionTheme.selectionColor),
                ),
              ),
              if (state.userProfile is TeacherProfileModel)
              TextFormField(
                initialValue:  (state.userProfile as TeacherProfileModel).lessonHourFee,
                onChanged: (value) {
                   (state.userProfile as TeacherProfileModel).lessonHourFee = value;
                },
                decoration: InputDecoration(
                  labelText: '${getTranslated(context, 'lesson_hour_fee')}',
                  labelStyle: TextStyle(color: _currentTheme.textSelectionTheme.selectionColor),
                ),
              ),
              if (state.userProfile is TeacherProfileModel)
              TextFormField(
                initialValue: (state.userProfile as TeacherProfileModel).iban,
                onChanged: (value) {
                  (state.userProfile as TeacherProfileModel).iban = value;
                },
                decoration: InputDecoration(
                  labelText: '${getTranslated(context, 'IBAN')}',
                  labelStyle: TextStyle(color: _currentTheme.textSelectionTheme.selectionColor),
                ),
              ),
              if (state.userProfile is TeacherProfileModel)
              TextFormField(
                initialValue: (state.userProfile as TeacherProfileModel).biography,
                onChanged: (value) {
                  (state.userProfile as TeacherProfileModel).biography = value;
                },
                decoration: InputDecoration(
                  labelText: '${getTranslated(context, 'biography')}',
                  labelStyle: TextStyle(color: _currentTheme.textSelectionTheme.selectionColor),
                ),
                maxLines: 5, 
              ),
              TextFormField(
                initialValue: '+90' + state.userProfile.phone.substring(0),
                validator: (value) {
                  if (value == null || value.length != 13 || value[3] != '5') {
                    return 'Lütfen geçerli bir telefon numarası girin';
                  }
                  return null;
                },
                onChanged: (value) {
                 state.userProfile.phone = value.substring(3);
                  debugPrint(state.userProfile.phone.toString());
                },
                decoration: InputDecoration(
                  labelText: '${getTranslated(context, 'Your_telephone_number')}',
                  labelStyle: TextStyle(color: _currentTheme.textSelectionTheme.selectionColor),
                ),
              ),
            ElevatedButton(
                  onPressed: () {
                    // Güncelleme işlemi için buton. Yeni bir name ile güncelliyoruz.
                    UserProfile updatedProfile = state.userProfile;
                    updatedProfile.name = 'New Name';
                    BlocProvider.of<UserProfileBloc>(context).add(UpdateUserProfile(updatedProfile));
                  },
                  child: Text('Güncelle'),  // Butonun üzerindeki yazı.
                ),
            ],
          ),
        )
      );
          }

          // Eğer bir hata olmuşsa, hatayı ekrana yazdırıyoruz.
          if (state is UserProfileError) {
            return Text('Error: ${state.error}');
          }

          return SizedBox.shrink();  // Diğer durumlar için boş bir widget döndürüyoruz.
       },
      ),
    );
  }
}