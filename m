Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53B5C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 11:13:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.39271.1639566795927933289
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 03:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98EED11D4
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 03:13:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B56F3F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 03:13:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm-bsp/trusted-firmware-m: update CS1K bbappend for TF-M
 1.5
Date: Wed, 15 Dec 2021 11:13:11 +0000
Message-Id: <20211215111311.3066077-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215111311.3066077-1-ross.burton@arm.com>
References: <20211215111311.3066077-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 11:13:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2718

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-firmware-m_1.4%.bbappend =3D> trusted-firmware-m_1.5%.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1=
.4%.bbappend =3D> trusted-firmware-m_1.5%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_1.4%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-fi=
rmware-m_1.5%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-=
m_1.4%.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_=
1.5%.bbappend
--=20
2.25.1


