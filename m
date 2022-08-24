Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E2BC32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 02:58:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6884.1661309905502481567
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 19:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F547113E;
	Tue, 23 Aug 2022 19:58:28 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 532453F67D;
	Tue, 23 Aug 2022 19:58:24 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton Antonov <Anton.Antonov@arm.com>
Subject: [PATCH] work around for too few arguments to function
 init_disassemble_info() error
Date: Tue, 23 Aug 2022 22:58:19 -0400
Message-Id: <20220824025819.4888-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Aug 2022 02:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3713

From: Anton Antonov <Anton.Antonov@arm.com>

binutils 2.39 changed the signature of init_disassemble_info(),
which now causes perf and bpftool to fail to compile.

Relevant binutils commit: [1]

There is a proper fix in development upstream[2].
This is a work-around for older kernels.

[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D6=
0a3da00bd5407f07d64dff82a4dae98230dfaac
[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.1=
56015-1-andres@anarazel.de/

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../linux/linux-arm-platforms.inc             |  1 +
 ...ture-changes-causes-compile-failures.patch | 99 +++++++++++++++++++
 ...ture-changes-causes-compile-failures.patch | 99 +++++++++++++++++++
 .../linux/linux-yocto_%.bbappend              |  3 +-
 4 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/init_disassemble_info-signature-changes-causes-compile-failures.patc=
h
 create mode 100644 meta-gem5/recipes-kernel/linux/files/init_disassemble=
_info-signature-changes-causes-compile-failures.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index d0516320..7bb4a925 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -179,6 +179,7 @@ SRC_URI:append:tc =3D " \
     file://0042-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.pat=
ch \
     file://0043-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.pat=
ch \
     file://0044-ANDROID-trusty-Make-trusty-transports-configurable.patch=
 \
+    file://init_disassemble_info-signature-changes-causes-compile-failur=
es.patch \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
 KERNEL_FEATURES:append:tc1 =3D " bsp/arm-platforms/tc-autofdo.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/in=
it_disassemble_info-signature-changes-causes-compile-failures.patch b/met=
a-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/init_disassemble_i=
nfo-signature-changes-causes-compile-failures.patch
new file mode 100644
index 00000000..aa33bb7f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/init_disa=
ssemble_info-signature-changes-causes-compile-failures.patch
@@ -0,0 +1,99 @@
+From 1b2013986271de39360cf79e62ed9b7d2cc59f9b Mon Sep 17 00:00:00 2001
+From: Andres Freund <andres@anarazel.de>
+Date: Wed, 22 Jun 2022 11:19:18 -0700
+Subject: [PATCH] init_disassemble_info() signature changes causes compil=
e
+ failures
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Hi,
+
+binutils changed the signature of init_disassemble_info(), which now cau=
ses
+perf and bpftool to fail to compile (e.g. on debian unstable).
+
+Relevant binutils commit: https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3D60a3da00bd5407f07d64dff82a4dae98230dfaac
+
+util/annotate.c: In function =E2=80=98symbol__disassemble_bpf=E2=80=99:
+util/annotate.c:1765:9: error: too few arguments to function =E2=80=98in=
it_disassemble_info=E2=80=99
+ 1765 |         init_disassemble_info(&info, s,
+      |         ^~~~~~~~~~~~~~~~~~~~~
+In file included from util/annotate.c:1718:
+/usr/include/dis-asm.h:472:13: note: declared here
+  472 | extern void init_disassemble_info (struct disassemble_info *dinf=
o, void *stream,
+      |             ^~~~~~~~~~~~~~~~~~~~~
+
+with equivalent failures in
+
+tools/bpf/bpf_jit_disasm.c
+tools/bpf/bpftool/jit_disasm.c
+
+The fix is easy enough, add a wrapper around fprintf() that conforms to =
the
+new signature.
+
+However I assume the necessary feature test and wrapper should only be a=
dded
+once? I don't know the kernel stuff well enough to choose the right stru=
cture
+here.
+
+Attached is my local fix for perf. Obviously would need work to be a rea=
l
+solution.
+
+Greetings,
+
+Andres Freund
+---
+
+binutils 2.39 changed the signature of init_disassemble_info(),
+which now causes perf and bpftool to fail to compile.
+
+Relevant binutils commit: [1]
+
+There is a proper fix in development upstream[2].
+This is a work-around for older kernels.
+
+[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D=
60a3da00bd5407f07d64dff82a4dae98230dfaac
+[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.=
156015-1-andres@anarazel.de/
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+
+ tools/perf/util/annotate.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
+index 6c8575e182ed..466a3a68f5cd 100644
+--- a/tools/perf/util/annotate.c
++++ b/tools/perf/util/annotate.c
+@@ -1677,6 +1677,18 @@ static int dso__disassemble_filename(struct dso *=
dso, char *filename, size_t fil
+ #include <bfd.h>
+ #include <dis-asm.h>
+=20
++static int fprintf_styled(void *, enum disassembler_style, const char* =
fmt, ...)
++{
++  va_list args;
++  int r;
++
++  va_start(args, fmt);
++  r =3D vprintf(fmt, args);
++  va_end(args);
++
++  return r;
++}
++
+ static int symbol__disassemble_bpf(struct symbol *sym,
+ 				   struct annotate_args *args)
+ {
+@@ -1719,7 +1731,8 @@ static int symbol__disassemble_bpf(struct symbol *=
sym,
+ 		goto out;
+ 	}
+ 	init_disassemble_info(&info, s,
+-			      (fprintf_ftype) fprintf);
++			      (fprintf_ftype) fprintf,
++			      fprintf_styled);
+=20
+ 	info.arch =3D bfd_get_arch(bfdf);
+ 	info.mach =3D bfd_get_mach(bfdf);
+--=20
+2.30.2
+
diff --git a/meta-gem5/recipes-kernel/linux/files/init_disassemble_info-s=
ignature-changes-causes-compile-failures.patch b/meta-gem5/recipes-kernel=
/linux/files/init_disassemble_info-signature-changes-causes-compile-failu=
res.patch
new file mode 100644
index 00000000..3d7ac92e
--- /dev/null
+++ b/meta-gem5/recipes-kernel/linux/files/init_disassemble_info-signatur=
e-changes-causes-compile-failures.patch
@@ -0,0 +1,99 @@
+From 4af28e8e58b6c461a3b85960b222dade8b6891ce Mon Sep 17 00:00:00 2001
+From: Andres Freund <andres@anarazel.de>
+Date: Wed, 22 Jun 2022 11:19:18 -0700
+Subject: [PATCH] init_disassemble_info() signature changes causes compil=
e
+ failures
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Hi,
+
+binutils changed the signature of init_disassemble_info(), which now cau=
ses
+perf and bpftool to fail to compile (e.g. on debian unstable).
+
+Relevant binutils commit: https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3D60a3da00bd5407f07d64dff82a4dae98230dfaac
+
+util/annotate.c: In function =E2=80=98symbol__disassemble_bpf=E2=80=99:
+util/annotate.c:1765:9: error: too few arguments to function =E2=80=98in=
it_disassemble_info=E2=80=99
+ 1765 |         init_disassemble_info(&info, s,
+      |         ^~~~~~~~~~~~~~~~~~~~~
+In file included from util/annotate.c:1718:
+/usr/include/dis-asm.h:472:13: note: declared here
+  472 | extern void init_disassemble_info (struct disassemble_info *dinf=
o, void *stream,
+      |             ^~~~~~~~~~~~~~~~~~~~~
+
+with equivalent failures in
+
+tools/bpf/bpf_jit_disasm.c
+tools/bpf/bpftool/jit_disasm.c
+
+The fix is easy enough, add a wrapper around fprintf() that conforms to =
the
+new signature.
+
+However I assume the necessary feature test and wrapper should only be a=
dded
+once? I don't know the kernel stuff well enough to choose the right stru=
cture
+here.
+
+Attached is my local fix for perf. Obviously would need work to be a rea=
l
+solution.
+
+Greetings,
+
+Andres Freund
+---
+
+binutils 2.39 changed the signature of init_disassemble_info(),
+which now causes perf and bpftool to fail to compile.
+
+Relevant binutils commit: [1]
+
+There is a proper fix in development upstream[2].
+This is a work-around for older kernels.
+
+[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D=
60a3da00bd5407f07d64dff82a4dae98230dfaac
+[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.=
156015-1-andres@anarazel.de/
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+
+ tools/perf/util/annotate.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
+index 0c5e4ce390ef..1151c029f714 100644
+--- a/tools/perf/util/annotate.c
++++ b/tools/perf/util/annotate.c
+@@ -1708,6 +1708,18 @@ static int dso__disassemble_filename(struct dso *=
dso, char *filename, size_t fil
+ #include <bfd.h>
+ #include <dis-asm.h>
+=20
++static int fprintf_styled(void *, enum disassembler_style, const char* =
fmt, ...)
++{
++  va_list args;
++  int r;
++
++  va_start(args, fmt);
++  r =3D vprintf(fmt, args);
++  va_end(args);
++
++  return r;
++}
++
+ static int symbol__disassemble_bpf(struct symbol *sym,
+ 				   struct annotate_args *args)
+ {
+@@ -1750,7 +1762,8 @@ static int symbol__disassemble_bpf(struct symbol *=
sym,
+ 		goto out;
+ 	}
+ 	init_disassemble_info(&info, s,
+-			      (fprintf_ftype) fprintf);
++			      (fprintf_ftype) fprintf,
++			      fprintf_styled);
+=20
+ 	info.arch =3D bfd_get_arch(bfdf);
+ 	info.mach =3D bfd_get_mach(bfdf);
+--=20
+2.30.2
+
diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend b/meta=
-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
index b36ea064..e66dd21b 100644
--- a/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -3,7 +3,8 @@ FILESEXTRAPATHS:prepend:gem5-arm64 :=3D "${THISDIR}:${THI=
SDIR}/files:"
 COMPATIBLE_MACHINE:gem5-arm64 =3D "gem5-arm64"
 KMACHINE:gem5-arm64 =3D "gem5-arm64"
 SRC_URI:append:gem5-arm64 =3D " file://gem5-kmeta;type=3Dkmeta;name=3Dge=
m5-kmeta;destsuffix=3Dgem5-kmeta \
-                              file://dts/gem5-arm64;subdir=3Dadd-files"
+                              file://dts/gem5-arm64;subdir=3Dadd-files \
+                              file://init_disassemble_info-signature-cha=
nges-causes-compile-failures.patch"
=20
 do_patch:append:gem5-arm64() {
     tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
--=20
2.17.1


