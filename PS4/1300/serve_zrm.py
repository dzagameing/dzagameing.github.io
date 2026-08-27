def auto_bump():
    """Always bump the manifest at startup so the PS4 re-downloads."""
    p = os.path.join(ROOT, "cache.appcache")
    if not os.path.isfile(p):
        return
    txt = open(p, encoding="utf-8").read()
    stamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    if re.search(r"^# build .*$", txt, re.M):
        txt = re.sub(r"^# build .*$", "# build " + stamp, txt, count=1, flags=re.M)
    else:
        txt = txt.replace("CACHE MANIFEST", "CACHE MANIFEST\n# build " + stamp, 1)
    open(p, "w", encoding="utf-8").write(txt)
    print(C.GRN + "  manifest auto-bumped -> " + stamp + C.R)