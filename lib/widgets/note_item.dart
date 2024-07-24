import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cuibts/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return  EditNoteView(note: note,);
          },
        ));
      },
      child: Container(
        // margin: const EdgeInsets.only(bottom: 8),
        // height: 200,
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// \\Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 200,
//                 height: 50,
//                 child: Text(
//                   'Flutter tips',
//                   style: TextStyle(fontSize: 32, color: Colors.black),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 width: 200,
//                 // height: 100,
//                 child: Text(
//                   'Build your Career with Mhmd Abdullah ',
//                   style: TextStyle(fontSize: 18, color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               IconButton(
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.delete,
//                     color: Colors.black,
//                     size: 44,
//                   )),
//               Text(
//                 'May 21,2024',
//                 style: TextStyle(fontSize: 14, color: Colors.blueGrey),
//               ),
//             ],
//           )
//         ],
//       ),
  