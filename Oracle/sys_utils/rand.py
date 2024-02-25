import random

def replace_string_with_random_number(file_path, string_to_replace):
  """
  Replaces all occurrences of a given string in a text file with a random number between 1 and 50.

  Args:
    file_path: The path to the text file.
    string_to_replace: The string to be replaced.

  Returns:
    None. The modified text is written back to the original file.
  """

  # Read the text file content.
  with open(file_path, "r") as f:
    text = f.read()

  # Replace the string in the text with a random number.
  modified_text = text.replace(string_to_replace, str(random.randint(1, 50)))

  # Write the modified text back to the file.
  with open(file_path, "w") as f:
    f.write(modified_text)

# Example usage
file_path = "your_text_file.txt"
string_to_replace = "apple"
replace_string_with_random_number(file_path, string_to_replace)
print(f"Replaced all occurrences of '{string_to_replace}' with random numbers in '{file_path}'.")


