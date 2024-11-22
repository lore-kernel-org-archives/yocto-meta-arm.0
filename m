Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4A5D75E41
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:39:36 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.24127.1732282769157706626
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Nov 2024 05:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JL5TfjLe;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ff589728e4so35650051fa.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 05:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732282767; x=1732887567; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEcGCk/1b+B5FcqVqn9pzkj+oiOC7H3PZ67vjLbiQ9I=;
        b=JL5TfjLeK2bb3vzfltZDSt9DFZUI7ISDwhrntsMwjr1hSAXWhmGsILTDFeAXYIQuKv
         FaFXZFzLQ0p3WVmSFV9NDQk+HHYxkGJvzk0P/SQet+6mLs5MgIJ+ohFWA1JFN828TxRD
         LpiyCF+ZXgxt+WNC2IaU/FMDf/0cmX3pvz3dsJB5y9E9/wOvEE/a+EyK/Xu+o9k/k7cp
         NN0p7E514gtx80NGHn50R+E2A5WP4O2a8mVj3gglj2sQW5J4eo3Bj/LyLxa13VRQKZzx
         wyVlSkgY0X7eNkc47fJ8QFqEGdouvUOEjwfw/MEWDBRh36SHgMlqBipzxeZ5gGZzJ2nI
         a4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282767; x=1732887567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEcGCk/1b+B5FcqVqn9pzkj+oiOC7H3PZ67vjLbiQ9I=;
        b=q7AYp43nbpl92t9mClKUPZVYgf7v7ICtyMFmTFaKEVi2fVn2OGL5cfEZLJTlfPupZ7
         Hjh81L+XEmiTjjrxzo9IPlHi0YpOrIir9miuiPM0inzNitwnscSsE7g4NtXFOvmD+E5o
         14kABDUbF9JteVQ+C5QQfCU2GIShFa7blPp1/MBhaIV+S5RBkFWtn1mhqkYs1xtu32mG
         SmCiCmmKqqmAU8rtrvlsEBZosh6r4r/t3OsMnTvg7yuyf+2BzbEnjn/XO/vqaHuKpcJf
         gR9ekFhF94xKbN83oJpWSlGCP1af02l3b+HS54mVvq7jGNxHRHjlXmwLUfLZAYXyeXEZ
         j9BQ==
X-Gm-Message-State: AOJu0YzoYu0LH7za8bdjsFgS2lDkvanGHydhuEGPVA5vm9xy5YbG/AEB
	244utXCdVGkTVtT/hrhuzcTgOMGQfTCwIBNwx+9OFYpLIZfGe4AK6cTMF/qvIv8/G31cDvzhPfH
	m
X-Gm-Gg: ASbGnctofo2FM+B525HSCMBrQGd0pWqwnQUi1P/8aBYrZdb0ljmjNtmEa/xQxn1NtSc
	hoOum4Gm0EeONu53DuSvv9D6KvfY7o+weYfRSilLJ7UPmNWHaoaXVq/sKiEPklJWqpWT15NGzTT
	38oKnF58xX5Idf7W4rlTgcsevVIBx+0kWVBBR7sE1aTNxBGLVJLtOIapcCkyjkLqS0gUgoQaY/l
	cPD/S/AjWo1dhG52Q2nFnLcTqcPWge9RqhFxNKiGnREhNPfD2bPrRGutwxh3BqLJIhixmFalq9Z
	rtwlhDtBmdX5b/m6XooJvLxs2Q==
X-Google-Smtp-Source: AGHT+IG15pCWwCcpw6H79aamhqlgPg4EXxa44nuFXvvnTDFXQawJnhDWFqHYFLjMjI4Dps8CU0wa0g==
X-Received: by 2002:a05:6512:230b:b0:53d:ce98:37ca with SMTP id 2adb3069b0e04-53dce9838d2mr1713751e87.28.1732282767329;
        Fri, 22 Nov 2024 05:39:27 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-7452-eb00--133.rev.dnainternet.fi. [2001:14ba:7452:eb00::133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd248b1dcsm375253e87.203.2024.11.22.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:39:26 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/4] uefi-secureboot.yml: remove duplicate distro features
Date: Fri, 22 Nov 2024 15:39:02 +0200
Message-ID: <20241122133904.202082-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122133904.202082-1-mikko.rapeli@linaro.org>
References: <20241122133904.202082-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Nov 2024 13:39:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6254

Setting INIT_MANAGER to "systemd" already sets needed
feature flags. Appending to them only causes sstate
cache invalidation and recompilations.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ci/uefi-secureboot.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
index e8aa6004..e84d3bc6 100644
--- a/ci/uefi-secureboot.yml
+++ b/ci/uefi-secureboot.yml
@@ -29,8 +29,6 @@ local_conf_header:
 
     # Use systemd as the init system
     INIT_MANAGER = "systemd"
-    DISTRO_FEATURES:append = " systemd"
-    DISTRO_FEATURES_NATIVE:append = " systemd"
 
     IMAGE_INSTALL:append = " systemd systemd-boot util-linux coreutils"
 
-- 
2.43.0


