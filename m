Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6669C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 20:48:15 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.12030.1658868492919651345
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 13:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=NIcjsZMJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id b25so11916934qka.11
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 13:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aGXYe3OM50PWrK/kXvZrrg51OZu7eB6qiGHrO6cXsbk=;
        b=NIcjsZMJRLSuSE9RL1XESQk494h+6hCtYh3aB/LhVEDo9PgpapGFx29mHD+sxHSEHI
         kNTtmpu2Jm1BnHETg0QD0AShvVy5YN1j1FwV4lmvY3MDslJRjX/mg09Zr57GDBuvObW8
         sHFheUJK3tpakC6+BQhcukrAJRbM0Anw5/AI4/YeflgqtG7DrWeB150vSxThI1xwK8HB
         S/dCvqWrxgiDn/HWPoarbv/24hFZlDR+u5SDMUrGO3zH9rcesC8qpfs0vLXPaBSCUqGT
         ahBtmarCN1Zq0p24HneBy1rnIUPZIJIxdtuPMGgNHumASj+QpwyURze0LJ1GO3IQFAMM
         ysPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aGXYe3OM50PWrK/kXvZrrg51OZu7eB6qiGHrO6cXsbk=;
        b=2AFtOhLvzr5HHb8WUSOV/s7K+t/PsgZemqVqht7gWccS/DI4mibMTX6ATRZ+tvDPfk
         c7C9fHyJUKaDPxkCysKk8i8+IAIKnCUuLjTUey1rMbits1tZ8wCklIY7cLnw8ySvAUJ+
         dh/2PQ9HkiwsPOwsj81o0Xqf9XYE7cfBlvNc2ht/hkl482xrGsTEyHXHORlAn4lVWvGn
         vfcWv3L7Qc9fC0jDDCOL1qlUlGgO/BlrgZzU33oPXMirRu3ZrbXb7xwR4A3zxRHGZOYm
         +v0I/UUJgMvyn42Gs8w1iIsKDTuYN2rSWOpkJbxKJ/nm9mpjKYdUoM/uZZ4FT0VXn/dx
         ipqw==
X-Gm-Message-State: AJIora92CW+1SFjfcaBzogUpdqCODilX6Kg76OiWnMh83b5NqugHWfCy
	ymJfWgJJ0icxar1EWbhHDaN/OHgcwnRJXw==
X-Google-Smtp-Source: 
 AGRyM1tSfyOOvyF3HRgS3h8Y23MiOQ/NVQRaToK78jsbPEKwUMbIpYTzEWXcNmZy9w+rc0HSotxr9w==
X-Received: by 2002:a05:620a:410a:b0:6b6:3fdb:9852 with SMTP id
 j10-20020a05620a410a00b006b63fdb9852mr12949939qko.622.1658868491560;
        Tue, 26 Jul 2022 13:48:11 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a05620a400400b006b5652edb93sm12776359qko.48.2022.07.26.13.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:48:11 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/sdcard-image-n1sdp: Fix N1SDP dependencies
Date: Tue, 26 Jul 2022 16:47:59 -0400
Message-Id: <165886848111.1179859.6001028984170620950.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726144556.2543246-1-adam.johnston@arm.com>
References: <20220726144556.2543246-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 20:48:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3593

On Tue, 26 Jul 2022 15:45:55 +0100, adam.johnston@arm.com wrote:
> When enabling trusted boot, the UEFI binary was replaced with a FIP image
> (which contains the UEFI binary), therefore the SD card image should depend on
> trusted-firmware-a rather than edk2-firmware.
> 
> Adam Johnston (1):
>   arm-bsp/sdcard-image-n1sdp: Fix N1SDP dependencies
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/sdcard-image-n1sdp: Fix N1SDP dependencies
      commit: d11e253b11011265cf5e335d154c1103f1671320

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

