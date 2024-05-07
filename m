Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8929C25B5F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 17:33:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.313.1715103195984298027
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 May 2024 10:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBCEFDA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:40 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 842BE3F587
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm/gn: update to latest commit
Date: Tue,  7 May 2024 13:33:08 -0400
Message-Id: <20240507173313.50788-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 May 2024 17:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5698

Update to the latest gn commit and remove unnecessary patches and build
parameters

Changes in gn between 4bd1a77e67958fb7f6739bd4542641646f264e5d and f284b6=
b47039a2d7edfcbfc51f52664f82b5a789
f284b6b47039 [src] Add "#include <limits>" in the //src/base/files/file_e=
numerator_win.cc
155c53952ec2 Get updates to infra/recipes.py from upstream
d823fd85da3f Revert "Teach gn to handle systems with > 64 processors"
f07499aebcf5 [apple] Rename the code-signing properties of create_bundle
415b3b19e094 Fix a typo in "gn help refs" output
93ee9b91423c Revert "[bundle] Use "phony" builtin tool for create_bundle =
targets"
cfddfffb7913 [bundle] Use "phony" builtin tool for create_bundle targets
06cdcc8e1fa8 [ios] Simplify handling of assets catalog
22581fb46c0c [swift] List all outputs as deps of "source_set" stamp file
59c4bb920542 [swift] Update `gn check ...` to consider the generated head=
er
dd0927eb34bb [swift] Set `restat =3D 1` to swift build rules
88e8054aff7b Fix build with gcc12
e05c0aa00938 [label_matches] Add new functions label_matches(), filter_la=
bels_include() and filter_labels_exclude()
f19d5817e7ba [swift] Remove problematic use of "stamp" tool
6253a39dbc43 Implement new --ninja-outputs-file option.
5787e994aa4c Add NinjaOutputsWriter class
03d10f1657b4 Move InvokePython() function to its own source file.
0cdb7dd27f5c zos: build with -DZOSLIB_OVERRIDE_CLIB to override creat
d4f94f9a6c25 Enable C++ runtime assertions in debug mode.
0a2b8eac80f1 Fix regression in MakeRelativePath()
8b973aa51d02 fix: Fix Windows MakeRelativePath.
a3dcd7a7ad86 Add long path support for windows
a2e2717ea670 Ensure read_file() files are considered by "gn analyze"
fc722252439e apply 2to3 to for some Python scripts
5110a7f03e86 Add rustflags to desc and help output
f99e015ac35f strings: support case insensitive check only in StartsWith/E=
ndsWith
b5adfe5f574d add .git-blame-ignore-revs
d6085ac6a95b use std::{string,string_view}::{starts_with,ends_with}
8bd36a27c076 apply clang-format to all C++ sources
5d76868385b8 add forward declaration in rust_values.h
b8562a4abd95 Add `root_patterns` list to build configuration.
5fd939de8a66 Use c++20 in GN build
d4be45bb28fb update windows sdk to 2024-01-11
71305b07d708 update windows sdk
85944ebc24a9 Add linux-riscv64.
7367b0df0a0a Update OWNERS list.
92e63272dc04 remove unused function
c7b223bfb225 Ignore build warning -Werror=3Dredundant-move
bc5744174d9e Fix --as=3Dbuildfile `gn desc deps` output.
9a45b6123831 Update recipe engine to 9dea1246.
85bd0a62938b treewide: Fix spelling mistakes
e4702d740906 Optimize base::EscapeJSONString for ASCII inputs.
5d8727f3fbf4 [docs]: Mention implicit names in style guide
182a6eb05d15 Use magenta for warnings
991530ce394e Avoid unnecessary "Regenerating ninja files" step after runn=
ing "gn gen"
c1fc04434c8e Fix variable use tracking for scope subscript accesses.
cc56a0f98bb3 [infra] Link to jemalloc instead of rpmalloc
811d332bd905 Move WriteSourceSetStamp to NinjaCBinaryTargetWriter
3fccef9033b9 [action][data deps] Make data-deps order-only deps of the ac=
tion outputs
62ac86a938c3 [action] Add test for data_deps of an action target
1029a3b50873 Ninja: Always pass linker flags to rlib-generating command.
fae280eabe5d [serenity] Add SerenityOS port
11e12b0ef870 Remove obsolete comment
1de45d1a11cc Generate a StaticLibrary for rlibs and DynamicLibrary for pr=
oc macros
2a92efd396d3 Include library search paths when compiling rlibs
da5fe01bce4a Avoid unused and incorrect linker args in {{rustdeps}}

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ce-lstat64-stat64-functions-on-linux.patch | 60 -------------------
 meta-arm/recipes-devtools/gn/gn_git.bb        | 11 +---
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/gn/gn/0001-Replace-lstat64-=
stat64-functions-on-linux.patch

