Return-Path: <andrew@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989BCC19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 05:48:46 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web10.9669.1740721723997477261
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 21:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@codeconstruct.com.au header.s=2022a header.b=fqNmszQe;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: andrew@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1740721722;
	bh=cs3D1zOoCFEK5KPpD74revwsTvZTZAiLmEHuSpQBh18=;
	h=From:To:Cc:Subject:Date;
	b=fqNmszQe945rspo26miODRRKPMmX6XvNpNZ3LDOHM2uvnwE2Z3ZqmZLTFexTHiy8+
	 1+XOvTL7StTh9vrzERj3fQpHKlSkqi5QmOhngFfF5C/Y1Prtm/zAKt58Mgm/tpqEVE
	 qAxZWV7qf6xZ+au5OIo9REptENWwflxTttR4bPSLLXEm9S4B2s3rB1Xd6SjtJgMD7K
	 d/Yvi7v/6eY4e9sw6TLzokqH1Vt5YJ62ZSpZJzRTmD7KwtEeIiSRwZkWgHuII9zAUA
	 KOh1bydMJcsH8QzqshgyAj0ERov0+Y5zADOoZWkvLYt69Ra6vzLAfd24noJ4dhyadk
	 W15sIO9Wpi4Ww==
Received: from localhost.localdomain (58-7-146-131.dyn.iinet.net.au [58.7.146.131])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0D31177DAB;
	Fri, 28 Feb 2025 13:48:41 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: meta-arm@lists.yoctoproject.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH] arm/trusted-services: ts-sp-fw: Replace v2.7.0 tag with commit ID
Date: Fri, 28 Feb 2025 16:18:34 +1030
Message-Id: <20250228054834.3224744-1-andrew@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Feb 2025 05:48:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6395

Do so for the usual reason of avoiding network access during recipe
parsing. Occasionally parsing will stall for me as it seems connectivity
to trustedfirmware.org can be flaky.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb =
b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
index 02f58fb42ef6..9fdb80441e07 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
@@ -15,7 +15,7 @@ OECMAKE_SOURCEPATH=3D"${S}/deployments/fwu/config/${TS_=
SP_FWU_CONFIG}-${TS_ENV}"
=20
 # The GPT parser component is needed from TF-A
 SRC_URI +=3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;=
name=3Dtfa;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/tf-a"
-SRCREV_tfa =3D "v2.7.0"
+SRCREV_tfa =3D "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 LIC_FILES_CHKSUM =3D "file://../tf-a/docs/license.rst;md5=3Db2c740efedc1=
59745b9b31f88ff03dde"
 do_apply_local_src_patches:append() {
     apply_local_src_patches ${S}/external/tf_a ${WORKDIR}/git/tf-a
--=20
2.39.5


