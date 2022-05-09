//
//  File.swift
//  
//
//  Created by Арман Чархчян on 05.05.2022.
//

import UserStoryFacade
import Swinject
import Account
import AccountRouteMap
import AuthorizedZone
import AuthorizedZoneRouteMap
import Settings
import SettingsRouteMap
import Profile
import ProfileRouteMap
import Posts
import PostsRouteMap
import Selection
import SelectionRouteMap
import Authorization
import AuthorizationRouteMap
import Chats
import ChatsRouteMap

final class UserStoryAssembly: Assembly {

    public init() { }

    public func assemble(container: Container) {
        container.register(UserStoryFacadeProtocol.self) { r in
            UserStoryFacade()
        }.initCompleted { r, facade in
            facade.settingsUserStory = r.resolve(SettingsRouteMap.self)
            facade.accountUserStory = r.resolve(AccountRouteMap.self)
            facade.authorizationUserStory = r.resolve(AuthorizationRouteMap.self)
            facade.chatsUserStory = r.resolve(ChatsRouteMap.self)
            facade.authorizedZoneUserStory = r.resolve(AuthorizedZoneRouteMap.self)
            facade.profileUserStory = r.resolve(ProfileRouteMap.self)
            facade.postsUserStory = r.resolve(PostsRouteMap.self)
            facade.regionUserStory = r.resolve(RegionSelectionRouteMap.self)
        }
        AuthorizationUserStoryAssembly().assemble(container: container)
        AccountUserStoryAssembly().assemble(container: container)
        RegionSelectionUserStoryAssembly().assemble(container: container)
        PostsUserStoryAssembly().assemble(container: container)
        ProfileUserStoryAssembly().assemble(container: container)
        SettingsUserStoryAssembly().assemble(container: container)
        ChatsUserStoryAssembly().assemble(container: container)
        AuthorizedZoneUserStoryAssembly().assemble(container: container)
    }
}
