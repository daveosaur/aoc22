use std::io::prelude::*;
use std::fs::File;
use std::time;

fn main() -> std::io::Result<()> {

    let start = time::Instant::now();

    let f = File::open("input.txt")?;
    let reader = std::io::BufReader::new(f);

    let mut temp = 0;
    let mut max = 0;

    for line in reader.lines() {
        if let Ok(l) = line {
            match l.as_str() {
                ""      => {
                    if temp > max {max = temp}
                    temp = 0; },
                _       => temp += l.parse::<i32>().unwrap(),
            }
        }
    }
    println!("{}", max);
    println!("{}", start.elapsed().as_nanos());


    Ok(())
}


