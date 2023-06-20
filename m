Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962A1EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 14:01:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11046.1687269700784267372
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 07:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AD901063;
	Tue, 20 Jun 2023 07:02:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1606B3F663;
	Tue, 20 Jun 2023 07:01:38 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/gn: fix build with GCC <13
Date: Tue, 20 Jun 2023 15:01:37 +0100
Message-Id: <20230620140137.481227-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Jun 2023 14:01:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4810

From: Ross Burton <ross.burton@arm.com>

The previous commit fixed the build of GN with GCC 13, but broke it for
any other version.

Remove the patch and simply disable the fatal warning that causes the
breakage. Interestingly, this warning is already disabled for Windows
builds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...Remove-redundant-move-in-return-stat.patch | 43 -------------------
 meta-arm/recipes-devtools/gn/gn_git.bb        |  7 ++-
 2 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-=
Remove-redundant-move-in-return-stat.patch

diff --git a/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-=
redundant-move-in-return-stat.patch b/meta-arm/recipes-devtools/gn/gn/000=
1-desc_builder.cc-Remove-redundant-move-in-return-stat.patch
deleted file mode 100644
index f712037a..00000000
--- a/meta-arm/recipes-devtools/gn/gn/0001-desc_builder.cc-Remove-redunda=
nt-move-in-return-stat.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 45673f4f62eb063d6d5aa0ad68a6171936ad9347 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jan 2023 00:13:57 -0800
-Subject: [PATCH] desc_builder.cc: Remove redundant move in return statem=
ent
-
-Fixes build with gcc13
-
-../git/src/gn/desc_builder.cc: In member function 'base::Value {anonymou=
s}::BaseDescBuilder::ToBaseValue(const Scope*)':
-../git/src/gn/desc_builder.cc:179:21: error: redundant move in return st=
atement [-Werror=3Dredundant-move]
-  179 |     return std::move(res);
-      |            ~~~~~~~~~^~~~~
-
-Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/15=
000]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/gn/desc_builder.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/gn/desc_builder.cc b/src/gn/desc_builder.cc
-index 444a5e02..3ef170c3 100644
---- a/src/gn/desc_builder.cc
-+++ b/src/gn/desc_builder.cc
-@@ -167,7 +167,7 @@ class BaseDescBuilder {
-     base::ListValue res;
-     for (const auto& v : vector)
-       res.GetList().emplace_back(ToBaseValue(v));
--    return std::move(res);
-+    return res;
-   }
-=20
-   base::Value ToBaseValue(const Scope* scope) {
-@@ -176,7 +176,7 @@ class BaseDescBuilder {
-     scope->GetCurrentScopeValues(&map);
-     for (const auto& v : map)
-       res.SetKey(v.first, ToBaseValue(v.second));
--    return std::move(res);
-+    return res;
-   }
-=20
-   base::Value ToBaseValue(const Value& val) {
---=20
-2.39.1
-
diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 44a7f3a6..3713787a 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -5,7 +5,6 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837bb=
34d"
=20
 SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
 \
-           file://0001-desc_builder.cc-Remove-redundant-move-in-return-s=
tat.patch \
            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
 SRCREV =3D "4bd1a77e67958fb7f6739bd4542641646f264e5d"
 PV =3D "0+git${SRCPV}"
@@ -13,6 +12,12 @@ PV =3D "0+git${SRCPV}"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
+# Work around this fatal warning:
+# ../git/src/gn/desc_builder.cc: In member function 'base::Value {anonym=
ous}::BaseDescBuilder::ToBaseValue(const Scope*)':
+# ../git/src/gn/desc_builder.cc:179:21: error: redundant move in return =
statement [-Werror=3Dredundant-move]
+#   179 |     return std::move(res);
+CFLAGS:append =3D " -Wno-redundant-move"
+
 # Map from our _OS strings to the GN's platform values.
 def gn_platform(variable, d):
     os =3D d.getVar(variable)
--=20
2.34.1


