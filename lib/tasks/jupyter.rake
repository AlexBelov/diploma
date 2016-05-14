namespace :jupyter do
  task :notebook do
    root = File.absolute_path(__FILE__ + "/../../..")
    env = {
      "RUBYLIB" => ($: + [ root ]).join(":")
    }
    Process.exec(env, "jupyter", "notebook")
  end
end
