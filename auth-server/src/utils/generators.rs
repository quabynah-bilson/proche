use rand::Rng;

pub(crate) fn generate_random_string(length: usize) -> String {
    let mut rng = rand::thread_rng();
    let characters: Vec<char> = "abcdefghijklmnopqrstuvwxyz0123456789".chars().collect();
    (0..length)
        .map(|_| characters[rng.gen_range(0..characters.len())])
        .collect()
}
