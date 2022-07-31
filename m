Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B09C19F28
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 03:06:48 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.9809.1659236802787102038
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=stjoak6Z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id m7so6281041qkk.6
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=31cmj3bHwUcjanI2SgbxYjBJr0U7CxAA3aL9tf2RMx8=;
        b=stjoak6ZBsi9G3p0iuXj7cmuYWLUZEE0yHFE15Cu3m0X1ilyjnTgwTRH7kUHXSSvqb
         /gzHznigijFhuv3/MucWdicSIssjEGZmViSWDY9sL9KLTcVVmKaWVHebN46c3Xc6/+VB
         OcereVooDp3js3yMoLGhMdfzwrz6NFhNj0BTD8QNbxVLbSpdDNSWfSUVbIYd3dPlYiHo
         S3db8Ocp9nu56WEwBD65ArAFEP5fxHRbK6aoA+eCFoNQpA5hsPeSnfw+GykkEVTNhYPR
         nLbzWU4xq7RnpiDVZDxK3JcTjt7kMG/F0qFrkriBd/U0sAx1zqTNlUKqi5Tqq0LzGvAf
         x42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=31cmj3bHwUcjanI2SgbxYjBJr0U7CxAA3aL9tf2RMx8=;
        b=OCAtKFJh5lQLiAr4Trm1mrnvppWSMroaAkKC83ZFj52eJEH2Oqx+5zwRb8LFDXgd7z
         dYk2I5Fu9SXOLLEMKLkQkmY8MTw7u165igTcSO5/e1rnlkAr6VgAEjkfPXqOoZRLPoOM
         sLeGaVDViXtBB5S2BT7Ehvs5bWirBDywpyFD04OoY4LsycpN8p/4XZX0mbrktxaytwMw
         z1C/Yqk6xRfA1NslcZDuyP6AjfiH+iSwDZIBEKiJeF+gYIvn1iLGQoJPY1xUOPtpbYbt
         DjdBZtZJ36KMoQ4ROQXQX7fjq/9HBwy6C7rfg5u13tZ+Z7lpKV7uEsfC1umA9zg6JWCb
         rEUA==
X-Gm-Message-State: AJIora/zH6vk2oXV8Fi504RdBRijfueM40oeC0oiluWHxb0fBljcdwdc
	FNEpCz+HxeCANYC8jkcvmfo6QXjN/Ak+rg==
X-Google-Smtp-Source: 
 AGRyM1s/krAMghvuDsr1vJtQLJ72rpLRkuJCfDp//bC+cfcmPbemQ91Cn5cE2DCFtYpypJijRsD1yA==
X-Received: by 2002:a05:620a:258a:b0:6b6:641c:9edf with SMTP id
 x10-20020a05620a258a00b006b6641c9edfmr7869925qko.77.1659236801281;
        Sat, 30 Jul 2022 20:06:41 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a0bc600b006b5f68bc106sm5798052qki.110.2022.07.30.20.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 20:06:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH kirkstone 0/5] arm-bsp/trusted-firmware-a: N1SDP trusted
 boot
Date: Sat, 30 Jul 2022 23:05:43 -0400
Message-Id: <165923674540.386450.2686603004841687455.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727155643.2786523-1-adam.johnston@arm.com>
References: <20220727155643.2786523-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 31 Jul 2022 03:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3626

On Wed, 27 Jul 2022 16:56:38 +0100, adam.johnston@arm.com wrote:
> This patch re-configures the N1SDP for trusted boot, using the changes
> published by the Silicon Solutions team in N1SDP-2022.02.04 and up-streamed
> to trusted-firmware-a and scp-firmware.
> 
> arm-bsp/trusted-firmware-a: For N1SDP only, upgraded to 2.7.0 and configured
> for trusted boot
> 
> [...]

Applied, thanks!

[1/5] arm-bsp/trusted-firmware-a: N1SDP trusted boot
      commit: d9c6ff98c316da14d225290471c586da824797a2
[2/5] arm-bsp/scp-firmware: N1SDP trusted boot
      commit: 1e13b8b419d119a133882aa6db9d5ab17e4cb96c
[3/5] arm-bsp/sdcard-image-n1sdp: N1SDP trusted boot
      commit: 01aa5431d66c1dbcd5d8f87de16f49af5ccbb9ca
[4/5] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix aborts when accessing virtual memory
      commit: 2b392ebd3cf92cf1f62b53a13774649ca6be11dd
[5/5] arm-bsp/sdcard-image-n1sdp: Fix N1SDP dependencies
      commit: 6301b32aec4ff3b1c1545df6a0a5247a15491d14

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

