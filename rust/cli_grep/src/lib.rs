use std::fs;

pub struct Config {
    pub query: String,
    pub filename: String
}

// Add method to Config struct
impl Config {
    pub fn new(args: &[String]) -> Result<Config, &'static str> {

        // check if enough arguments are passed
        if args.len() < 3 {
            return Err("Not enough arguments, provide at least 2");
        }

        // args[0] contains the name of the binary running 
        // clone values from args into config struct
        let query = args[1].clone();
        let filename = args[2].clone();

        Ok(Config { query, filename })
    }
}

pub fn read_file(conf: &Config) -> String {
    // read file
    let file_content = fs::read_to_string(&conf.filename).expect("Error reading file");

    // Return copy of file content
    file_content.clone()
}

