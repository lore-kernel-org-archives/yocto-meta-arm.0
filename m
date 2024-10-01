Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36C7CEACFA
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 18:39:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89686.1727807947462473751
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 11:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E077339
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 11:39:36 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A4D03F58B
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 11:39:06 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/gn: update to latest commit
Date: Tue,  1 Oct 2024 14:39:02 -0400
Message-Id: <20241001183903.13457-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241001183903.13457-1-jon.mason@arm.com>
References: <20241001183903.13457-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 18:39:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6159

Update to the latest gn commit.
Changes in gn between b2afae122eeb6ce09c52d63f67dc53fc517dbdc8 and 95b0f8=
fe31a992a33c040bbe3867901335c12762
95b0f8fe31a9 Improve error message for duplicated items
e30a1fe26e5e [rust-project] Always use forward slashes in sysroot paths
20806f79c6b4 Update all_dependent_configs docs.
f792b9756418 set 'no_stamp_files' by default
60a28b636057 fix a typo
b5ff50936a72 Stop using transitional LFS64 APIs
a737c2849f13 do not use tool prefix for phony rule
e080b4d340c2 [rust] Add sysroot_src to rust-project.json
50ecf4c84d08 Implement and enable 'no_stamp_files'
4e4b8d989499 Add Target::dependency_output_alias()
225e90c5025b Add "outputs" to generated_file documentation.
9e0c7b7cefb2 Update bug database link.
d010e218ca70 remove a trailing space after variable bindings
32f63e70484f fix tool name in error
f190770a69a3 remove unused includes
54f5b539df8c Markdown optimization (follow-up)
e3d088c4b6ac Support link_output, depend_output in Rust linked tools.
fc8172f4a107 Properly verify runtime_outputs in rust tool definitions.
fdb90141934a BugFix: Syntax error in gen.py file
93550dc1701d generated_file: add output to input deps of stamp
449f3e4dfb45 Markdown optimization:
05eed8f6252e Revert "Rust: link_output, depend_output and runtime_outputs=
 for dylibs"
8f2193f70793 hint using nogncheck on disallowed includes
0ee833e823f2 Rust: link_output, depend_output and runtime_outputs for dyl=
ibs
1b41f0502f87 Add missing reference section to function_toolchain.cc

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 620f75643a5f..053cbdd1efcb 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49=
a14dfe2d11837bb34d"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
"
-SRCREV =3D "b2afae122eeb6ce09c52d63f67dc53fc517dbdc8"
+SRCREV =3D "95b0f8fe31a992a33c040bbe3867901335c12762"
 PV =3D "0+git"
=20
 S =3D "${WORKDIR}/git"
--=20
2.39.5 (Apple Git-154)


