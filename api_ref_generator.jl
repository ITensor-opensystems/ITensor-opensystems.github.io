using Glob  # Optional, simplifies file listing
using Markdown

# Path to the API folder and main index file
api_folder = "src/api/"
index_file_path = "src/index.md"

# Function to generate API subheadings
function generate_api_subheadings(api_folder)
    # Get list of .md files in the API folder
    files = glob("*.md", api_folder)

    # Create a Markdown list with links to each file
    md_content = "### API Reference\n\n"
    for file in files
        # Extract filename without extension to use as display name
        filename = splitext(basename(file))[1]
        md_content *= "- [$filename]($api_folder$filename.md)\n"
    end

    return md_content
end

# Append the API subheadings to the main index file
open(index_file_path, "a") do f
    write(f, "\n\n" * generate_api_subheadings(api_folder))
end

println("API subheadings added to $index_file_path")