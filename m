Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6A1C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 17:09:06 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.109666.1673370537370662426
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 09:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20210112.gappssmtp.com header.s=20210112 header.b=ruTp7ObF;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.179, mailfrom: troth@openavr.org)
Received: by mail-il1-f179.google.com with SMTP id a3so774373ilp.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 09:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UgJyd9pz1Ij1C/H7qP4NQ2HO4mNBMKSvwbVa4ocNcIE=;
        b=ruTp7ObFg4HK7OrCF2f5rtyY5U+p1C+esDM0Ncee4wBsblAgaDGEHOUQYk+syw0HAx
         4eu1l0Aqtm1P6B1VZihEuK+OC6jfSIdjYPyLB/INEDLNdsGfzJQaHm8tguquSQzZpggB
         dBuQ4ClJVjHgpfwv6d5drfe/xh4Di8sCID9lY0v3Ove+mNwiXZ6rIu/tCJupjlFSBl3T
         en3vh0mmsN4x/+0Q9YikzNz9v61NdJvIYuivGhsDHwtggQSgGRH+ft1Fwquqv+29tj+7
         fNTAmg/FIZJXZR57vA47kSjpmFo8xVCjRSCfmZEK6Y3ljFFTcY2EM1Ik5VrER0cwh389
         CajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgJyd9pz1Ij1C/H7qP4NQ2HO4mNBMKSvwbVa4ocNcIE=;
        b=dcLBggYMkAe6dutldxDpcMENyAC6B395vtlnSAoNxwVpTyhEjPRyKhjVZQd/xxm/oQ
         3wQ0RteczYRKMqJeZBGNdiu3OtZr4DtTPu7Dix7alzbtJzo7OLiGt7pmlUP5BF4Hmf9y
         A+AMVQtHynujceqOQl0879sR+K794gMiaFpLRRn9cGecxlKqca36d3dqlw1EqC7Hs6qb
         DwMcoFLSzcrSLUa5diF5PRVU+K4B08zz/LkBarqBjLLk339V4MHIWz5JpRSC2kGzjRDl
         D8gp7pkFR2X2O5GLpuwUMlZHSNZduYYyHidjcCuzJxR//hIoa5SHggp3BfKP9pzEH08n
         D+KQ==
X-Gm-Message-State: AFqh2koeNoIREaBh0XkN89HwejCnyXDh44wGvcchzelUzlSf137TWtr9
	RkAF4sY1lcsZIAVYNQHGoLsqNZSG/JEeeu9j91oE5Q==
X-Google-Smtp-Source: AMrXdXufobf8HeePb3v56HhoYcnB9uMVAWx+MDVgMb0np4QTCuDj5Nx8zVbGsCBQ2uTDfi2wcCEVEQ==
X-Received: by 2002:a05:6e02:1524:b0:305:e1f9:89b with SMTP id i4-20020a056e02152400b00305e1f9089bmr59894528ilu.24.1673370536193;
        Tue, 10 Jan 2023 09:08:56 -0800 (PST)
Received: from beast.lan (c-24-8-144-174.hsd1.co.comcast.net. [24.8.144.174])
        by smtp.gmail.com with ESMTPSA id a17-20020a92d591000000b0030be6c79645sm3632749iln.68.2023.01.10.09.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:08:55 -0800 (PST)
From: "Theodore A. Roth" <troth@openavr.org>
To: meta-arm@lists.yoctoproject.org
Cc: Ross.Burton@arm.com,
	jdmason@kudzu.us,
	Emekcan.Aras@arm.com,
	"Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [PATCH] arm/optee-os: Fix FILESEXTRAPATHS
Date: Tue, 10 Jan 2023 10:06:27 -0700
Message-Id: <20230110170627.10991-1-troth@openavr.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 17:09:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4252

The include file should be pointing to `optee-os-3.19.0` instead of
`optee-os-3_19` (which does not exist).

Fixes: 3259a2a8402f ("arm/optee: support optee 3.19")
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 meta-arm/recipes-security/optee/optee-os-3_19.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os-3_19.inc b/meta-arm/recipes-security/optee/optee-os-3_19.inc
index 8adb6996..61475dcf 100644
--- a/meta-arm/recipes-security/optee/optee-os-3_19.inc
+++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 inherit deploy python3native
 require optee.inc
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3_19:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3.19.0:"
 
 CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
 
-- 
2.25.1


