Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16877C5321E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:48 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.4037.1724291025269000576
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VDVQl8c8;
 spf=pass (domain: linaro.org, ip: 209.85.219.171, mailfrom: javier.tia@linaro.org)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso396755276.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291024; x=1724895824; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7LQHgRISQHcfF0QLO2liZofRFwc99d3sVsZckNqcRY=;
        b=VDVQl8c8cz5JhIeSAZR7oS0cYxKZ62NogpMOJStI4NqrP0UnmmdvRQlpT5R3jOSp3t
         j+3jU8s8GbfQgDv/g3zqjlVhbHGeX0CcWc3ze+b9OzRDFdVWpm+TJMc30fi3dY9IUxDr
         AAAOsOuDequ1lPxeyCjsA52PI4TL3IZPVTrYZDDPJehNbDlm3vH8dicKh/4yU6th7fT5
         i6yW6ZXG5wi/39TKT93WY2GikX3jkSkzxK6+Sek2XbHzsdpFgkxO/Dx83xyRPjqwx6fD
         lcOgc+AgSvnj9YL9EXBTxRydLbDCEqBJRnKDo1o3nmU9KkgZxD9B/RwALFCL+cEAF5ki
         tE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291024; x=1724895824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7LQHgRISQHcfF0QLO2liZofRFwc99d3sVsZckNqcRY=;
        b=pW1RfskrWaSocbQgjjHz+aWKscyuELdVnWgOfhh48ElOtr0zUPdidUBNx6Tkp+aPvR
         f8zflRs7h4PG42usZslePfMbTcgUJrkL0CglUIcT2HkbxYeQ6mb1v6OoNVZLZPBcHOiJ
         yzOqFKzYE9xoMWnMKItEhTQE/I6EB/zuzxgqfSiWy77UQoRo8BYRjPb25NUq0QAyuA7E
         9sNb/ifQCNkp7ItycR8hBcrE0OCVMzeGfs/2RldY3xjFd8bTJRScgDe7rhd91EKa78BO
         SfOHYoSQLd390wN+byzFVj7L+uwG6Z5asLPfOuq9HQzzvNP1wgTcM2pUL7jGJW2hfECd
         hrVg==
X-Gm-Message-State: AOJu0Yxn3+1TEaybfrSeG/eV6ZY9CmGlGIlacDxyphdEeoAQzweA4uqn
	bfgoBcw85jnEbGAr7gVzrixRRDou9VobR3VbOwpcsWN2Fw+l2V04Adzl57eCGv1Eih+wvWnoO2e
	m
X-Google-Smtp-Source: AGHT+IFC/P8CpSdx/Hx3d9uUR9WOn6glB6S1jnhkWjyLYJqgg2FPMCKdC1jGbQolaIIAd8VFS03wMg==
X-Received: by 2002:a05:6902:168e:b0:e16:5443:4c1 with SMTP id 3f1490d57ef6-e16664a50famr5520443276.35.1724291024270;
        Wed, 21 Aug 2024 18:43:44 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:43 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 02/13] core-image-base: Use UEFI layout disk partitions
Date: Wed, 21 Aug 2024 19:43:24 -0600
Message-ID: <20240822014335.3394568-3-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5992

- Use efi-disk-no-swap.wks.in disk definition to add expected UEFI disk
  partitions configuration.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 .../recipes-bsp/images/core-image-base-uefi-secureboot.inc       | 1 +
 meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend         | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
new file mode 100644
index 00000000..351e9030
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
@@ -0,0 +1 @@
+WKS_FILE = "efi-disk-no-swap.wks.in"
diff --git a/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend b/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend
new file mode 100644
index 00000000..1f6dbd24
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'core-image-base-uefi-secureboot.inc', '', d)}
\ No newline at end of file
-- 
2.46.0


