Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416F4C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 13:35:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40891.1675085706094571679
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 05:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DA9D1758;
	Mon, 30 Jan 2023 05:35:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB6A23F885;
	Mon, 30 Jan 2023 05:35:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone] Revert "CI: add patches to fix perf with clang"
Date: Mon, 30 Jan 2023 13:35:01 +0000
Message-Id: <20230130133501.2535380-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4342

This reverts commit e3cb27c06a94c2a806602bf3544efc550ed3ab07.
---
 0001-linux-yocto-fix-perf-with-clang.patch | 132 ---------------------
 ci/clang.yml                               |   5 -
 2 files changed, 137 deletions(-)
 delete mode 100644 0001-linux-yocto-fix-perf-with-clang.patch

diff --git a/0001-linux-yocto-fix-perf-with-clang.patch b/0001-linux-yoct=
o-fix-perf-with-clang.patch
deleted file mode 100644
index 6aae7ca3..00000000
--- a/0001-linux-yocto-fix-perf-with-clang.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From fc2e155f4127935d11a6fc2de2af934f379b5416 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 19 Dec 2022 12:25:06 +0000
-Subject: [PATCH] linux-yocto: fix perf with clang
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- ...hon-Account-for-multiple-words-in-CC.patch | 98 +++++++++++++++++++
- meta/recipes-kernel/linux/linux-yocto_5.15.bb |  2 +
- 2 files changed, 100 insertions(+)
- create mode 100644 meta/recipes-kernel/linux/files/0001-perf-python-Acc=
ount-for-multiple-words-in-CC.patch
-
-diff --git a/meta/recipes-kernel/linux/files/0001-perf-python-Account-fo=
r-multiple-words-in-CC.patch b/meta/recipes-kernel/linux/files/0001-perf-=
python-Account-for-multiple-words-in-CC.patch
-new file mode 100644
-index 00000000000..e9f5ab9d836
---- /dev/null
-+++ b/meta/recipes-kernel/linux/files/0001-perf-python-Account-for-multi=
ple-words-in-CC.patch
-@@ -0,0 +1,98 @@
-+https://lore.kernel.org/linux-perf-users/Y5d4k7fDxfRP7hcN@kernel.org/T/
-+https://lore.kernel.org/bpf/20221205025039.149139-1-raj.khem@gmail.com/=
T/
-+
-+Upstream-Status: Submitted
-+Signed-off-by: Ross Burton <ross.burton@arm.com>
-+
-+From ec36ad2d4842fa324d532fe49ff2aa67f7e3e939 Mon Sep 17 00:00:00 2001
-+From: Khem Raj <raj.khem@gmail.com>
-+Date: Sun, 4 Dec 2022 18:50:39 -0800
-+Subject: [PATCH 1/2] libbpf: Fix build warning on ref_ctr_off
-+
-+Clang warns on 32-bit ARM on this comparision
-+
-+libbpf.c:10497:18: error: result of comparison of constant 4294967296 w=
ith expression of type 'size_t' (aka 'unsigned int') is always false [-We=
rror,-Wtautological-constant-out-of-range-compare]
-+        if (ref_ctr_off >=3D (1ULL << PERF_UPROBE_REF_CTR_OFFSET_BITS))
-+            ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-+
-+Check for platform long int to be larger than 32-bits before enabling
-+this check, it false on 32bit anyways.
-+
-+Cc: Alexei Starovoitov <ast@kernel.org>
-+Cc: Daniel Borkmann <daniel@iogearbox.net>
-+Cc: Song Liu <song@kernel.org>
-+Cc: Yonghong Song <yhs@fb.com>
-+Cc: Jiri Olsa <jolsa@kernel.org>
-+Cc: Paul Walmsley <paul.walmsley@sifive.com>
-+Cc: Palmer Dabbelt <palmer@dabbelt.com>
-+Cc: Nathan Chancellor <nathan@kernel.org>
-+Cc: Nick Desaulniers <ndesaulniers@google.com>
-+
-+Signed-off-by: Khem Raj <raj.khem@gmail.com>
-+---
-+ tools/lib/bpf/libbpf.c | 2 +-
-+ 1 file changed, 1 insertion(+), 1 deletion(-)
-+
-+diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
-+index 050622649797..596d9a335652 100644
-+--- a/tools/lib/bpf/libbpf.c
-++++ b/tools/lib/bpf/libbpf.c
-+@@ -9185,7 +9185,7 @@ static int perf_event_open_probe(bool uprobe, boo=
l retprobe, const char *name,
-+ 	char errmsg[STRERR_BUFSIZE];
-+ 	int type, pfd, err;
-+=20
-+-	if (ref_ctr_off >=3D (1ULL << PERF_UPROBE_REF_CTR_OFFSET_BITS))
-++	if (BITS_PER_LONG > 32 && ref_ctr_off >=3D (1ULL << PERF_UPROBE_REF_C=
TR_OFFSET_BITS))
-+ 		return -EINVAL;
-+=20
-+ 	type =3D uprobe ? determine_uprobe_perf_type()
-+--=20
-+2.34.1
-+
-+
-+From 08bdb3dba2ace03bc48e25b9a6136fc48e1991c9 Mon Sep 17 00:00:00 2001
-+From: Khem Raj <raj.khem@gmail.com>
-+Date: Sun, 4 Dec 2022 18:55:34 -0800
-+Subject: [PATCH 2/2] perf python: Account for multiple words in CC
-+
-+Sometimes build systems may append options e.g. --sysroot etc. to CC
-+variable especially in cross-compile environments like yocto project
-+where CC varable is composed of cross-compiler name and some needed
-+options for it to work in a relocatable environment. Therefore separate
-+out the compiler name from rest of the options in CC, then add the
-+options via second argument to Popen() API
-+
-+Cc: Adrian Hunter <adrian.hunter@intel.com>
-+Cc: Fangrui Song <maskray@google.com>
-+Cc: Florian Fainelli <f.fainelli@gmail.com>
-+Cc: Ian Rogers <irogers@google.com>
-+Cc: Jiri Olsa <jolsa@kernel.org>
-+Cc: John Keeping <john@metanate.com>
-+Cc: Leo Yan <leo.yan@linaro.org>
-+Cc: Michael Petlan <mpetlan@redhat.com>
-+Cc: Namhyung Kim <namhyung@kernel.org>
-+Cc: Nathan Chancellor <nathan@kernel.org>
-+Cc: Nick Desaulniers <ndesaulniers@google.com>
-+Cc: Sedat Dilek <sedat.dilek@gmail.com>
-+Signed-off-by: Khem Raj <raj.khem@gmail.com>
-+Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-+---
-+ tools/perf/util/setup.py | 2 +-
-+ 1 file changed, 1 insertion(+), 1 deletion(-)
-+
-+diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
-+index c255a2c90cd6..3699b3f8d2d7 100644
-+--- a/tools/perf/util/setup.py
-++++ b/tools/perf/util/setup.py
-+@@ -7,7 +7,7 @@ cc_is_clang =3D b"clang version" in Popen([cc.split()[0=
], "-v"], stderr=3DPIPE).stde
-+ src_feature_tests  =3D getenv('srctree') + '/tools/build/feature'
-+=20
-+ def clang_has_option(option):
-+-    cc_output =3D Popen([cc, option, path.join(src_feature_tests, "tes=
t-hello.c") ], stderr=3DPIPE).stderr.readlines()
-++    cc_output =3D Popen([cc.split()[0], str(cc.split()[1:]) + option, =
path.join(src_feature_tests, "test-hello.c") ], stderr=3DPIPE).stderr.rea=
dlines()
-+     return [o for o in cc_output if ((b"unknown argument" in o) or (b"=
is not supported" in o))] =3D=3D [ ]
-+=20
-+ if cc_is_clang:
-+--=20
-+2.34.1
-+
-diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipe=
s-kernel/linux/linux-yocto_5.15.bb
-index d5f21daf35b..d9535e65a97 100644
---- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
-+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
-@@ -37,6 +37,8 @@ KBRANCH:class-devupstream =3D "v5.15/base"
- SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;=
branch=3D${KBRANCH}; \
-            git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;n=
ame=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}"
-=20
-+SRC_URI +=3D "file://0001-perf-python-Account-for-multiple-words-in-CC.=
patch"
-+
- LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd=
7e46"
- LINUX_VERSION ?=3D "5.15.78"
-=20
---=20
-2.34.1
-
diff --git a/ci/clang.yml b/ci/clang.yml
index 6aacbff7..a2063f19 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,11 +4,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-  poky:
-    patches:
-      perf:
-        repo: meta-arm
-        path: 0001-linux-yocto-fix-perf-with-clang.patch
=20
 local_conf_header:
   clang: |
--=20
2.34.1


