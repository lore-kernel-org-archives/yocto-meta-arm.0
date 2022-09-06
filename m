Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA626C6FA83
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 14:31:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4953.1662474713687516344
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 07:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 915861AED;
	Tue,  6 Sep 2022 07:31:59 -0700 (PDT)
Received: from e127954.cambridge.arm.com (e127954.cambridge.arm.com
 [10.1.195.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A242C3F7B4;
	Tue,  6 Sep 2022 07:31:52 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp:ffa-debugfs: update git SHA for v2.1.0
Date: Tue,  6 Sep 2022 15:31:41 +0100
Message-Id: <20220906143141.568959-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906143141.568959-1-vishnu.banavath@arm.com>
References: <20220906143141.568959-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Sep 2022 14:31:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3737

From: Vishnu Banavath <vishnu.banavath@arm.com>

git sha on
https://git.gitlab.arm.com/linux-arm/linux-trusted-services/-/tree/v2.1.0
has been changed recently for v2.1.0 tag. This change is to update
ffa-debugfs-mod_2.1.0.bb to fetch correct git SHA.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb=
 b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
index 4051c345..1b265a57 100644
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://arm_ffa_user.c;beginline=3D1=
;endline=3D1;md5=3Dfcab174c20ea
 SRC_URI =3D "git://git.gitlab.arm.com/linux-arm/linux-trusted-services.g=
it;branch=3Dmain;protocol=3Dhttps"
=20
 # ffa-debugfs v2.1.0
-SRCREV =3D "77967912d033144aff2695cecbd52d3be450deaa"
+SRCREV =3D "45eb7c1484ae9bea2bbd0583b86beb55b627073b"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1


