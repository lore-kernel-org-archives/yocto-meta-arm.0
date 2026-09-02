Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA1AC624DC
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:26:56 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7755.1788388013348788548
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=Vn5YskrY;
 spf=pass (domain: peridio.com, ip: 209.85.217.50, mailfrom: javier@peridio.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-744ca620161so78742137.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788388012; x=1788992812; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuqAM1mvGfizIRVxDKjrrTYPFlonuPJHHZmzFH13fh4=;
        b=Vn5YskrYi5GciSOQag1O3Lec8WyoAmW3r+1RQbFmChlVR/ME0ZhTc6/F0HGJRDq5qu
         zs0Ei1GMQMgcOsfaQ8EJ0uu2e6pclZMzMHAG0Z60H5DFVkWcMcFo4B2/Q6q5GOeOIZXe
         2wenFsz7qp1fOnHIB/Cczhn/T4xlo0LjzAIcNJ+tOjnjZFcqkzfuHC5GzIYb+rPwC3Hm
         EZ8LdhMhW6y2+rs3Kf+l+RsPAbIauCdagtQziF+qRM0nWn1V/CXQW9EZmGzczPj9lVCi
         4TkmTfKz22BE3J3XWM74y0v570bInh8v5JDepp464Wi9lZQCnb8H9b3CDdFWQ4mTO1NX
         7tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388012; x=1788992812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuqAM1mvGfizIRVxDKjrrTYPFlonuPJHHZmzFH13fh4=;
        b=p6JR6u151zCYTaESU3BIOp1s/9zk/oDx7rqTgZDsthSDnBVpGhwPMi96yYI5b6/+Nh
         Qu3Bgj5nwtT0rDtO7OpITW8ZwiMTmTvvUiE+xae/9YzECIlIVBSE/If5wJQziJTUnsbh
         +NBEn6/tu5RMTlX7USnO01EVRA5hdpcBNZxvwoA3ajMGsMZ9z6GrOgK7TjeQe2oaFSBP
         NCPtNoUmo4dKHyr2e5lEvMH2kEXLmrto00ed9rX5oOSOMMor6208iTs/LLzTBdnYHAVN
         3N9GQKq1C/VUvS/44+Y7pS2wD2eQAwmfiO5KBzwcg6pi1wk30pgypZEqbfnZjzBpVyme
         pbZQ==
X-Gm-Message-State: AFuF++lQFVzQNyIqbOptaFZFd5TTeJo/G7paEm0mw+PRZKeecNkhD14a
	cF9OuKsnZbwiApOJ3tmTx6mgO30ML5ywuQHg2JfA+Us9pe22Cl0oHYz5NAPt5Js7Mx+ux2cgLig
	Y2TIJuTE=
X-Gm-Gg: AYBFou0NrGwHQcCDdE+j0lBJ3P1YPwCwl6xczEIqtGBs7kYU+smBnqo/VCF2M5haraX
	mlbZvebks80WEzQA2fKUu94/AJhXJr8x4G4Bc65P6yjVa8/65gHXoK981ojM3SX6Uyn/MMGWIGQ
	gCs28UEPXcwuj/1F8ELXVsLRaahfmTjbj738f/vp50LV13cY1UiGd3qyhmHqGNfRG9zqLz2Qst6
	XVrkBvF1Dv99dd2buqna8oc+aMwtYpvXgzorzIs4VseE4GHC/12lhgK/m+ZCi4rIp4odnGXzidW
	52mLytq0FBVvq9T0sZvKOOWk5/qr6cMB9/FevfCU3oMF0VNUQ55cpWiHTWKKCWxf8mFlYWgnfzC
	1ymu99Mi+n1gl0tj7IV7eN1bBGo4ImBsyKq5Z7rzfem7YPXQK0GhV9MR/hp2fplOoxvN1rv6dTD
	79RQy4Ss9fwGTFA+dJL9dAymGsQsUKGq2VyyNjsgHa4Ra26K3ADK85nW4=
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr1234901137.1.1788388012187;
        Wed, 02 Sep 2026 15:26:52 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a251ca6sm3469633137.4.2026.09.02.15.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:26:51 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier@peridio.com>
Subject: [wrynose PATCH 3/4] arm/trusted-firmware-m: add CVE_PRODUCT
Date: Wed,  2 Sep 2026 16:26:45 -0600
Message-ID: <20260902222646.2945592-4-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902222646.2945592-1-javier@peridio.com>
References: <20260902222646.2945592-1-javier@peridio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:26:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7155

From: Jon Mason <jon.mason@arm.com>

Per https://nvd.nist.gov/products/cpe/detail/C0F7CF14-9ACD-42C5-A1F8-839937F8C4DC
add CVE_PRODUCT entry.  Since there wasn't one existing, there is no
need to remove anything.

Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit d0b93e582c7beb57e2d446311a93f5ab8b94fce1)
Signed-off-by: Javier Tia <javier@peridio.com>
---
 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 4e3c5912..86085757 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -118,3 +118,5 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
 # Target binaries will be 32-bit Arm
 INSANE_SKIP:${PN} += "arch"
 INSANE_SKIP:${PN}-dbg += "arch"
+
+CVE_PRODUCT = "trustedfirmware:trusted_firmware-m"
-- 
Javier Tia


