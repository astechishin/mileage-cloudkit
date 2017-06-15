class AppDelegate
  attr_accessor :root_view_controller
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @root_view_controller = MileageTableViewController.alloc.init
    navigationController =
        UINavigationController.alloc.initWithRootViewController(@root_view_controller)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
