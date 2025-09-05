#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

sep="#==========================================================="
echo
echo "$sep"
echo "Start Times"

pattern='time.struct_time'

for f in rplpl-slurm*.out; do
  grep -m1 "$pattern" "$f" || true
done
for f in rs1-slurm*.out; do
  grep -m1 "$pattern" "$f" || true
done
for f in rs2-slurm*.out; do
  grep -m1 "$pattern" "$f" || true
done
for f in rs3-slurm*.out; do
  grep -m1 "$pattern" "$f" || true
done
for f in rs4-slurm*.out; do
  grep -m1 "$pattern" "$f" || true
done

echo "End Times"
for f in rplpl-slurm*.out; do
  tail -n 5 "$f" || true
done
for f in rs1-slurm*.out; do
  tail -n 5 "$f" || true
done
for f in rs2-slurm*.out; do
  tail -n 5 "$f" || true
done
for f in rs3-slurm*.out; do
  tail -n 5 "$f" || true
done
for f in rs4-slurm*.out; do
  tail -n 5 "$f" || true
done

echo "$sep"
