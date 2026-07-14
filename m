Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16780C44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:24:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9603.1784035488648475077
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 06:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CgAmH4fj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAB8B339
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:24:43 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 197303F93E
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784035488; bh=8/gulNuCE6ocrZQhcr+qbOgbq5mJoVgBbBkWzVPLYkU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CgAmH4fjB17JxnNRxCev4xTMM5TeAxZTlTxLzdkpMz1HCfFJOXrmaYdIId411V2Ud
	 0rnb0Yyzxcgbj9zHwXw/vPV0H0AIKwz/szeCKO+l1nXDux7UdhdkkDkemhr/QgcV8b
	 +1k194I8h42VFaWIYUDe0t19p6MKxmQUf8jJ69PI=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/optee-ftpm: update recipe name
Date: Tue, 14 Jul 2026 09:24:46 -0400
Message-ID: <20260714132446.60585-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714132446.60585-1-jon.mason@arm.com>
References: <20260714132446.60585-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 13:24:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7112

optee-ftpm tagged the 4.10 release, but had no functional changes (that
is, they tagged the same commit of 4.9.0 with 4.10.0).  Update the
recipe name to match the latest version, and not have people think that
one package was held back.

Also, modify the version checking to be less incorrect

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{optee-ftpm_4.9.0.bb =3D> optee-ftpm_4.10.0.bb}          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-security/optee-ftpm/{optee-ftpm_4.9.0.bb =3D> op=
tee-ftpm_4.10.0.bb} (93%)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb b/m=
eta-arm/recipes-security/optee-ftpm/optee-ftpm_4.10.0.bb
similarity index 93%
rename from meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb
rename to meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.10.0.bb
index 0cbefceeec8b..9a58f7bc0753 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.10.0.bb
@@ -33,12 +33,15 @@ SRC_URI =3D "\
 # As per optee-ftpm TA documentation, we have to use this SHA of MS TPM =
reference
 SRCREV_ms-tpm   ?=3D "98b60a44aba79b15fcce1c0d1e46cf5918400f6a"
=20
-# v4.9.0
+# v4.10.0
 SRCREV_optee-ta ?=3D "a09269b15de635e1816fe832e26adfbfb44c5455"
=20
 SRCREV_FORMAT    =3D "ms-tpm_optee-ta"
=20
-UPSTREAM_CHECK_COMMITS =3D "1"
+# Because of the OPTEE portion being put inside of the ms-tpm, the
+# tooling usings the ms-tpm source for version and not the optee-ta.
+# So, disable checking
+UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
 S =3D "${UNPACKDIR}/ms-tpm"
=20
--=20
2.50.1 (Apple Git-155)


