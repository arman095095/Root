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
            facade.settings = r.resolve(SettingsRouteMap.self)
            facade.account = r.resolve(AccountRouteMap.self)
            facade.authorization = r.resolve(AuthorizationRouteMap.self)
            facade.chats = r.resolve(ChatsRouteMap.self)
            facade.authorizedZone = r.resolve(AuthorizedZoneRouteMap.self)
            facade.profile = r.resolve(ProfileRouteMap.self)
            facade.posts = r.resolve(PostsRouteMap.self)
            facade.regionSelection = r.resolve(RegionSelectionRouteMap.self)
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
