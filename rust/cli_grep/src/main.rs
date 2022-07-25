// import standard library
use std::env;
use std::process;

// import from lib.rs
use cli_grep::Config;

// Search lines in content string and return resutls
fn search<'a>(query: &str, contents: &'a str) -> Vec<&'a str> {
    let mut results = Vec::new();

    for line in contents.lines() {
        if line.contains(query) {
            results.push(line);
        }
    }

    results
}

fn search_case_insensitive<'a>(query: &str, contents: &'a str) -> Vec<&'a str> {
    let query = query.to_lowercase();
    let mut results = Vec::new();

    for line in contents.lines() {
        if line.to_lowercase().contains(&query) {
            results.push(line);
        }
    }

    results
}

fn main() {

    // Get cli arguments, returns iterator which is mapped to a vector with collect() 
    let args: Vec<String> = env::args().collect();

    let conf = Config::new(&args).unwrap_or_else(|err| {
        println!("Error: {}", err);
        process::exit(1);
    });

    // Get environment variable
    let ignore_case = env::var("RUST_GREP_IGNORE_CASE").is_ok();
    
    // {:?} is the debug formatter
    println!("Query: {:?}", conf.query);
    println!("Filename: {:?}", conf.filename);

    // Get function from the name of this module
    let content = cli_grep::read_file(&conf); 

    if ignore_case {
        let res = search_case_insensitive(&conf.query, &content);

        for val in res {
            println!("{}", val);
        }
    } else {
        let res = search(&conf.query, &content);

        for val in res {
            println!("{}", val);
        }
    };

}
