use std::fs::File;
use std::io::prelude::*;

fn main() -> std::io::Result<()> {
    let reader = std::io::BufReader::new(File::open("input.txt")?);

    let mut totals: Vec<u32> = vec![];

    for line in reader.lines() {

        if let Ok(l) = line {
            let mut answer:u32 = 0;
            let b: Vec<char> = l.chars().collect();
            for c in &b {
                if b[b.len() / 2..].contains(c) {
                    answer = match *c as u32 {
                        x if x > 91 => x - 96,
                        x if x < 91 => x - 64 + 26,
                        _ => 0,
                    };
                    break;
                }
            }

            println!("{}", answer);
            totals.push(answer as u32);
        }
    }
    println!("{}", totals.iter().sum::<u32>());

    Ok(())
}
