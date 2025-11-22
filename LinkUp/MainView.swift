
import SwiftUI

struct MainView: View {
    
    @State private var currentTab: Int = 0
    @State private var previousTab: Int = 0
    
    var body: some View {
        VStack {
            ZStack {
                switch currentTab {
                    
                case 0: ChatsView()
                        .transition(transitionEffect)
                    
                case 1: ContactView()
                        .transition(transitionEffect)
                    
                case 2: ProfileView()
                        .transition(transitionEffect)
                    
                default:
                    ChatsView()
                }
            }
            .animation(.easeInOut(duration: 0.35), value: currentTab)
//            Tab bar
            HStack {
                tabButton(index: 0)
                tabButton(index: 1)
                tabButton(index: 2)
            }
            .frame(height: 40)
            .background()
        }
    }
//    Effects
    private var transitionEffect: AnyTransition {
        if currentTab > previousTab {
            return .asymmetric(insertion: .move(edge: .trailing),
                               removal: .move(edge: .trailing))
        }
        else {
            return .asymmetric(insertion: .move(edge: .leading),
                               removal: .move(edge: .leading))
            
        }
    }
    
    @ViewBuilder
    func tabButton(index: Int) -> some View {
        Button{
            let oldTab = currentTab
            currentTab = index
                previousTab = oldTab
            
            
            print("Previous \(previousTab)")
            print("Current \(currentTab)")
        } label: {
            VStack {
                Image(systemName: icon(for: index))
                    .font(.system(size: 22, weight: .medium))
            }
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(currentTab == index ? .pink : .gray)
    }
    
    func icon(for index: Int) -> String {
        switch index {
        case 0: return "ellipsis.message.fill"
        case 1: return "person.crop.square"
        case 2: return "person.fill"
        default: return ""
        }
    }
}



#Preview {
    MainView()
}
