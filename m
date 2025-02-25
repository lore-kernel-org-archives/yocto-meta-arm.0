Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38A6C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:18:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10382.1740496699008660403
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 07:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7CB22923
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:34 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C75D3F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:18 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm/gn: update to latest commit
Date: Tue, 25 Feb 2025 10:18:13 -0500
Message-Id: <20250225151817.11875-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250225151817.11875-1-jon.mason@arm.com>
References: <20250225151817.11875-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 15:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6387

Update to the latest gn commit.
Changes in gn between 95b0f8fe31a992a33c040bbe3867901335c12762 and ab638b=
d7cbb9ac8468bf2fbe60c74ed4706a14a7
	ab638bd7cbb9 Revert "Speed-up GN with custom OutputStream interface."
	2dd9331a7041 Speed-up GN with custom OutputStream interface.
	ed1abc107815 Add `exec_script_allowlist` to replace `exec_script_whiteli=
st`.
	c97a86a72105 Retry ReplaceFile in case of failure
	7296b601ea80 Fix crash when NinjaBuildWriter::RunAndWriteFile fails
	468c6128db7f fix include for escape.h
	5a47a93b9426 fix exit code for gn gen failure
	24e92acb8472 misc: Use html.escape instead of cgi.escape
	feafd1012a32 Do not copy parent build_dependency_files_ in Scope constru=
ctors.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 053cbdd1efcb..cc25b73f77e6 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49=
a14dfe2d11837bb34d"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
"
-SRCREV =3D "95b0f8fe31a992a33c040bbe3867901335c12762"
+SRCREV =3D "ab638bd7cbb9ac8468bf2fbe60c74ed4706a14a7"
 PV =3D "0+git"
=20
 S =3D "${WORKDIR}/git"
--=20
2.39.5 (Apple Git-154)


