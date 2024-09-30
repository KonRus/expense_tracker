import { Application } from "@hotwired/stimulus"
import HelloController from "./hello_controller"

const application = Application.start()

// Register the "hello" controller
application.register("hello", HelloController)
