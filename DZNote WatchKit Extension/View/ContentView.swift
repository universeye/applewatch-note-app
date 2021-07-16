//
//  ContentView.swift
//  DZNote WatchKit Extension
//
//  Created by Terry Kuo on 2021/7/13.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    @AppStorage("lineCount") var lineCount: Int = 1
    // MARK: - Function
    
    func save() {
        //dump(notes)
        
        do {
            // 1. Convert the notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            // 2. Create a new URL to save the file using the getDocumentary
            
            let url = getDocumentDirectory().appendingPathComponent("notes")
            // 3. Write the data to the given URL
            
            try data.write(to: url)
        } catch {
            print("saving data hase failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1. get the notes url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // 2. create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                //do nothing
            }
        }
    }
    
    func delete(offset: IndexSet ) {
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return path[0]
    }
    // MARK: - Body
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6, content: {
                TextField("Add New Note", text: $text)
                
                Button(action: {
                    // 1. only run the button's action when the text field is not empty
                    guard !text.isEmpty else { return }
                    // 2. create a new note item and initialize it with the text value
                    let note = Note(id: UUID(), text: text)
                    // 3. add the new note item to the note array (append)
                    notes.append(note)
                    // 4. make the text field empty
                    text = ""
                    // 5. Save the notes (function)
                    save()
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                })
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
            }) //: HStack
            Spacer()
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { index in
                        NavigationLink(destination: DetailView(note: notes[index], count: notes.count, index: index)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[index].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            }
                        } //: Hstack
                    } //: Loop
                    .onDelete(perform: { indexSet in
                        delete(offset: indexSet)
                    })
                }
            } else { //Empty View
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            } //: List
        } //: VStack
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
    }
}



// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
