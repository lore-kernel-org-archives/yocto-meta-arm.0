Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78081ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 13:15:52 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web12.9730.1663247742761866575
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Sep 2022 06:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=ka2jC/Ad;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21,
 mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id E31003200A2F;
	Thu, 15 Sep 2022 09:15:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 15 Sep 2022 09:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1663247741; x=1663334141; bh=SmbVls6c/u/HpF2RccUOAnfxz
	TIrStrx6vdykLXOXbI=; b=ka2jC/AdvBebjfxtAhWGsSmBEGMlbz1ysncvE/koA
	koSm3l/uRBsLPZj61diMIm3d6uSdQ7r83zpre+oY+R+FK9EajGFzWDdel/MalAMq
	Omuvrgs9sdg9YeBbw57jXLCpfPA/+8PLV7vpZc2cnzf0O+7Ak+RIfl1hzq+cKOjt
	7rhktSJPxs1UCI+t7ojky9Y0zcrpJSjZhDTzT7INlzs+JjlsDyPSNefvXSQKTBMG
	MCH6KTWueUEzQRF5d7P3CliVBsitET77NMf1qphF3G8bPx3MlK3xGEpotRr4LH0O
	iXVE/Aoz4umtRKlSBvST5TnhNC/xFollstlxdk3Oey6eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1663247741; x=1663334141; bh=SmbVls6c/u/HpF2RccUOAnfxzTIrStrx6vd
	ykLXOXbI=; b=doxEknYgFFVHafaenzQgamhVuAn7TulY4x6eGqf+HWRlsHF5VXZ
	tLEtmH7s65eLuFyur2klk6BUhoHvFVYWxmntRFEJAuBODgR5t2S39ul0UUuSF/mw
	7/ucmI2TCi6a0hpeq2fl4bejBcBgEWXcgAss7Xko+ER2vgVT+ARQucswBsOrQ1s4
	XwOoAtaVAPSF2nTQRSVmUEejgZ+iI0/sdocfV8T/s7Qymtapk8Nj6wPpLrH8bVPz
	S/h6ZrBj7W+8emm7FUQT4j83BLgJLR3N/dCFUDY+mmTIOksUzhuOuF6Whaxh3OkX
	ndrHgjsB5A4Yhn7vq237z0oROzNqsFXd/gA==
X-ME-Sender: <xms:fSUjYywnwtbt00IjEHzRpaPCPIORzonSclSm67H9Gknmm9f5p2qGuA>
    <xme:fSUjY-RRYmwf5Svi5CTGFSydEXntIELOIRkPBolCSbnrGcqdMw5t8KFNLAVoJx1oM
    aJClqfNjFg--M_GFW0>
X-ME-Received: 
 <xmr:fSUjY0UOAKlLGV898_gIuRkb1Ku5ar2CkpKlnkr3I9qv5_SbylH_LbP6uf7n9D7pKbJYAF3ke7goYE3rDHZ3y-iTMozqXz7Qwy-LJitpOT6OLYyiDFjumYKv>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:fSUjY4h9V0RtLESu96-_PaHopaNHncdq-dFH341BoMiaxZojzfD24g>
    <xmx:fSUjY0BnrJkTgh9dZPe2j_lW4ryw1HYgEPhQ198o8LelcV8ZTWbuHw>
    <xmx:fSUjY5ISEoN6OfsdfNq9WBm19Cqq6Ij6Pt8QGaNILw6Rjp_F4tq3gQ>
    <xmx:fSUjY96xPd4aX6VX81q67qVuLhMjUZcApEa_1yBfCivRh5nIkCRE2w>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 09:15:40 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-arm@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] edk2-firmware: Fix configure sed typo
Date: Thu, 15 Sep 2022 15:15:30 +0200
Message-Id: <20220915131530.1677573-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Sep 2022 13:15:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3786

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The configure sed operation will not behave as expected because '*'
match misses a preceeding '.'.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index e0dfa28..c9f1f1d 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -81,7 +81,7 @@ export CLANG38_ARM_PREFIX = "${TARGET_PREFIX}"
 TOOLCHAIN:arm = "gcc"
 
 do_configure:prepend() {
-    sed -i -e "s#-target ${HOST_ARCH}-linux-gnu*#-target ${HOST_SYS}#" ${S}/BaseTools/Conf/tools_def.template
+    sed -i -e "s#-target ${HOST_ARCH}-linux-gnu.*#-target ${HOST_SYS}#" ${S}/BaseTools/Conf/tools_def.template
 }
 
 do_compile() {
-- 
2.25.1


