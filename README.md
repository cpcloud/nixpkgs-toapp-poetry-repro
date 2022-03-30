# repro

After bisecting against a different project the first bad commit is 20e22827951.

You won't be able to successfully run `nix-shell` with this commit.

To see the trace, run

```sh
nix-shell --show-trace
```

Change the commit to something preceding 20e22827951 using `niv` (e.g., to
6de161729c8) to get a passing `nix-shell` invocation.
