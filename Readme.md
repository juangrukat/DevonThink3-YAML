## Overview
`YAMLDevonThink.applescript` is an AppleScript designed to interact with the DevonThink application. This script processes selected Markdown records, extracting metadata and tags from the content formatted in YAML style. It clears existing custom metadata and tags before populating them with new values derived from the Markdown content.
The metadata for the record is created and updated from the YAML section of the markdown file. This helps in keeping your data organized by not having consistent data.
You can add customized #tag if you select the "convert hashtags to tags" option in the settings of DevonThink.

The filename is set to whatever is in the Title: field.

## Features
- Clears all existing custom metadata and tags from selected Markdown records.
- Extracts metadata from the Markdown content formatted in YAML.
- Supports the extraction of a title and tags from the Markdown content.
- Renames the record based on the extracted title.

## Requirements
- macOS with DevonThink installed.
- Basic understanding of AppleScript and DevonThink's record types.

## Usage
1. Open DevonThink and select one or more Markdown records.
2. Run the `YAMLDevonThink.applescript` script.
3. The script will:
   - Clear existing custom metadata and tags.
   - Read the plain text of the selected records.
   - Identify and extract metadata from the YAML section of the Markdown.
   - Rename the record based on the extracted title, if available.

## Script Breakdown
- **Clearing Metadata and Tags**: The script starts by clearing any existing custom metadata and tags from the selected records.
  
- **Reading Content**: It retrieves the plain text of each record and initializes variables to track the YAML parsing process.

- **YAML Parsing**: The script looks for a YAML section within the Markdown content, indicated by lines containing only `---`. It extracts key-value pairs, specifically looking for `title` and `Tags`.

- **Updating Records**: After extracting the necessary information, the script updates the record's name and sets the custom metadata and tags accordingly.

## Example Markdown Format
The script expects the Markdown content to be formatted in a specific way. Here’s an example of how the YAML section should look:

markdown
---
title: My Document Title
Tags: tag1, tag2, tag3
---
Content of the document goes here...

## Notes
- Ensure that the Markdown records you select contain the YAML section formatted correctly for the script to function as intended.
- The script will log the key-value pairs it processes for debugging purposes.

## Troubleshooting
- If the script does not seem to work, check that you have selected Markdown records and that they contain the expected YAML format.
- Review the logs for any errors or unexpected behavior.

## License
This script is provided as-is. Use it at your own risk. No warranties are provided regarding its functionality or suitability for any purpose.

## Author
juangrukat
