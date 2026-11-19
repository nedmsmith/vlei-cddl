#!/usr/bin/env python3
"""Convert CBOR-diag JSON files to CBOR format."""

import json
import cbor2
import sys
import subprocess
from pathlib import Path

def diag_to_cbor(diag_file, cbor_file):
    """Convert a diag JSON file to CBOR."""
    with open(diag_file, 'r') as f:
        content = f.read()
        # Remove comment lines
        lines = [line for line in content.split('\n') if not line.strip().startswith(';')]
        json_str = '\n'.join(lines)
        data = json.loads(json_str)
    
    with open(cbor_file, 'wb') as f:
        cbor2.dump(data, f)
    print(f"Generated {cbor_file}")

def cbor_to_pretty(cbor_file, pretty_file):
    """Convert a CBOR file to pretty diagnostic notation using cbor2pretty.rb."""
    try:
        result = subprocess.run(['cbor2pretty.rb', cbor_file], 
                              capture_output=True, text=True, check=True)
        with open(pretty_file, 'w') as f:
            f.write(result.stdout)
        print(f"Generated {pretty_file}")
    except subprocess.CalledProcessError as e:
        print(f"Error converting {cbor_file}: {e.stderr}", file=sys.stderr)
        raise
    except FileNotFoundError:
        print(f"Error: cbor2pretty.rb not found in PATH", file=sys.stderr)
        raise

if __name__ == '__main__':
    if len(sys.argv) > 1:
        diag_file = sys.argv[1]
        # Determine output files
        cbor_file = str(Path(diag_file).with_suffix('.cbor'))
        pretty_file = str(Path(diag_file).with_suffix('.pretty'))
        
        try:
            diag_to_cbor(diag_file, cbor_file)
            cbor_to_pretty(cbor_file, pretty_file)
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            sys.exit(1)
    else:
        print("Usage: convert_examples.py <diag_file>")
        sys.exit(1)
