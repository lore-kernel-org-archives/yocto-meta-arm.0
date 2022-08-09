Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0339C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 12:37:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.11443.1660048635206561483
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Qs+7pIFJ;
 spf=pass (domain: linaro.org, ip: 209.85.128.54,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f54.google.com with SMTP id a11so6251906wmq.3
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=TaozoGDrv4aTJl6uR3e3aiyY9/kDAkYU/Ypt03QmUa4=;
        b=Qs+7pIFJ7w0eo45PnVYJ672klOBK+3kzgI89dpAhNxlrQYrMY6CzaHfrPT/IhFaBah
         dGIs5JwyyuvkNVMNwXD8zv1+AP4rPSU6qQg8/WCFK+laJIDE7Ahv/zHpmFkHVSa1XwUm
         R6aif56wpWz9d0RhPYiO8TNrZ+XgiHYttMJlVJlWUEblvCCcYLle/zpAqvSkpFz2YX/x
         UtBMDCMA+q9Mo3RL/4ABOcqH146BYCqzuIwYHYXlh35Tlh2vW+7c2D6F12vkta6HTHOG
         Pm0Xu87Ar4GpDoAi/uyGQNgG33RxsV7oSBhDCWlx2FmKT29U2yhAQzHoO5iI/8Zggv4E
         q1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=TaozoGDrv4aTJl6uR3e3aiyY9/kDAkYU/Ypt03QmUa4=;
        b=74M5/Salq/pZtLA4H/WFgXGuyhrJ6Y6hFfATC7N2h4cuyMzQZM5An9JoxJz5RqAdRs
         9K9IHzOq4Y7hc/6DFOkA3Rr8LwV7v5p4z7owZBHZ22b5+ou4IitV5uGmd2zT9deQ9oLg
         23fQS2lehyqIv3o4IxbhX5NRGYaxhb/5wf2ZEotKX/Y2ieyPO797okWNF3PDWmNVkdD2
         yJwQAEezzjzG/PE/UhCyqtvR6ivmcOaJ1Yl0lqd4hKoMaw5lgdQwTYBwreQWvPITq0Sr
         yPEe08bvZOR24L6H1jnbLPuYuYFBCOZeWLMxT1eeGFx1Ly/zt7HS1ngIRZXR3DlsQ+qK
         nezg==
X-Gm-Message-State: ACgBeo2g7J94H9R+D7luO9f6T1oM42GYk5DZF4633Fs9cJ/E5cwoNkA6
	KJbzcXAw6ZIpgFOFDNhd0WwZyN9luKg9gg==
X-Google-Smtp-Source: 
 AA6agR6zU/iTpIu4NpLiUpv7wVHBjRD+i7BNiZACOqxCG2B4qDqBZRn8OeBiZW5GXDRntY7NFK/bAg==
X-Received: by 2002:a05:600c:4148:b0:3a5:4f94:577b with SMTP id
 h8-20020a05600c414800b003a54f94577bmr3672675wmm.167.1660048633367;
        Tue, 09 Aug 2022 05:37:13 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003a38606385esm2081883wms.3.2022.08.09.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 05:37:12 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/2] arm-bsp/corstone: bump to u-boot 2022.07
Date: Tue,  9 Aug 2022 13:37:07 +0100
Message-Id: <20220809123709.2985416-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Aug 2022 12:37:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3662

Bump Corstone500 and Corstone1000 to latest available
u-boot version (2022.07).

Cheers,
  Rui

Rui Miguel Silva (2):
  arm-bsp/corstone1000: rebase u-boot patches on top v2022.07
  arm-bsp/corstone500: rebase u-boot patches on v2022.07

 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...d-add-load-command-for-memory-mapped.patch | 24 +++----
 ...add-support-to-corstone1000-platform.patch | 30 +++++----
 ...3-usb-common-move-urb-code-to-common.patch |  4 +-
 .../0004-usb-add-isp1760-family-driver.patch  |  8 +--
 ...ne1000-enable-isp1763-usb-controller.patch |  4 +-
 ...ntroducing-Arm-FF-A-low-level-driver.patch | 36 +++++-----
 ...7-arm_ffa-introducing-armffa-command.patch | 14 ++--
 ...troducing-MM-communication-with-FF-A.patch | 16 ++---
 ...troducing-test-module-for-UCLASS_FFA.patch | 10 +--
 ...stone1000-enable-FF-A-and-MM-support.patch |  4 +-
 ...one1000-introduce-EFI-capsule-update.patch | 30 ++++-----
 ...000-Update-FFA-shared-buffer-address.patch |  4 +-
 ...e-sure-shared-buffer-contents-are-no.patch |  4 +-
 ...000-fix-unrecognized-filesystem-type.patch |  8 +--
 ...tone1000-pass-interface-id-and-buffe.patch | 10 +--
 ...stone1000-pass-interface-id-and-kern.patch |  8 +--
 ...one1000-remove-guid-check-from-corst.patch | 10 +--
 ...-the-cast-when-using-binary-OR-on-FI.patch |  4 +-
 ...-error-code-when-rx-buffer-is-larger.patch |  4 +-
 .../0020-Use-correct-buffer-size.patch        |  4 +-
 ...e-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch |  4 +-
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |  8 +--
 ...-add-get_image_info-for-corstone1000.patch | 65 ++++++++++---------
 ...4-Comment-mm_communicate-failure-log.patch |  4 +-
 ...bootcomplete-message-to-secure-encla.patch | 16 ++---
 ...ull-pointer-exception-with-get_image.patch |  8 +--
 ...027-arm-corstone1000-add-mmc-for-fvp.patch |  6 +-
 ...ng-generic-timer-access-through-MMIO.patch | 16 +++--
 ...0002-board-arm-add-corstone500-board.patch | 22 ++++---
 31 files changed, 200 insertions(+), 189 deletions(-)

-- 
2.37.1


