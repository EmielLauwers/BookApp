import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            SearchBarView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("zoeken")
                }
            
            BookView()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Library")
                }
            
            StoreView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Book Store")
                }
            
            AudioView()
                .tabItem {
                    Image(systemName: "headphones")
                    Text("Audiobooks")
                }
            
        }
    }
}

struct SearchBarView: View {
    @State private var query: String = ""
    
    let trending = [
        "gratis",
        "will packer",
        "susan morrison",
        "the lexington letter",
        "the body keeps the score",
        "never split the difference",
        "how to win friends & influence people",
        "the 48 laws of power",
        "if she knew",
        "the you you are"
    ]
    
    var filteredResults: [String] {
        if query.isEmpty {
            return trending
        } else {
            return trending.filter { $0.lowercased().contains(query.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                HStack{
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search Books & Audiobooks", text: $query)
                        .padding(.vertical, 10)
                    
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Text("Trending")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.vertical)
                
                List(filteredResults, id: \ .self) { item in
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text(item)
                    }
                }
                .listStyle(.plain)
            }
            .padding()
            .navigationTitle("search")
            
            
            
        }
    }
}
struct HomeView: View {
    var body: some View {
        Text("Homeview")
    }
}
struct BookView: View {
    var body: some View {
        Text("boekview")
    }
}
struct AudioView: View {
    var body: some View {
        Text("audioview")
    }
}
struct StoreView: View {
    var body: some View {
        Text("storeview")
    }
}


#Preview {
    ContentView()
}
