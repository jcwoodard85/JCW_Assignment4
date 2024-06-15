//
//  NoteModel.swift
//  NotesApp
//
//  Created by Justin Woodard on 6/14/24.
//

import Foundation
import FirebaseFirestoreSwift

struct NoteModel : Codable, Identifiable {
    
    @DocumentID var id: String?
    var title: String
    var notesdata: String
}
