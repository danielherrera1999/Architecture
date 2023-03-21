// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/features/feature/presentation/cubit/post/create_post/create_post_cubit.dart';
import 'package:prueba/features/feature/presentation/widgets/Input_widget.dart';

import '../../../../domain/entities/post/post_entity.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Formulario')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('formulario del post'),
            InputWidget(labels: 'titulo del post',controller: _titleController),
            InputWidget(labels: 'descripcion del post', controller: _descriptionController),
            SizedBox(height: 20,),
            InkWell(
              onTap: _createSubmitPost,
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(3)
                ),
                child: Center(child: Text("GUARDAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),),
              ),
            )
          ],
        ),
      ),
    );
  }

  _createSubmitPost() {
    BlocProvider.of<CreatePostCubit>(context).create(
        post: PostEntity(
            title: _titleController.text,
            description: _descriptionController.text,
        )
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _titleController.clear();
      _descriptionController.clear();
    });
  }
}