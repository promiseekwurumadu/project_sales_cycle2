from pathlib import Path

src = Path("superstore_clean.csv")  # <-- put the exact filename you're importing
dst = Path("superstore_fixed.csv")

bad_lines = 0
total_lines = 0

# Read as bytes, decode permissively, and write clean UTF-8
with src.open("rb") as f_in, dst.open("w", encoding="utf-8", newline="") as f_out:
    for raw in f_in:
        total_lines += 1
        try:
            line = raw.decode("utf-8")
        except UnicodeDecodeError:
            line = raw.decode("cp1252", errors="replace")

        # A very practical rule: keep only lines with the expected number of commas (20 commas for 21 columns)
        # This drops the malformed quoted line that breaks COPY.
        if line.count(",") < 20:
            bad_lines += 1
            continue

        # Replace non-breaking spaces
        line = line.replace("\u00A0", " ")
        f_out.write(line)

print("Wrote:", dst)
print("Total lines:", total_lines, "Bad lines removed:", bad_lines)
