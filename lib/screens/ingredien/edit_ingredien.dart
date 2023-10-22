import 'package:alimentvolaille/model/ingredientmodel.dart';
import 'package:flutter/material.dart';




class AddEditingredientPage extends StatefulWidget {
  final Ingredient? ingredient;

  const AddEditingredientPage({
    Key? key,
    this.ingredient,
  }) : super(key: key);
  @override
  _AddEditingredientPageState createState() => _AddEditingredientPageState();
}

class _AddEditingredientPageState extends State<AddEditingredientPage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late double kcal, EM, MS, PB,MG, MM, Lys, Met, Cys, Thr, Trp, Ca, PNP, Na, Phyt, Goss, Tan;
  @override
  void initState() {
    super.initState();
    name = widget.ingredient?.name ?? '';
    kcal = widget.ingredient?.kcal ?? 0.0;
    EM = widget.ingredient?.EM ?? 0.0;
    MS = widget.ingredient?.MS ?? 0.0;
    PB = widget.ingredient?.PB ?? 0.0;
    MG = widget.ingredient?.MG ?? 0.0;
    MM = widget.ingredient?.MM ?? 0.0;
    Lys = widget.ingredient?.Lys ?? 0.0;
    Met = widget.ingredient?.Met ?? 0.0;
    Cys = widget.ingredient?.Cys ?? 0.0;
    Thr = widget.ingredient?.Thr ?? 0.0;
    Trp = widget.ingredient?.Trp ?? 0.0;
    Ca = widget.ingredient?.Ca ?? 0.0;
    PNP = widget.ingredient?.PNP ?? 0.0;
    Na = widget.ingredient?.Na ?? 0.0;
    Phyt = widget.ingredient?.Phyt ?? 0.0;
    Goss = widget.ingredient?.Goss ?? 0.0;
    Tan = widget.ingredient?.Tan ?? 0.0;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: Appbare('',actions: [buildButton()],),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            isImportant: isImportant,
            number: number,
            title: title,
            description: description,
            timefin: timefin,
            timedebut: timedebut,

            onChangedImportant: (isImportant) => setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedTimefin: (timefin)=> setState(() =>this.timefin=timefin as DateTime),
            onChangedTimedebut:  (timedebut) {
              setState(() {
                this.timedebut = timedebut as DateTime ;
              });
            },
            onChangedDescription: (description) => setState(() => this.description = description),

          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty && timefin.toString().isNotEmpty && timedebut.toString().isNotEmpty ;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
      timefin: timefin,
      timedebut: timedebut,


    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
      timefin: timefin,
      timedebut: timedebut,

    );

    await NotesDatabase.instance.create(note);
  }
}