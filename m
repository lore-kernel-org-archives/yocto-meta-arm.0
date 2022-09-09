Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F302ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 13:41:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1374.1662730914584522051
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 06:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 493B4165C;
	Fri,  9 Sep 2022 06:42:00 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.46.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7A1C3F9AB;
	Fri,  9 Sep 2022 06:41:52 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	mohoma01 <mohamed.omarasaker@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: update board-firmware version
Date: Fri,  9 Sep 2022 14:41:10 +0100
Message-Id: <20220909134111.1074139-1-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 13:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3757

From: mohoma01 <mohamed.omarasaker@arm.com>

Update N1SDP board-firmware to N1SDP-2022.06.22

Mohamed Omar Asaker (1):
  arm-bsp/n1sdp-board-firmware: upgrade to N1SDP-2022.06.22

 ...ware_2021.10.12.bb =3D> n1sdp-board-firmware_2022.06.22.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-arm-bsp/recipes-bsp/images/{n1sdp-board-firmware_2021.10.12.=
bb =3D> n1sdp-board-firmware_2022.06.22.bb} (79%)

--=20
2.25.1


