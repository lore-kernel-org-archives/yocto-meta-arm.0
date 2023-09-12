Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356FFCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 07:35:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19801.1694504113978235995
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 00:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16200C15;
	Tue, 12 Sep 2023 00:35:50 -0700 (PDT)
Received: from Ubuntu.cambridge.arm.com (PW04GXME.arm.com [10.1.29.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0D4F3F67D;
	Tue, 12 Sep 2023 00:35:12 -0700 (PDT)
From: mariam.elshakfy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: [PATCH 0/2] arm-bsp/optee-os: N1SDP upgrade optee to 3.22
Date: Tue, 12 Sep 2023 08:34:57 +0100
Message-Id: <20230912073459.4681-1-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 07:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5041

From: Mariam Elshakfy <mariam.elshakfy@arm.com>

These patches update optee-os and related
components (optee-os-tadevkit, optee-os)
to 3.22 for N1SDP platform.

Mariam Elshakfy (2):
  arm-bsp/optee-os: N1SDP upgrade optee-os to 3.22
  arm-bsp/optee-os: N1SDP upgrade tadevkit and optee-test to 3.22

 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 ...lat-n1sdp-add-N1SDP-platform-support.patch | 28 ++++++-------------
 .../n1sdp/0004-Handle-logging-syscall.patch   |  6 ++--
 ...pend =3D> optee-os-tadevkit_3.22.0.bbappend} |  0
 .../optee/optee-os_3.20.0.bbappend            |  1 -
 .../optee/optee-os_3.22.0.bbappend            |  1 +
 ....0.bbappend =3D> optee-test_3.22.0.bbappend} |  0
 7 files changed, 14 insertions(+), 24 deletions(-)
 rename meta-arm-bsp/recipes-security/optee/{optee-os-tadevkit_3.20.0.bba=
ppend =3D> optee-os-tadevkit_3.22.0.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-test_3.18.0.bbappend =3D=
> optee-test_3.22.0.bbappend} (100%)

--=20
2.34.1


