Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5258C0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 07:24:28 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.46551.1737962662222048102
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 23:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WHtiyPbx;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so42974241fa.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 26 Jan 2025 23:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737962660; x=1738567460; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMSfkl+MiR4pvhWp19Iom+S29XuudSHF0nnvrul3ctc=;
        b=WHtiyPbxqOO1dtdDUiqn9CpfdTc1o6QiuX8jVv4GEfe9nJA+SHbBSJHG5B+khgrgHl
         emg0SZrxFif6UpTjjIhTX8HDSr2K++6jrP6TFlS51yvBIgoBmltlbWi1GcNpjzmVOkAs
         Ul+u+vlgyptj21cj5fYlvCDhuwG0DjZYCgJRghySPfLYPfHdSUJIldS99/plXy+/mNlr
         AU4lJymfHAgVjeL7pNwmQb7d6aso7yW2fZeVj+Yj6VY/kXGpPrYxbXdSNv3yUMIOF/CU
         27rP5v34kbUuSO+fCTfiR4jtR4C5l1uDFSK772oLxhybneg7Grq27NFB7elqZ5aJXGXP
         QkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737962660; x=1738567460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMSfkl+MiR4pvhWp19Iom+S29XuudSHF0nnvrul3ctc=;
        b=plni/I/1fTOdu05TH+bgRUrFIDYBdNupjw1ENzIeZwtJpt/oSK/YpF56VRQ6cWYrVo
         nZqoiQXhuVo+X9AOUv+sHjawKfi9ehGtIIXk5qRMG7ID+/BNvdIghG1HczBWTNm0DNTC
         qkfO2tCxz78OG9bDLIOHpDQFvT7qNV1mifdyG871PWWuoq5n3yiNYVN6B8Kw716ZrsCy
         v5VvpH1HV2WVF01CP2KUCQM7KAXktKTDF0avBsuECEuWtIQ+1LVa04kZpecoYpNnhzc/
         X8JFbPbNeFynngTdI/hXim8xYmpg5PT+KteRK7y3o7SmOc6Sf3bOgrz/d35sjCfeJ6ep
         A+/g==
X-Gm-Message-State: AOJu0YyCr2ZWp1PhLHrA+cSkYfZIjlc8MrAZ1fTYPriv9EjWJGNvVupF
	09OM9/0yS9OZvrlrl7bkCjYgklbCxDyLd9u733Vfl45SjuNygZfVpKF6FNH20moE+e2fFdNL1VR
	bLAQ=
X-Gm-Gg: ASbGncsOPYQhgr4YFqgeKzXkjH9hQkD9Ax/cQzzRXnL1fPyJZUsLVaATbpScKdfTCe6
	9IK12ikhk+GJqxDaWvkdhVVGfapRO60ZQKL8aIorUn8ZOAPZYgCWQlfOAMYqtThvKnInLVsSARj
	quPL2MVOTFBTnnmPv1GJCO9mFsfcRqiBD36VSS2a26UT5PgzCj6LZiVQSwcBg4KmzcTwq5+bHWz
	2SjJj7xAp9q9f9vxR+DnNcKvvrLkzKSehUkFllj1ue2gV+8yushM6PK+Ef4p8Z3hKZI/EZ/nC7H
	bUa1yc17E4agPEM8ITmsRR5JtmQMVmwCCOrPiQsU5K8Hjmc37ZFP6Q==
X-Google-Smtp-Source: AGHT+IHj+/8/A5YgA+aOVKl81LU750QNb1k44SGsBGGrdMaQ6R5jnqaEUiEsmBCLBxothOLo+LhBbg==
X-Received: by 2002:a2e:bc83:0:b0:300:2a48:fb65 with SMTP id 38308e7fff4ca-3072ca99e81mr184361351fa.18.1737962660248;
        Sun, 26 Jan 2025 23:24:20 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-4aa-fa00--193.rev.dnainternet.fi. [2001:14ba:4aa:fa00::193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc51792sm13348341fa.109.2025.01.26.23.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 23:24:18 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] systemd-boot: update systemd-bootaarch64.efi path
Date: Mon, 27 Jan 2025 09:23:56 +0200
Message-ID: <20250127072356.852345-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Jan 2025 07:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6350

poky updated systemd from 256 to 257 which changed
the build time path.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
index 84196a68..9d72dac5 100644
--- a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
+++ b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
@@ -1,6 +1,6 @@
 inherit sbsign
 
-SBSIGN_TARGET_BINARY = "${B}/src/boot/efi/systemd-boot${EFI_ARCH}.efi"
+SBSIGN_TARGET_BINARY = "${B}/src/boot/systemd-boot${EFI_ARCH}.efi"
 
 do_compile:append() {
     do_sbsign
-- 
2.43.0


