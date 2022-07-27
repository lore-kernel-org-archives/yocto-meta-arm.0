Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDE2C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 21:38:03 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.25327.1658957876279607433
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=s3SRdChP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id bz13so13578988qtb.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31cmj3bHwUcjanI2SgbxYjBJr0U7CxAA3aL9tf2RMx8=;
        b=s3SRdChPFjqqxFDBm5Cs41V0kaAWTrq7K/2901WRAbmHu44mr5FUUpcka8VtCgN8+N
         ZoFaY8Wvb+anYt9l/3stgXHp8OKBTUJM5O+0IMPTzIQNkN0t5RXeGyyRUDyyiHz2OVyn
         zRzBBJDLDwTg9Sie6sm2EZCxiWtzGk9sEj8d2aW+4BCzyXk80Zd+UenRTWFq16DdQ5+t
         480lJK28ACO2dgwDkioXjXwq6GldjZA1Nxl17Xbf7DuztOfDwgItQcCOPdRumMfQNc+A
         E6fheNDF6QrhJr+EIKwHIZD+cYLBEkN/XPvaTjb/68UR6KzxXQtzLz+a3AeSfjjgvN4A
         fTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31cmj3bHwUcjanI2SgbxYjBJr0U7CxAA3aL9tf2RMx8=;
        b=SPUipiPpdSD9F33VIhPqKCEB1EIWsZkr+6YaAxZM92GGEwy6iyAq8gExGyK4HSDk4v
         61CHWqYaDtECtk6kYe2GJjmYqz7U7954kUfP6NCtWs38hrpDi6JG+NsnXIPOF3Ak51hF
         QuHUHcmlDCbh2Rv9OVqGQmeL47NjrozaFdT5zz+Q0xv4R16aoF9KK/eyQc6HJD8rQqPU
         FM42nwC0SwbfC+pK968uyq/WtA1GKtxQ0hjN7E2QdeyRQqc5VCqJlxolLbhavF+GRtCj
         Gmuspne/3jJvFd6QqrC4qzdu/4jgksb4r4MQsiYjk/teA3fHg3bXaU23gHFESjK8etM+
         nD8A==
X-Gm-Message-State: AJIora8EvctS9ZQsSz+fHhT4S/D7pqOdP3lOfz+/GhWqGEK6YXBffY1g
	tl8hIFfvWuNHxE43bhNdPLsH0mU+x+NdLw==
X-Google-Smtp-Source: 
 AGRyM1uXqMIhhaemDHzxkffkVud4mixCYI/oN6dWDUKX6NU7LBIE1B0CepLHnjubZlY6iL65Nh8k5A==
X-Received: by 2002:a05:622a:110f:b0:31e:d7a5:59bd with SMTP id
 e15-20020a05622a110f00b0031ed7a559bdmr20761667qty.580.1658957874835;
        Wed, 27 Jul 2022 14:37:54 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 l15-20020ac84ccf000000b0031eb215a682sm9970183qtv.13.2022.07.27.14.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 14:37:54 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH kirkstone 0/5] arm-bsp/trusted-firmware-a: N1SDP trusted
 boot
Date: Wed, 27 Jul 2022 17:36:46 -0400
Message-Id: <165895780618.2769818.16271507673666009901.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727155643.2786523-1-adam.johnston@arm.com>
References: <20220727155643.2786523-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 21:38:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3605

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