diff --git a/meta-arm/recipes-devtools/gn/gn/0001-Replace-lstat64-stat64-=
functions-on-linux.patch b/meta-arm/recipes-devtools/gn/gn/0001-Replace-l=
stat64-stat64-functions-on-linux.patch
deleted file mode 100644
index 159fbaaf9688..000000000000
--- a/meta-arm/recipes-devtools/gn/gn/0001-Replace-lstat64-stat64-functio=
ns-on-linux.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 25786d356ac391124489f2e55690281c03fa83db Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 22 Dec 2022 00:30:55 -0800
-Subject: [PATCH] Replace lstat64/stat64 functions on linux
-
-we define -D_FILE_OFFSET_BITS=3D64 which means lstat is operating on 64b=
it
-off_t and is same as lstat64, same for stat and stat64 case.
-
-This fixes build with musl where off_t has always been 64bit
-
-Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/14=
960]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/base/files/file.h             | 2 +-
- src/base/files/file_posix.cc      | 2 +-
- src/base/files/file_util_posix.cc | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/base/files/file.h b/src/base/files/file.h
-index 2c94eb4e..99e87ed9 100644
---- a/src/base/files/file.h
-+++ b/src/base/files/file.h
-@@ -23,7 +23,7 @@ namespace base {
-=20
- #if defined(OS_BSD) || defined(OS_MACOSX) || defined(OS_NACL) || \
-     defined(OS_HAIKU) || defined(OS_MSYS) || defined(OS_ZOS) ||  \
--    defined(OS_ANDROID) && __ANDROID_API__ < 21
-+    defined(OS_LINUX) || defined(OS_ANDROID) && __ANDROID_API__ < 21
- typedef struct stat stat_wrapper_t;
- #elif defined(OS_POSIX) || defined(OS_FUCHSIA)
- typedef struct stat64 stat_wrapper_t;
-diff --git a/src/base/files/file_posix.cc b/src/base/files/file_posix.cc
-index b1f9f5e8..049568f0 100644
---- a/src/base/files/file_posix.cc
-+++ b/src/base/files/file_posix.cc
-@@ -26,7 +26,7 @@ namespace {
-=20
- #if defined(OS_BSD) || defined(OS_MACOSX) || defined(OS_NACL) || \
-     defined(OS_HAIKU) || defined(OS_MSYS) || defined(OS_ZOS) || \
--    defined(OS_ANDROID) && __ANDROID_API__ < 21
-+    defined(OS_LINUX) || defined(OS_ANDROID) && __ANDROID_API__ < 21
- int CallFstat(int fd, stat_wrapper_t* sb) {
-   return fstat(fd, sb);
- }
-diff --git a/src/base/files/file_util_posix.cc b/src/base/files/file_uti=
l_posix.cc
-index aa54731d..53be3d3b 100644
---- a/src/base/files/file_util_posix.cc
-+++ b/src/base/files/file_util_posix.cc
-@@ -61,7 +61,7 @@ namespace {
-=20
- #if defined(OS_BSD) || defined(OS_MACOSX) || defined(OS_NACL) || \
-     defined(OS_HAIKU) || defined(OS_MSYS) || defined(OS_ZOS) ||  \
--    defined(OS_ANDROID) && __ANDROID_API__ < 21
-+    defined(OS_LINUX) || defined(OS_ANDROID) && __ANDROID_API__ < 21
- int CallStat(const char* path, stat_wrapper_t* sb) {
-   return stat(path, sb);
- }
---=20
-2.39.0
-
diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 7ec340c9d1b8..2bb29cc3bce7 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -6,20 +6,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d=
49a14dfe2d11837bb34d"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
 \
-           file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
-SRCREV =3D "4bd1a77e67958fb7f6739bd4542641646f264e5d"
+SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
"
+SRCREV =3D "f284b6b47039a2d7edfcbfc51f52664f82b5a789"
 PV =3D "0+git"
=20
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
-# Work around this fatal warning:
-# ../git/src/gn/desc_builder.cc: In member function 'base::Value {anonym=
ous}::BaseDescBuilder::ToBaseValue(const Scope*)':
-# ../git/src/gn/desc_builder.cc:179:21: error: redundant move in return =
statement [-Werror=3Dredundant-move]
-#   179 |     return std::move(res);
-CXXFLAGS +=3D "-Wno-error=3Dredundant-move"
-
 # Map from our _OS strings to the GN's platform values.
 def gn_platform(variable, d):
     os =3D d.getVar(variable)
--=20
2.39.3 (Apple Git-146)


