//
//  ApplicationAssembly.swift
//  ChrisPelis
//
//  Created by Christian Collazos on 6/13/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import Typhoon

class ApplicationAssembly: TyphoonAssembly{

    @objc dynamic func appDelegate() -> Any {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            (definition) in
            definition!.injectProperty(#selector(getter: UIViewController.navigationController), with: self.customNavigationViewController())
        }
    }
    
    @objc dynamic func initialViewController() -> Any {
        return TyphoonDefinition.withClass(InitialViewController.self, configuration: { (definition) in
           
        })
    }
    
    @objc dynamic func customNavigationViewController() -> Any {
        return TyphoonDefinition.withClass(CustomNavigationViewController.self, configuration: { (definition) in
            definition?.useInitializer(#selector(UINavigationController.init(rootViewController:)), parameters: { (initializer) in
                initializer?.injectParameter(with: self.initialViewController())
            })
        })
    }
}
